"""Recover this supported Lotus II ADF using its own m68k decompressors.

Run: python prepare_original.py PATH_TO_ADF
Requires unicorn==2.1.4, numpy, Pillow; capstone for optional disassembly.
"""
from pathlib import Path
import argparse,struct,json,hashlib
import numpy as np
from PIL import Image
from unicorn import Uc,UC_ARCH_M68K,UC_MODE_BIG_ENDIAN
from unicorn.m68k_const import *

EXPECTED='82dc1faf56823653cd3b0b299e179932c1fae117b03cae220e121d96ae8b3a06'

def cpu():
    u=Uc(UC_ARCH_M68K,UC_MODE_BIG_ENDIAN);u.ctl_set_cpu_model(UC_CPU_M68K_M68000);u.mem_map(0,0x1000000)
    u.reg_write(UC_M68K_REG_SR,0x2700);u.reg_write(UC_M68K_REG_A7,0x90000)
    return u

def unpack_boot(disk):
    u=cpu();u.mem_write(0x60000,disk[0xd3200:0xd3200+0x7600])
    u.emu_start(0x60008,0x104,count=10000000)
    if u.reg_read(UC_M68K_REG_PC)!=0x104:raise RuntimeError('Bootstrap did not return')
    memory=bytearray(u.mem_read(0,0x100000))
    memory[0x200:0x1a00]=memory[0x50000:0x51800]
    memory[0x727d8:0x80000]=memory[0x51800:0x5f028]
    return bytes(memory)

def unpack_assets(disk,resident,root):
    offsets=struct.unpack('>257I',resident[0x2c4:0x6c8]);nexts=resident[0x6c8:0x7c8];entries=[];palettes={}
    for idx in range(256):
        addr=offsets[idx];end=offsets[nexts[idx] if nexts[idx]!=255 else 256]
        start=addr-0x10964;length=end-addr
        if not addr or not 0<=start<len(disk) or length<=0 or start+length>len(disk):continue
        packed=disk[start:start+length];u=cpu();u.mem_write(0,resident);u.mem_write(0x100000,packed)
        for reg,value in [(UC_M68K_REG_A7,0x800000),(UC_M68K_REG_A0,0x100000),(UC_M68K_REG_A1,0x200000),(UC_M68K_REG_A2,0x400000),(UC_M68K_REG_A4,0),(UC_M68K_REG_D0,length),(UC_M68K_REG_D1,0x500000)]:u.reg_write(reg,value)
        u.mem_write(0x800000,struct.pack('>I',0xfffffe));u.emu_start(0x11bc,0xfffffe,count=15000000)
        size=u.reg_read(UC_M68K_REG_D0)
        if u.reg_read(UC_M68K_REG_PC)!=0xfffffe or not 0<size<0x200000:raise RuntimeError(f'Asset {idx} failed')
        data=bytes(u.mem_read(0x200000,size));(root/f'{idx:03}.bin').write_bytes(data)
        entries.append(dict(index=idx,offset=start,packed_size=length,format=packed[:2].decode('ascii',errors='replace'),size=size,sha256=hashlib.sha256(data).hexdigest()))
        if packed[:2]==b'SC':
            count=1<<int.from_bytes(packed[2:4],'big');words=struct.unpack(f'>{count}H',packed[12:12+2*count])
            palettes[str(idx)]=[color(v) for v in words]
    (root/'palettes.json').write_text(json.dumps(palettes))
    return entries,palettes

def color(v):return [((v>>8)&15)*17,((v>>4)&15)*17,(v&15)*17]

def music(root):
    samples={};manifest=[]
    for i in range(48,88):
        b=(root/f'{i:03}.bin').read_bytes();samples.setdefault(len(b),[]).append((i,b))
    for i in [36,37,38,40,41,42,43,44,45,46,47]:
        b=(root/f'{i:03}.bin').read_bytes()
        if b[1080:1084]!=b'M.K.' or len(b)!=1084+(max(b[952:1080])+1)*1024:raise RuntimeError('Unexpected MOD layout')
        result=bytearray(b);sources=[]
        for n in range(31):
            length=int.from_bytes(b[42+n*30:44+n*30],'big')*2
            if length:
                matches=samples[length]
                if len(matches)!=1:raise RuntimeError('Ambiguous sample bank')
                sid,sample=matches[0];result+=sample;sources.append(dict(instrument=n+1,asset=sid,size=length))
        name='title' if i==38 else ('intro' if i==36 else ('gameover' if i==37 else f'jingle-{i}'))
        (root/f'{name}.mod').write_bytes(result);manifest.append(dict(asset=i,name=name,bytes=len(result),sample_sources=sources))
    return manifest

def sprite(root,idx,palette,frame=0):
    b=(root/f'{idx:03}.bin').read_bytes();planes,ps=struct.unpack('>II',b[:8]);off,w,h=struct.unpack('>IHH',b[8+frame*8:16+frame*8]);stride=(w+15)//16*2
    pix=np.zeros((h,stride*8),dtype=np.uint8)
    for p in range(planes):pix|=np.unpackbits(np.frombuffer(b[8+off+p*ps:8+off+p*ps+stride*h],dtype=np.uint8).reshape(h,stride),axis=1)<<p
    mask=1<<(planes-1);rgba=np.zeros((h,w,4),dtype=np.uint8)
    rgba[:,:,:3]=np.array(palette,dtype=np.uint8)[pix[:,:w]&(mask-1)];rgba[:,:,3]=((pix[:,:w]&mask)!=0)*255
    return Image.fromarray(rgba)

def graphics(root,palettes):
    common=(root/'035.bin').read_bytes()
    for course in range(8):
        palette=[color(v) for v in struct.unpack('>16H',common[0x1a0+course*32:0x1c0+course*32])]
        for idx in range(112,256):
            path=root/f'{idx:03}.bin'
            if not path.exists():continue
            b=path.read_bytes()
            if len(b)<16:continue
            planes,ps,off,w,h=struct.unpack('>IIIHH',b[:16])
            if not 1<=planes<=5 or not 0<w<=400 or not 0<h<=400 or off<8:continue
            try:sprite(root,idx,palette).save(root/f'sprite-{course}-{idx}.png')
            except (ValueError,IndexError):pass
        for frame in range(9):sprite(root,126,palette,frame).save(root/f'sprite-{course}-126-v{frame}.png')
        b=(root/f'{16+course:03}.bin').read_bytes();pix=np.zeros((100,160),dtype=np.uint8)
        for p in range(5):pix|=np.unpackbits(np.frombuffer(b[p*2000:(p+1)*2000],dtype=np.uint8).reshape(100,20),axis=1)<<p
        Image.fromarray(np.array(palettes[str(16+course)],dtype=np.uint8)[pix]).save(root/f'backdrop-{course}.png')

def main():
    ap=argparse.ArgumentParser();ap.add_argument('adf');ap.add_argument('--output',type=Path,default=Path(__file__).parent);args=ap.parse_args()
    disk=Path(args.adf).read_bytes()
    if hashlib.sha256(disk).hexdigest()!=EXPECTED:raise SystemExit('Unsupported ADF variant: this extractor is verified only for the supplied SHA-256.')
    root=args.output/'assets';analysis=args.output/'analysis';root.mkdir(parents=True,exist_ok=True);analysis.mkdir(parents=True,exist_ok=True)
    # Initial rival records captured from the supplied game's PUAE pre-start state.
    (root/'reference-npc-start.bin').write_bytes(bytes.fromhex('0007c00000b00000fdcafffe0007620000400000006c000100070400ffc00000fc3700010006a600ff500000fc8300010006480000b0000002ee00020005ea0000400000ffef000200058c00ffc000000180000100052e00ff50000002d3fffe0004d00000b0000001b900010004720000400000fea30001'))
    # Forest sky: temporal median of original PUAE frames 50..450; HUD removed.
    import base64
    (root/'racing-sky-0.png').write_bytes(base64.b64decode('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'))
    resident=unpack_boot(disk);(root/'resident.bin').write_bytes(resident)
    entries,palettes=unpack_assets(disk,resident,root)
    (analysis/'asset-index.json').write_text(json.dumps(entries,indent=2))
    (analysis/'music-sources.json').write_text(json.dumps(music(root),indent=2));graphics(root,palettes)
    print(f'Recovered {len(entries)} assets, 11 MODs, 8 backdrops and sprite sheets into {args.output.resolve()}')

if __name__=='__main__':main()
