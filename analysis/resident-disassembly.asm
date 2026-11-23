0727d8 bra.b      $727e2
0727da ori.b      #$ec, d7
0727de ori.b      #$f8, d0
0727e2 lea.l      $7e426.l, a0
0727e8 lea.l      $7ed0a.l, a1
0727ee lea.l      $7f5ee.l, a2
0727f4 move.w     #$238, d7
0727f8 move.l     (a0), (a1)+
0727fa move.l     (a0)+, (a2)+
0727fc dbra       d7, $727f8
072800 lea.l      $7e42a.l, a0
072806 lea.l      $7ed0e.l, a1
07280c lea.l      $7f5f2.l, a2
072812 move.l     #$7fed2, d0
072818 moveq      #$7, d7
07281a move.w     d0, $6(a0)
07281e move.w     d0, $6(a1)
072822 move.w     d0, $6(a2)
072826 swap       d0
072828 move.w     d0, $2(a0)
07282c move.w     d0, $2(a1)
072830 move.w     d0, $2(a2)
072834 swap       d0
072836 addq.w     #$8, a0
072838 addq.w     #$8, a1
07283a addq.w     #$8, a2
07283c dbra       d7, $7281a
072840 move.l     #$1802, d0
072846 move.l     #$9b44, d1
07284c move.l     #$11e86, d2
072852 lea.l      $7e46a.l, a0
072858 lea.l      $7ed4e.l, a1
07285e lea.l      $7f632.l, a2
072864 moveq      #$3, d7
072866 move.w     d0, $6(a0)
07286a move.w     d1, $6(a1)
07286e move.w     d2, $6(a2)
072872 swap       d0
072874 swap       d1
072876 swap       d2
072878 move.w     d0, $2(a0)
07287c move.w     d1, $2(a1)
072880 move.w     d2, $2(a2)
072884 swap       d0
072886 swap       d1
072888 swap       d2
07288a addi.l     #$20d0, d0
072890 addi.l     #$20d0, d1
072896 addi.l     #$20d0, d2
07289c addq.w     #$8, a0
07289e addq.w     #$8, a1
0728a0 addq.w     #$8, a2
0728a2 dbra       d7, $72866
0728a6 lea.l      $7fede.l, a0
0728ac move.l     #$7fed2, d0
0728b2 moveq      #$7, d7
0728b4 move.w     d0, $6(a0)
0728b8 swap       d0
0728ba move.w     d0, $2(a0)
0728be swap       d0
0728c0 addq.l     #$8, a0
0728c2 dbra       d7, $728b4
0728c6 lea.l      $6df6e.l, a3
0728cc lea.l      $731ec.l, a4
0728d2 moveq      #$0, d1
0728d4 movea.l    #$200000, a0
0728da move.w     #$5555, d0
0728de move.w     d0, (a0)
0728e0 cmp.w      (a0), d0
0728e2 bne.b      $728ec
0728e4 add.w      d0, d0
0728e6 move.w     d0, (a0)
0728e8 cmp.w      (a0), d0
0728ea beq.b      $72930
0728ec movea.l    #$c00000, a0
0728f2 move.w     #$5555, d0
0728f6 move.w     d0, (a0)
0728f8 cmp.w      (a0), d0
0728fa bne.b      $72904
0728fc add.w      d0, d0
0728fe move.w     d0, (a0)
072900 cmp.w      (a0), d0
072902 beq.b      $72930
072904 move.w     $40000.l, d0
07290a move.w     d0, d3
07290c eori.w     #$ffff, d0
072910 move.w     d0, $c0000.l
072916 move.w     $c0000.l, d2
07291c cmp.w      d0, d2
07291e bne.b      $72932
072920 move.w     $40000.l, d0
072926 cmp.w      d0, d3
072928 bne.b      $72932
07292a movea.l    #$80000, a0
072930 moveq      #$1, d1
072932 move.l     a0, $7d968.l
072938 tst.w      d1
07293a beq.b      $729a8
07293c movea.l    $7d968.l, a3
072942 adda.l     #$8000, a3
072948 movea.l    $7d968.l, a4
07294e adda.l     #$d27e, a4
072954 move.l     $7d968.l, d0
07295a addi.l     #$17df6, d0
072960 movea.l    d0, a7
072962 move.l     a4, d0
072964 subi.l     #$731ec, d0
07296a add.l      d0, $7ec.w
07296e lea.l      $7cfe4.l, a0
072974 move.w     #$4bf, d7
072978 cmpi.w     #$21fc, (a0)
07297c bne.b      $7298a
07297e cmpi.w     #$6c, $6(a0)
072984 bne.b      $7298a
072986 add.l      d0, $2(a0)
07298a addq.l     #$2, a0
07298c dbra       d7, $72978
072990 lea.l      $731ec.l, a0
072996 movea.l    a4, a1
072998 move.l     #$53bb, d0
07299e move.w     (a0)+, (a1)+
0729a0 clr.w      -$2(a0)
0729a4 dbra       d0, $7299e
0729a8 move.l     a3, $7e41e.l
0729ae move.l     #$ca7e, d0
0729b4 lea.l      -$8000(a3), a0
0729b8 clr.b      (a0)+
0729ba subq.l     #$1, d0
0729bc bne.b      $729b8
0729be move.w     #$2000, $2b50(a3)
0729c4 move.w     #$40, $2b52(a3)
0729ca move.w     #$1, $2b3c(a3)
0729d0 move.w     #$1, $2b4c(a3)
0729d6 move.l     #$706c7931, $28c8(a3)
0729de move.l     #$20202020, $28cc(a3)
0729e6 move.l     #$20202020, $28d0(a3)
0729ee move.l     #$706c7932, $28bc(a3)
0729f6 move.l     #$20202020, $28c0(a3)
0729fe move.l     #$20202020, $28c4(a3)
072a06 move.l     #$6e6f6e65, $28b0(a3)
072a0e move.l     #$20202020, $28b4(a3)
072a16 move.l     #$20202020, $28b8(a3)
072a1e move.w     #$4, $2b2c(a3)
072a24 move.w     #$4, $2b2e(a3)
072a2a move.w     #$4, $2b30(a3)
072a30 lea.l      $72a9a(pc), a0
072a34 lea.l      $2b54(a3), a1
072a38 move.w     #$83, d7
072a3c move.w     (a0)+, (a1)+
072a3e dbra       d7, $72a3c
072a42 lea.l      $72ba2(pc), a0
072a46 lea.l      $28ec(a3), a1
072a4a move.w     #$8f, d7
072a4e move.l     (a0)+, (a1)+
072a50 dbra       d7, $72a4e
072a54 lea.l      $2838(a3), a0
072a58 moveq      #$5f, d7
072a5a move.b     #$20, (a0)+
072a5e dbra       d7, $72a5a
072a62 move.w     d1, $2cf2(a3)
072a66 lea.l      -$340e(a3), a0
072a6a move.l     a0, $7d964.l
072a70 tst.w      d1
072a72 beq.b      $72a94
072a74 movea.l    $7d968.l, a1
072a7a adda.l     #$17df6, a1
072a80 move.l     a1, -(a7)
072a82 lea.l      $72de2(pc), a0
072a86 move.w     #$204, d0
072a8a move.w     (a0)+, (a1)+
072a8c dbra       d0, $72a8a
072a90 movea.l    (a7)+, a1
072a92 jmp        (a4)
072a94 lea.l      $72de2(pc), a1
072a98 jmp        (a4)
072a9a moveq      #$6f, d2
072a9c bcc.b      $72aff
072a9e .byte      0x79, 0x73
072aa0 movea.l    -(a2), a0
072aa2 bcs.b      $72b17
072aa4 moveq      #$20, d2
072aa6 .byte      0x73, 0x63
072aa8 ble.b      $72b1c
072aaa bcs.b      $72b1f
072aac move.l     $2e2e(a6), d7
072ab0 move.l     $2031(a6), d7
072ab4 .byte      0x73, 0x74
072ab6 movea.l    ([$742e2e2e, a3]), a0
072abe move.l     $2e20(a6), d7
072ac2 move.w     $30(a0, d3.w), -(a2)
072ac6 move.w     $30(a0, d3.w), d0
072aca move.l     $64(a2, d6.l), d0
072ace movea.l    -(a1), a0
072ad0 bgt.b      $72b36
072ad2 moveq      #$65, d1
072ad4 .byte      0x77, 0x2e
072ad6 move.l     $2e20(a6), d7
072ada move.w     $30(a0, d3.w), d2
072ade move.w     $30(a0, d3.w), d0
072ae2 move.l     $64(a3, d7.w), d0
072ae6 movea.l    $65722e2e(a0, invalid.w), a0
072aee move.l     $2e20(a6), d7
072af2 move.w     $30(a0, d3.w), -(a1)
072af6 move.w     $30(a0, d3.w), d0
072afa move.l     $68(a4, d7.w), d0
072afe movea.l    $6572(a2), a0
072b02 bcs.b      $72b71
072b04 .byte      0x79, 0x2e
072b06 move.l     $2e20(a6), d7
072b0a move.w     $30(a5, d3.w), d1
072b0e move.w     $30(a0, d3.w), d0
072b12 move.l     $68(a5, d7.w), d0
072b16 movea.l    -(a1), a0
072b18 bgt.b      $72b7e
072b1a .byte      0x79, 0x20
072b1c .byte      0x75, 0x70
072b1e moveq      #$6f, d2
072b20 bgt.b      $72b42
072b22 move.w     $30(a0, d3.w), d1
072b26 move.w     $30(a0, d3.w), d0
072b2a move.l     $68(a6, d7.w), d0
072b2e movea.l    -(a4), a0
072b30 ble.b      $72ba7
072b32 beq.b      $72b62
072b34 move.l     $2e2e(a6), d7
072b38 move.l     -(a0), d7
072b3a move.w     $30(a5, d3.w), -(a0)
072b3e move.w     $30(a0, d3.w), d0
072b42 move.l     $68(a7, d7.w), d0
072b46 movea.l    $6963(a5), a0
072b4a bvc.b      $72bb1
072b4c bge.b      $72baf
072b4e bgt.b      $72bb7
072b50 move.l     -(a0), d7
072b52 move.w     $30(a0, d3.w), -(a0)
072b56 move.w     $30(a0, d3.w), d0
072b5a move.l     $7468.w, d0
072b5e movea.l    -(a4), a0
072b60 bsr.b      $72bd8
072b62 bcs.b      $72b84
072b64 blt.b      $72bc7
072b66 bmi.b      $72bd1
072b68 bgt.b      $72b8a
072b6a move.l     $30(a5, d3.w), d0
072b6e move.w     $30(a0, d3.w), d0
072b72 move.l     $74682077.l, d0
072b78 bcs.b      $72be8
072b7a bcc.b      $72bf5
072b7c move.l     $2e2e(a6), d7
072b80 move.l     -(a0), d7
072b82 move.l     $30(a2, d3.w), d0
072b86 move.w     $30(a0, d3.w), d0
072b8a move.w     $68(a0, d7.w), -(a0)
072b8e movea.l    $756c(a2), a0
072b92 bvs.b      $72bf5
072b94 movea.l    ([$6b20, a0]), a0
072b9a move.l     $30(a1, d3.w), d0
072b9e move.w     $30(a0, d3.w), d0
072ba2 ori.b      #$63, d0
072ba6 ori.b      #$63, d0
072baa ori.b      #$0, d0
072bae ori.b      #$0, d0
072bb2 ori.b      #$0, d0
072bb6 ori.b      #$0, d0
072bba ori.b      #$0, d0
072bbe ori.b      #$0, d0
072bc2 ori.b      #$0, d0
072bc6 ori.b      #$0, d0
072bca ori.b      #$0, d0
072bce ori.b      #$0, d0
072bd2 ori.b      #$0, d0
072bd6 ori.b      #$0, d0
072bda ori.b      #$0, d0
072bde ori.b      #$0, d0
072be2 ori.b      #$0, d0
072be6 ori.b      #$69, d0
072bea ori.b      #$69, d0
072bee ori.b      #$65, d0
072bf2 ori.b      #$65, d0
072bf6 ori.b      #$64, d0
072bfa ori.b      #$65, d0
072bfe ori.b      #$69, d0
072c02 ori.b      #$0, d0
072c06 ori.b      #$0, d0
072c0a ori.b      #$0, d0
072c0e ori.b      #$0, d0
072c12 ori.b      #$0, d0
072c16 ori.b      #$0, d0
072c1a ori.b      #$0, d0
072c1e ori.b      #$0, d0
072c22 ori.b      #$0, d0
072c26 ori.b      #$63, d0
072c2a ori.b      #$63, d0
072c2e ori.b      #$63, d0
072c32 ori.b      #$63, d0
072c36 ori.b      #$62, d0
072c3a ori.b      #$62, d0
072c3e ori.b      #$63, d0
072c42 ori.b      #$0, d0
072c46 ori.b      #$63, d0
072c4a ori.b      #$63, d0
072c4e ori.b      #$63, d0
072c52 ori.b      #$62, d0
072c56 ori.b      #$0, d0
072c5a ori.b      #$0, d0
072c5e ori.b      #$0, d0
072c62 ori.b      #$0, d0
072c66 ori.b      #$69, d0
072c6a ori.b      #$69, d0
072c6e ori.b      #$63, d0
072c72 ori.b      #$63, d0
072c76 ori.b      #$69, d0
072c7a ori.b      #$0, d0
072c7e ori.b      #$6b, d0
072c82 ori.b      #$0, d0
072c86 ori.b      #$0, d0
072c8a ori.b      #$0, d0
072c8e ori.b      #$0, d0
072c92 ori.b      #$0, d0
072c96 ori.b      #$0, d0
072c9a ori.b      #$0, d0
072c9e ori.b      #$0, d0
072ca2 ori.b      #$0, d0
072ca6 ori.b      #$0, d0
072caa ori.b      #$69, d0
072cae ori.b      #$69, d0
072cb2 ori.b      #$69, d0
072cb6 ori.b      #$6b, d0
072cba ori.b      #$6a, d0
072cbe ori.b      #$6a, d0
072cc2 ori.b      #$0, d0
072cc6 ori.b      #$0, d0
072cca ori.b      #$63, d0
072cce ori.b      #$0, d0
072cd2 ori.b      #$0, d0
072cd6 ori.b      #$0, d0
072cda ori.b      #$0, d0
072cde ori.b      #$0, d0
072ce2 ori.b      #$0, d0
072ce6 ori.b      #$69, d0
072cea ori.b      #$69, d0
072cee ori.b      #$69, d0
072cf2 ori.b      #$69, d0
072cf6 ori.b      #$65, d0
072cfa ori.b      #$6a, d0
072cfe ori.b      #$6a, d0
072d02 ori.b      #$0, d0
072d06 ori.b      #$0, d0
072d0a ori.b      #$0, d0
072d0e ori.b      #$0, d0
072d12 ori.b      #$0, d0
072d16 ori.b      #$0, d0
072d1a ori.b      #$0, d0
072d1e ori.b      #$0, d0
072d22 ori.b      #$0, d0
072d26 ori.b      #$63, d0
072d2a ori.b      #$63, d0
072d2e ori.b      #$0, d0
072d32 ori.b      #$65, d0
072d36 ori.b      #$63, d0
072d3a ori.b      #$63, d0
072d3e ori.b      #$63, d0
072d42 ori.b      #$0, d0
072d46 ori.b      #$0, d0
072d4a ori.b      #$65, d0
072d4e ori.b      #$0, d0
072d52 ori.b      #$0, d0
072d56 ori.b      #$0, d0
072d5a ori.b      #$0, d0
072d5e ori.b      #$0, d0
072d62 ori.b      #$0, d0
072d66 ori.b      #$69, d0
072d6a ori.b      #$69, d0
072d6e ori.b      #$69, d0
072d72 ori.b      #$69, d0
072d76 ori.b      #$6c, d0
072d7a ori.b      #$69, d0
072d7e ori.b      #$63, d0
072d82 ori.b      #$0, d0
072d86 ori.b      #$0, d0
072d8a ori.b      #$0, d0
072d8e ori.b      #$0, d0
072d92 ori.b      #$0, d0
072d96 ori.b      #$0, d0
072d9a ori.b      #$0, d0
072d9e ori.b      #$0, d0
072da2 ori.b      #$0, d0
072da6 ori.b      #$0, d0
072daa ori.b      #$69, d0
072dae ori.b      #$0, d0
072db2 ori.b      #$0, d0
072db6 ori.b      #$0, d0
072dba ori.b      #$0, d0
072dbe ori.b      #$0, d0
072dc2 ori.b      #$0, d0
072dc6 ori.b      #$0, d0
072dca ori.b      #$0, d0
072dce ori.b      #$0, d0
072dd2 ori.b      #$0, d0
072dd6 ori.b      #$0, d0
072dda ori.b      #$0, d0
072dde ori.b      #$0, d0
072de2 lea.l      $dff000.l, a6
072de8 bsr.w      $731e6
072dec move.w     #$83e0, $96(a6)
072df2 move.b     #$1, $bfee01.l
072dfa move.l     #$1c106, $2fc0(a3)
072e02 move.l     #$10586, $2fc4(a3)
072e0a tst.w      $2cf2(a3)
072e0e beq.b      $72e18
072e10 bsr.w      $73084
072e14 bsr.w      $730dc
072e18 bsr.w      $73166
072e1c bsr.w      $73184
072e20 bsr.w      $7319c
072e24 bsr.w      $731d8
072e28 move.l     #$7feda, $80(a6)
072e30 bra.b      $72ea4
072e32 bsr.w      $72f14
072e36 movea.l    #$1c106, a0
072e3c moveq      #$5, d0
072e3e bsr.w      $72ee0
072e42 clr.w      $2fd0.l
072e48 bsr.b      $72ea6
072e4a bsr.w      $72f5e
072e4e bsr.b      $72ebc
072e50 addq.w     #$1, $2fd0(a3)
072e54 cmpi.w     #$96, $2fd0(a3)
072e5a bne.b      $72e48
072e5c lea.l      $4d0c6.l, a1
072e62 lea.l      $31f6(a3), a0
072e66 moveq      #$7, d7
072e68 move.w     (a1)+, (a0)+
072e6a dbra       d7, $72e68
072e6e bsr.w      $72f14
072e72 bsr.b      $72ebc
072e74 moveq      #$0, d0
072e76 suba.l     a0, a0
072e78 bsr.b      $72ee0
072e7a clr.w      $2fd0(a3)
072e7e bsr.b      $72ea6
072e80 bsr.w      $7300c
072e84 bsr.b      $72ebc
072e86 addq.w     #$1, $2fd0(a3)
072e8a cmpi.w     #$fa, $2fd0(a3)
072e90 bne.b      $72e7e
072e92 lea.l      $4d0d6.l, a1
072e98 lea.l      $31f6(a3), a0
072e9c moveq      #$1f, d7
072e9e move.w     (a1)+, (a0)+
072ea0 dbra       d7, $72e9e
072ea4 rts        
072ea6 move.w     $4(a6), d0
072eaa andi.w     #$1, d0
072eae beq.b      $72ea6
072eb0 move.w     $4(a6), d0
072eb4 andi.w     #$1, d0
072eb8 bne.b      $72eb0
072eba rts        
072ebc lea.l      $7ff72.l, a0
072ec2 lea.l      $5800.l, a1
072ec8 move.w     $2fea(a3), d0
072ecc mulu.w     #$40, d0
072ed0 adda.w     d0, a1
072ed2 moveq      #$1f, d7
072ed4 move.w     (a1)+, $2(a0)
072ed8 addq.w     #$4, a0
072eda dbra       d7, $72ed4
072ede rts        
072ee0 move.w     d0, d1
072ee2 asl.w      #$4, d1
072ee4 asl.w      #$8, d1
072ee6 ori.w      #$200, d1
072eea move.w     d1, $7ff20.l
072ef0 lea.l      $7ff42.l, a1
072ef6 move.l     a0, d1
072ef8 bra.b      $72f0e
072efa move.w     d1, $6(a1)
072efe swap       d1
072f00 move.w     d1, $2(a1)
072f04 swap       d1
072f06 addq.w     #$8, a1
072f08 addi.l     #$1f40, d1
072f0e dbra       d0, $72efa
072f12 rts        
072f14 lea.l      $31f6(a3), a0
072f18 lea.l      $5800.l, a1
072f1e moveq      #$0, d6
072f20 movea.l    a0, a2
072f22 moveq      #$1f, d7
072f24 move.w     (a2)+, d0
072f26 move.w     d0, d1
072f28 move.w     d0, d2
072f2a andi.w     #$f00, d0
072f2e mulu.w     d6, d0
072f30 andi.w     #$f000, d0
072f34 andi.w     #$f0, d1
072f38 mulu.w     d6, d1
072f3a andi.w     #$f00, d1
072f3e andi.w     #$f, d2
072f42 mulu.w     d6, d2
072f44 andi.w     #$f0, d2
072f48 add.w      d1, d0
072f4a add.w      d2, d0
072f4c lsr.w      #$4, d0
072f4e move.w     d0, (a1)+
072f50 dbra       d7, $72f24
072f54 addq.w     #$2, d6
072f56 cmp.w      #$12, d6
072f5a bne.b      $72f20
072f5c rts        
072f5e move.w     $2fd0(a3), d0
072f62 asr.w      #$2, d0
072f64 subi.w     #$c, d0
072f68 bmi.b      $72fbe
072f6a cmp.w      #$c, d0
072f6e bcc.b      $72fbe
072f70 lea.l      $73000(pc), a0
072f74 move.b     (a0, d0.w), d0
072f78 bmi.b      $72fbe
072f7a lea.l      $1ce5c.l, a0
072f80 cmp.w      #$4, d0
072f84 bcs.b      $72f8c
072f86 lea.l      $1d248.l, a0
072f8c lea.l      $25d46.l, a1
072f92 asl.w      #$4, d0
072f94 adda.w     d0, a1
072f96 moveq      #$7, d7
072f98 move.w     (a1), (a0)
072f9a move.w     $80(a1), $1f40(a0)
072fa0 move.w     $100(a1), $3e80(a0)
072fa6 move.w     $180(a1), $5dc0(a0)
072fac move.w     $200(a1), $7d00(a0)
072fb2 adda.w     #$2, a1
072fb6 adda.w     #$28, a0
072fba dbra       d7, $72f98
072fbe move.w     $2fd0(a3), d0
072fc2 cmp.w      #$a, d0
072fc6 bmi.b      $72fda
072fc8 cmp.w      #$12, d0
072fcc bmi.b      $72fe8
072fce cmp.w      #$8c, d0
072fd2 bmi.b      $72fe0
072fd4 cmp.w      #$94, d0
072fd8 bmi.b      $72ff2
072fda clr.w      $2fea(a3)
072fde rts        
072fe0 move.w     #$8, $2fea(a3)
072fe6 rts        
072fe8 subi.w     #$a, d0
072fec move.w     d0, $2fea(a3)
072ff0 rts        
072ff2 subi.w     #$8c, d0
072ff6 eori.w     #$7, d0
072ffa move.w     d0, $2fea(a3)
072ffe rts        
073000 btst.l     d0, d2
073002 btst.l     d1, d2
073004 btst.l     d0, d0
073006 btst.l     d2, d6
073008 btst.l     d3, d6
07300a btst.l     d2, d4
07300c move.w     $2fd0(a3), d0
073010 subi.w     #$32, d0
073014 cmp.w      #$3c, d0
073018 beq.b      $73042
07301a bcc.b      $7304e
07301c ext.l      d0
07301e divu.w     #$3, d0
073022 swap       d0
073024 tst.w      d0
073026 bne.b      $7304e
073028 swap       d0
07302a mulu.w     #$1f40, d0
07302e lea.l      $25fc6.l, a0
073034 adda.l     d0, a0
073036 moveq      #$1, d0
073038 bsr.w      $72ee0
07303c bsr.w      $72ebc
073040 bra.b      $7304e
073042 lea.l      $a7c6.l, a0
073048 moveq      #$3, d0
07304a bsr.w      $72ee0
07304e move.w     $2fd0(a3), d0
073052 cmp.w      #$f0, d0
073056 bmi.b      $73064
073058 cmp.w      #$f8, d0
07305c bmi.b      $73076
07305e clr.w      $2fea(a3)
073062 rts        
073064 move.w     #$8, $2fea(a3)
07306a rts        
07306c subi.w     #$a, d0
073070 move.w     d0, $2fea(a3)
073074 rts        
073076 subi.w     #$f0, d0
07307a eori.w     #$7, d0
07307e move.w     d0, $2fea(a3)
073082 rts        
073084 lea.l      $7dc50.l, a0
07308a lea.l      $7dd28.l, a1
073090 lea.l      $7e088.l, a2
073096 move.l     $7d968.l, d1
07309c addi.l     #$18200, d1
0730a2 move.w     (a0)+, d0
0730a4 beq.b      $730d4
0730a6 move.w     d0, d2
0730a8 andi.w     #$ff, d0
0730ac move.l     d1, (a1)+
0730ae movem.l    d0-d7/a0-a6, -(a7)
0730b2 andi.w     #$100, d2
0730b6 beq.b      $730c0
0730b8 jsr        $7db58.l
0730be bra.b      $730c6
0730c0 jsr        $7dbb0.l
0730c6 movem.l    (a7)+, d0-d7/a0-a6
0730ca move.l     $2cec(a3), (a2)+
0730ce add.l      $2cec(a3), d1
0730d2 bra.b      $730a2
0730d4 move.w     #$1, $2cf0(a3)
0730da rts        
0730dc clr.w      $2fec(a3)
0730e0 move.l     #$65f6e, $2fee(a3)
0730e8 lea.l      $7e3e8.l, a0
0730ee lea.l      $7e3fa.l, a1
0730f4 move.w     $2fec(a3), d3
0730f8 add.w      d3, d3
0730fa move.w     (a0, d3.w), d0
0730fe beq.b      $73124
073100 move.w     $2fec(a3), d3
073104 asl.w      #$2, d3
073106 move.l     $2fee(a3), (a1, d3.w)
07310c move.l     $2fee(a3), d1
073110 jsr        $7db4c.l
073116 move.l     $2cec(a3), d7
07311a add.l      d7, $2fee(a3)
07311e addq.w     #$1, $2fec(a3)
073122 bra.b      $730e8
073124 rts        
073126 moveq      #$0, d0
073128 move.l     #$1c106, d1
07312e jsr        $7db4c.l
073134 rts        
073136 moveq      #$1, d0
073138 move.l     #$25d46, d1
07313e jsr        $7db4c.l
073144 rts        
073146 moveq      #$2, d0
073148 move.l     #$25fc6, d1
07314e jsr        $7db4c.l
073154 rts        
073156 moveq      #$3, d0
073158 move.l     #$a7c6, d1
07315e jsr        $7db4c.l
073164 rts        
073166 moveq      #$e, d0
073168 move.l     #$64746, d1
07316e jsr        $7db4c.l
073174 moveq      #$f, d0
073176 lea.l      $3236(a3), a0
07317a move.l     a0, d1
07317c jsr        $7db4c.l
073182 rts        
073184 lea.l      $64746.l, a0
07318a lea.l      $640d6.l, a1
073190 move.w     #$19b, d7
073194 move.l     (a0)+, (a1)+
073196 dbra       d7, $73194
07319a rts        
07319c moveq      #$27, d0
07319e move.l     #$62b40, d1
0731a4 move.l     d1, $7d970.l
0731aa jsr        $7db4c.l
0731b0 moveq      #$24, d0
0731b2 move.l     #$4e5d6, d1
0731b8 move.l     d1, $7d96c.l
0731be jsr        $7db4c.l
0731c4 movea.l    $7d96c.l, a0
0731ca adda.l     $2cec(a3), a0
0731ce clr.w      d0
0731d0 jsr        $7d978.l
0731d6 rts        
0731d8 moveq      #$4, d0
0731da move.l     $2fc4(a3), d1
0731de jsr        $7db4c.l
0731e4 rts        
0731e6 jsr        $a00.w
0731ea rts        
0731ec jsr        (a1)
0731ee bra.w      $73dac
0731f2 jsr        $a00.w
0731f6 rts        
0731f8 jsr        $a04.w
0731fc rts        
0731fe move.b     d0, $2c8b(a3)
073202 rts        
073204 move.b     $2c8a(a3), d0
073208 move.b     #$0, $2c8a(a3)
07320e tst.b      d0
073210 rts        
073212 lea.l      $2c8c(a3), a0
073216 move.l     #$fffefffe, d0
07321c move.l     d0, (a0)+
07321e move.l     d0, (a0)+
073220 clr.w      $30f2(a3)
073224 clr.w      $31c6(a3)
073228 move.w     #$ffff, $30f0(a3)
07322e move.w     #$ffff, $31c4(a3)
073234 moveq      #$60, d0
073236 bsr.w      $73740
07323a tst.w      $3038(a3)
07323e beq.b      $73246
073240 moveq      #$60, d0
073242 bsr.w      $73740
073246 tst.w      $2de6(a3)
07324a bne.b      $73256
07324c tst.w      $2dec(a3)
073250 beq.b      $7325c
073252 moveq      #$51, d0
073254 bra.b      $73258
073256 moveq      #$50, d0
073258 bsr.w      $73740
07325c andi.b     #$fd, $bfe001.l
073264 moveq      #$2, d0
073266 tst.w      $2de4(a3)
07326a beq.b      $7326e
07326c moveq      #$0, d0
07326e or.b       d0, $bfe001.l
073274 rts        
073276 move.l     $3046(a3), d3
07327a sub.l      $303e(a3), d3
07327e move.l     $311a(a3), d4
073282 sub.l      $3112(a3), d4
073286 move.w     $306a(a3), d0
07328a move.w     $313e(a3), d1
07328e tst.w      $2f8a(a3)
073292 bpl.b      $732ca
073294 move.w     $3088(a3), d1
073298 move.w     $308a(a3), d2
07329c bsr.w      $733b4
0732a0 move.w     d2, $308a(a3)
0732a4 move.w     d1, $3088(a3)
0732a8 tst.w      $3038(a3)
0732ac beq.b      $732c2
0732ae move.w     $315c(a3), d1
0732b2 move.w     $315e(a3), d2
0732b6 bsr.w      $733b4
0732ba move.w     d2, $315e(a3)
0732be move.w     d1, $315c(a3)
0732c2 move.w     $308a(a3), d0
0732c6 move.w     $315e(a3), d1
0732ca tst.w      d0
0732cc bne.b      $732d2
0732ce move.w     #$3e8, d0
0732d2 move.l     #$fcc3a, d2
0732d8 divu.w     d0, d2
0732da cmp.w      #$7c, d2
0732de bcc.b      $732e2
0732e0 moveq      #$7c, d2
0732e2 move.w     d2, $a6(a6)
0732e6 tst.w      $2f88(a3)
0732ea bne.b      $73318
0732ec tst.w      $2f8a(a3)
0732f0 bmi.b      $73304
0732f2 tst.w      $2f88(a3)
0732f6 bne.b      $73318
0732f8 tst.w      $3058(a3)
0732fc beq.b      $73304
0732fe tst.w      $304c(a3)
073302 beq.b      $73318
073304 tst.l      d3
073306 bpl.b      $7330a
073308 neg.l      d3
07330a asl.l      #$4, d3
07330c swap       d3
07330e subi.w     #$40, d3
073312 neg.w      d3
073314 tst.w      d3
073316 bpl.b      $7331a
073318 clr.w      d3
07331a move.w     d3, $a8(a6)
07331e moveq      #$60, d0
073320 tst.w      $3062(a3)
073324 beq.b      $73328
073326 moveq      #$61, d0
073328 asl.w      #$2, d0
07332a lea.l      $2438(a3), a0
07332e movea.l    (a0, d0.w), a0
073332 adda.w     #$e, a0
073336 move.l     a0, $a0(a6)
07333a tst.w      $3038(a3)
07333e beq.b      $733b0
073340 tst.w      d1
073342 bne.b      $73348
073344 move.w     #$3e8, d1
073348 move.l     #$fcc3a, d2
07334e divu.w     d1, d2
073350 cmp.w      #$7c, d2
073354 bcc.b      $73358
073356 moveq      #$7c, d2
073358 move.w     d2, $b6(a6)
07335c tst.w      $2f88(a3)
073360 bne.b      $7338e
073362 tst.w      $2f8a(a3)
073366 bmi.b      $7337a
073368 tst.w      $2f88(a3)
07336c bne.b      $7338e
07336e tst.w      $312c(a3)
073372 beq.b      $7337a
073374 tst.w      $3120(a3)
073378 beq.b      $7338e
07337a tst.l      d4
07337c bpl.b      $73380
07337e neg.l      d4
073380 asl.l      #$4, d4
073382 swap       d4
073384 subi.w     #$40, d4
073388 neg.w      d4
07338a tst.w      d4
07338c bpl.b      $73390
07338e clr.w      d4
073390 move.w     d4, $b8(a6)
073394 moveq      #$60, d0
073396 tst.w      $3136(a3)
07339a beq.b      $7339e
07339c moveq      #$61, d0
07339e asl.w      #$2, d0
0733a0 lea.l      $2438(a3), a0
0733a4 movea.l    (a0, d0.w), a0
0733a8 adda.w     #$e, a0
0733ac move.l     a0, $b0(a6)
0733b0 rts        
0733b2 rts        
0733b4 tst.w      d1
0733b6 beq.b      $733dc
0733b8 cmp.w      #$1388, d2
0733bc bcs.b      $733cc
0733be bsr.w      $78c64
0733c2 cmp.w      #$1000, d0
0733c6 bcc.b      $733cc
0733c8 not.w      d1
0733ca bra.b      $733fe
0733cc move.w     #$1f40, d7
0733d0 sub.w      d2, d7
0733d2 mulu.w     #$a00, d7
0733d6 swap       d7
0733d8 add.w      d7, d2
0733da bra.b      $733fe
0733dc mulu.w     #$fc00, d2
0733e0 swap       d2
0733e2 cmp.w      #$3e8, d2
0733e6 bcc.b      $733ec
0733e8 move.w     #$3e8, d2
0733ec cmp.w      #$bb8, d2
0733f0 bcc.b      $733fe
0733f2 bsr.w      $78c64
0733f6 cmp.w      #$1000, d0
0733fa bcc.b      $733fe
0733fc not.w      d1
0733fe rts        
073400 tst.w      $2de4(a3)
073404 beq.b      $73430
073406 move.w     $2cf8(a3), d0
07340a andi.w     #$3ff, d0
07340e bne.b      $73430
073410 move.w     $2cf8(a3), d0
073414 lsr.w      #$8, d0
073416 lsr.w      #$2, d0
073418 cmp.w      #$9, d0
07341c bpl.b      $73430
07341e lea.l      $2188(a3), a0
073422 movea.l    a0, a1
073424 asl.w      #$6, d0
073426 adda.w     d0, a0
073428 moveq      #$f, d7
07342a move.l     (a0)+, (a1)+
07342c dbra       d7, $7342a
073430 cmpi.w     #$2, $2dcc(a3)
073436 beq.b      $73468
073438 move.w     $3060(a3), d0
07343c bne.b      $73450
07343e move.w     $305e(a3), d0
073442 beq.b      $73450
073444 cmp.w      #$9, d0
073448 bpl.b      $73450
07344a moveq      #$6f, d0
07344c bsr.w      $73740
073450 move.w     $3134(a3), d0
073454 bne.b      $73468
073456 move.w     $3132(a3), d0
07345a beq.b      $73468
07345c cmp.w      #$9, d0
073460 bpl.b      $73468
073462 moveq      #$6f, d0
073464 bsr.w      $73740
073468 move.w     $2f8a(a3), d0
07346c cmp.w      #$ff6a, d0
073470 bne.b      $73476
073472 moveq      #$58, d0
073474 bra.b      $734e0
073476 cmp.w      #$ffb5, d0
07347a bne.b      $73480
07347c moveq      #$59, d0
07347e bra.b      $734e0
073480 cmp.w      #$0, d0
073484 bne.b      $7348a
073486 moveq      #$5a, d0
073488 bra.b      $734e0
07348a cmpi.w     #$7f, $30e6(a3)
073490 beq.b      $7349a
073492 cmpi.w     #$7f, $31ba(a3)
073498 bne.b      $734a6
07349a tst.w      $2cf2(a3)
07349e beq.b      $734a6
0734a0 moveq      #$5b, d0
0734a2 bsr.w      $73740
0734a6 tst.w      $30e6(a3)
0734aa beq.b      $734b0
0734ac subq.w     #$1, $30e6(a3)
0734b0 tst.w      $31ba(a3)
0734b4 beq.b      $734ba
0734b6 subq.w     #$1, $31ba(a3)
0734ba move.w     $30e6(a3), d0
0734be andi.w     #$7, d0
0734c2 cmp.w      #$7, d0
0734c6 bne.b      $734cc
0734c8 moveq      #$66, d0
0734ca bra.b      $734e6
0734cc move.w     $31ba(a3), d0
0734d0 andi.w     #$7, d0
0734d4 cmp.w      #$7, d0
0734d8 bne.b      $734de
0734da moveq      #$66, d0
0734dc bra.b      $734e6
0734de bra.b      $734ea
0734e0 tst.w      $2cf2(a3)
0734e4 beq.b      $734ea
0734e6 bsr.w      $73740
0734ea tst.w      $2de6(a3)
0734ee bne.w      $73668
0734f2 tst.w      $307a(a3)
0734f6 bne.w      $73584
0734fa move.w     $302e(a3), d0
0734fe asl.w      #$4, d0
073500 subi.w     #$50, d0
073504 move.w     d0, d5
073506 move.w     d5, d4
073508 neg.w      d4
07350a move.w     $3042(a3), d0
07350e cmp.w      d5, d0
073510 bpl.b      $73516
073512 cmp.w      d4, d0
073514 bpl.b      $73584
073516 tst.w      $2dea(a3)
07351a beq.b      $7356a
07351c tst.w      $310a(a3)
073520 bne.b      $73588
073522 tst.w      $30fe(a3)
073526 bne.b      $73588
073528 move.w     $303e(a3), d0
07352c asl.w      #$4, d0
07352e lea.l      -$1e78(a3), a1
073532 move.w     $a(a1, d0.w), d1
073536 move.w     $3040(a3), d0
07353a lsr.w      #$8, d0
07353c lsr.w      #$6, d0
07353e eori.w     #$3, d0
073542 asl.w      #$2, d0
073544 lsr.w      d0, d1
073546 andi.w     #$f, d1
07354a cmp.w      #$2, d1
07354e bne.b      $7356a
073550 moveq      #$64, d0
073552 bsr.w      $73740
073556 move.w     $3042(a3), $3100(a3)
07355c move.w     #$1, $30fe(a3)
073562 move.w     #$1, $310a(a3)
073568 bra.b      $73588
07356a move.l     $303e(a3), d0
07356e cmp.l      $3084(a3), d0
073572 bmi.b      $73584
073574 ori.l      #$3fff, d0
07357a move.l     d0, $3084(a3)
07357e moveq      #$67, d0
073580 bsr.w      $73740
073584 clr.w      $310a(a3)
073588 tst.w      $314e(a3)
07358c bne.b      $73608
07358e move.w     $3116(a3), d0
073592 cmp.w      d5, d0
073594 bpl.b      $7359a
073596 cmp.w      d4, d0
073598 bpl.b      $73608
07359a tst.w      $2dea(a3)
07359e beq.b      $735ee
0735a0 tst.w      $31de(a3)
0735a4 bne.b      $7360c
0735a6 tst.w      $31d2(a3)
0735aa bne.b      $7360c
0735ac move.w     $3112(a3), d0
0735b0 asl.w      #$4, d0
0735b2 lea.l      -$1e78(a3), a1
0735b6 move.w     $a(a1, d0.w), d1
0735ba move.w     $3114(a3), d0
0735be lsr.w      #$8, d0
0735c0 lsr.w      #$6, d0
0735c2 eori.w     #$3, d0
0735c6 asl.w      #$2, d0
0735c8 lsr.w      d0, d1
0735ca andi.w     #$f, d1
0735ce cmp.w      #$2, d1
0735d2 bne.b      $735ee
0735d4 moveq      #$64, d0
0735d6 bsr.w      $73740
0735da move.w     $3116(a3), $31d4(a3)
0735e0 move.w     #$1, $31d2(a3)
0735e6 move.w     #$1, $31de(a3)
0735ec bra.b      $7360c
0735ee move.l     $3112(a3), d0
0735f2 cmp.l      $3158(a3), d0
0735f6 bmi.b      $73608
0735f8 ori.l      #$3fff, d0
0735fe move.l     d0, $3158(a3)
073602 moveq      #$67, d0
073604 bsr.w      $73740
073608 clr.w      $31de(a3)
07360c tst.w      $2de8(a3)
073610 beq.b      $73668
073612 moveq      #$40, d5
073614 moveq      #$c0, d4
073616 move.w     $3042(a3), d0
07361a cmp.w      d5, d0
07361c bpl.b      $7363c
07361e cmp.w      d4, d0
073620 bmi.b      $7363c
073622 move.l     $303e(a3), d0
073626 cmp.l      $3084(a3), d0
07362a bmi.b      $7363c
07362c ori.l      #$3fff, d0
073632 move.l     d0, $3084(a3)
073636 moveq      #$67, d0
073638 bsr.w      $73740
07363c tst.w      $314e(a3)
073640 bne.b      $73668
073642 move.w     $3116(a3), d0
073646 cmp.w      d5, d0
073648 bpl.b      $73668
07364a cmp.w      d4, d0
07364c bmi.b      $73668
07364e move.l     $3112(a3), d0
073652 cmp.l      $3158(a3), d0
073656 bmi.b      $73668
073658 ori.l      #$3fff, d0
07365e move.l     d0, $3158(a3)
073662 moveq      #$67, d0
073664 bsr.w      $73740
073668 tst.w      $2dec(a3)
07366c beq.b      $7369e
07366e move.w     $2cf8(a3), d0
073672 andi.w     #$3, d0
073676 bne.b      $7369e
073678 lea.l      $24e0(a3), a0
07367c tst.w      $2f88(a3)
073680 bne.b      $7369a
073682 bsr.w      $78c18
073686 andi.w     #$3f, d0
07368a cmp.w      #$3, d0
07368e bcc.b      $7369a
073690 moveq      #$6d, d0
073692 bsr.w      $73740
073696 movea.l    $2574(a3), a0
07369a move.l     a0, $2c74(a3)
07369e tst.w      $2de6(a3)
0736a2 bne.b      $736ac
0736a4 tst.w      $2dec(a3)
0736a8 bne.b      $736f6
0736aa rts        
0736ac moveq      #$0, d0
0736ae tst.w      $2f88(a3)
0736b2 bne.b      $736e2
0736b4 bsr.w      $78c18
0736b8 cmp.w      #$400, d0
0736bc bcc.b      $736c2
0736be not.w      $2b52(a3)
0736c2 move.w     $2b52(a3), d0
0736c6 add.w      $2b50(a3), d0
0736ca cmp.w      #$400, d0
0736ce bpl.b      $736d4
0736d0 move.w     #$400, d0
0736d4 cmp.w      #$2000, d0
0736d8 bmi.b      $736de
0736da move.w     #$2000, d0
0736de move.w     d0, $2b50(a3)
0736e2 lsr.w      #$8, d0
0736e4 tst.w      $3038(a3)
0736e8 bne.b      $736f0
0736ea move.w     d0, $b8(a6)
0736ee bra.b      $736f4
0736f0 move.w     d0, $c8(a6)
0736f4 rts        
0736f6 moveq      #$0, d0
0736f8 tst.w      $2f88(a3)
0736fc bne.b      $7372c
0736fe bsr.w      $78c18
073702 cmp.w      #$400, d0
073706 bcc.b      $7370c
073708 not.w      $2b52(a3)
07370c move.w     $2b52(a3), d0
073710 add.w      $2b50(a3), d0
073714 cmp.w      #$2000, d0
073718 bpl.b      $7371e
07371a move.w     #$2000, d0
07371e cmp.w      #$4000, d0
073722 bmi.b      $73728
073724 move.w     #$4000, d0
073728 move.w     d0, $2b50(a3)
07372c lsr.w      #$8, d0
07372e tst.w      $3038(a3)
073732 bne.b      $7373a
073734 move.w     d0, $b8(a6)
073738 bra.b      $7373e
07373a move.w     d0, $c8(a6)
07373e rts        
073740 tst.w      $2f40(a3)
073744 bne.b      $737b0
073746 movem.l    d1-d2/d7/a0-a1, -(a7)
07374a move.w     d0, d1
07374c asl.w      #$2, d1
07374e lea.l      $2438(a3), a1
073752 movea.l    (a1, d1.w), a1
073756 move.w     $c(a1), d2
07375a lea.l      $2c8c(a3), a0
07375e moveq      #$0, d7
073760 move.w     (a0, d7.w), d1
073764 cmp.w      #$fffe, d1
073768 beq.b      $7379a
07376a addq.w     #$2, d7
07376c cmp.w      #$8, d7
073770 bne.b      $73760
073772 moveq      #$0, d7
073774 move.w     (a0, d7.w), d1
073778 cmp.w      $10(a0, d7.w), d1
07377c bpl.b      $7379a
07377e addq.w     #$2, d7
073780 cmp.w      #$8, d7
073784 bne.b      $73774
073786 moveq      #$0, d7
073788 cmp.w      $18(a0, d7.w), d2
07378c beq.b      $73790
07378e bpl.b      $7379a
073790 addq.w     #$2, d7
073792 cmp.w      #$8, d7
073796 bne.b      $73788
073798 bra.b      $737a8
07379a move.w     d2, $18(a0, d7.w)
07379e move.w     #$ffff, (a0, d7.w)
0737a4 move.w     d0, $20(a0, d7.w)
0737a8 move.w     d7, d0
0737aa lsr.w      #$1, d0
0737ac movem.l    (a7)+, d1-d2/d7/a0-a1
0737b0 rts        
0737b2 moveq      #$0, d7
0737b4 lea.l      $dff000.l, a1
0737ba lea.l      $2c8c(a3), a0
0737be move.w     (a0), d0
0737c0 cmp.w      #$ffff, d0
0737c4 bmi.w      $73860
0737c8 beq.b      $737ea
0737ca tst.w      d0
0737cc bne.b      $73846
0737ce moveq      #$0, d0
0737d0 bset.b     d7, d0
0737d2 ori.w      #$8200, d0
0737d6 move.w     d0, $96(a6)
0737da cmpi.w     #$3e7, $18(a0)
0737e0 bne.b      $737e8
0737e2 move.w     #$fffd, (a0)
0737e6 bra.b      $73860
0737e8 bra.b      $73852
0737ea move.w     $20(a0), d0
0737ee asl.w      #$2, d0
0737f0 lea.l      $2438(a3), a2
0737f4 movea.l    (a2, d0.w), a2
0737f8 move.l     a2, d0
0737fa beq.b      $7385c
0737fc moveq      #$0, d0
0737fe bset.b     d7, d0
073800 move.w     d0, $96(a6)
073804 move.l     a2, d0
073806 addi.l     #$e, d0
07380c move.l     d0, $a0(a1)
073810 move.w     (a2), d0
073812 move.w     d0, $a4(a1)
073816 move.w     $2(a2), $a6(a1)
07381c cmpi.w     #$3e7, $18(a0)
073822 beq.b      $7382c
073824 move.w     $4(a2), $a8(a1)
07382a bra.b      $73830
07382c clr.w      $a8(a1)
073830 move.w     $6(a2), d0
073834 move.w     d0, $28(a0)
073838 move.w     $8(a2), $8(a0)
07383e move.w     $a(a2), $10(a0)
073844 bra.b      $73852
073846 cmp.w      #$1, d0
07384a bne.b      $73852
07384c move.w     $28(a0), $a4(a1)
073852 addq.w     #$1, (a0)
073854 move.w     (a0), d0
073856 cmp.w      $8(a0), d0
07385a bne.b      $73860
07385c move.w     #$fffe, (a0)
073860 addq.w     #$2, a0
073862 adda.w     #$10, a1
073866 addq.w     #$1, d7
073868 cmp.w      #$4, d7
07386c bne.w      $737be
073870 rts        
073872 movem.l    d0-d1/a0-a1/a3/a6, -(a7)
073876 movea.l    $7e41e.l, a3
07387c lea.l      $dff000.l, a6
073882 bsr.w      $73a4a
073886 move.w     #$800, $9c(a6)
07388c andi.w     #$ff, d0
073890 cmp.w      #$ff, d0
073894 beq.b      $738ae
073896 cmp.w      #$80, d0
07389a bmi.b      $738a2
07389c move.w     d0, $2cfc(a3)
0738a0 bra.b      $738a8
0738a2 move.b     d0, $2c8a(a3)
0738a6 bsr.b      $738c6
0738a8 movem.l    (a7)+, d0-d1/a0-a1/a3/a6
0738ac rte        
0738ae tst.w      $2da6(a3)
0738b2 beq.b      $738b6
0738b4 bsr.b      $738b8
0738b6 bra.b      $738a8
0738b8 move.w     #$1, $2fb8(a3)
0738be move.w     #$1, $7fc.w
0738c4 rts        
0738c6 move.b     $2c8a(a3), d0
0738ca cmp.b      #$7f, d0
0738ce beq.b      $738f8
0738d0 tst.w      $2cbc(a3)
0738d4 beq.b      $73912
0738d6 bmi.b      $73900
0738d8 move.w     $2cbe(a3), d1
0738dc lea.l      $2d66(a3), a0
0738e0 move.b     d0, (a0, d1.w)
0738e4 addq.w     #$1, $2cbe(a3)
0738e8 move.w     $2cbe(a3), d0
0738ec cmp.w      $2cc0(a3), d0
0738f0 bne.b      $738f6
0738f2 clr.w      $2cbc(a3)
0738f6 rts        
0738f8 move.w     #$ffff, $2cbc(a3)
0738fe rts        
073900 move.b     #$0, $2cbf(a3)
073906 move.b     d0, $2cc1(a3)
07390a move.w     #$1, $2cbc(a3)
073910 rts        
073912 rts        
073914 tst.w      $2cc6(a3)
073918 bne.b      $73934
07391a move.b     $2c8b(a3), d0
07391e beq.b      $73932
073920 btst.b     #$d, $18(a6)
073926 beq.b      $73932
073928 move.b     #$0, $2c8b(a3)
07392e bsr.w      $73a5c
073932 rts        
073934 btst.b     #$d, $18(a6)
07393a beq.b      $7394e
07393c movea.l    $2cc2(a3), a0
073940 move.b     (a0)+, d0
073942 move.l     a0, $2cc2(a3)
073946 subq.w     #$1, $2cc6(a3)
07394a bsr.w      $73a5c
07394e rts        
073950 movem.l    d0-d1/a0, -(a7)
073954 move.w     $18(a6), d0
073958 move.w     d0, d1
07395a andi.w     #$4000, d1
07395e beq.b      $73954
073960 move.w     #$800, $9c(a6)
073966 move.w     $2cca(a3), d1
07396a beq.b      $73988
07396c lea.l      $2cd0(a3), a0
073970 move.b     d0, (a0, d1.w)
073974 addq.w     #$1, $2cca(a3)
073978 move.w     $2cca(a3), d0
07397c cmp.w      $2cce(a3), d0
073980 bne.b      $73998
073982 clr.w      $2cca(a3)
073986 bra.b      $73998
073988 cmp.b      #$aa, d0
07398c bne.b      $73998
07398e move.w     #$8002, $9c(a6)
073994 addq.w     #$1, $2cca(a3)
073998 movem.l    (a7)+, d0-d1/a0
07399c rte        
07399e movem.l    d0-d1/a0, -(a7)
0739a2 move.w     $1e(a6), d0
0739a6 move.w     d0, d1
0739a8 andi.w     #$1, d0
0739ac bne.b      $739b2
0739ae bsr.b      $739de
0739b0 bra.b      $739b8
0739b2 move.w     d0, $9c(a6)
0739b6 bsr.b      $73a24
0739b8 movem.l    (a7)+, d0-d1/a0
0739bc rte        
0739be movem.l    d0-d1/a0, -(a7)
0739c2 move.w     $1e(a6), d0
0739c6 move.w     d0, d1
0739c8 andi.w     #$1, d0
0739cc bne.b      $739d2
0739ce bsr.b      $73a06
0739d0 bra.b      $739d8
0739d2 move.w     d0, $9c(a6)
0739d6 bsr.b      $73a24
0739d8 movem.l    (a7)+, d0-d1/a0
0739dc rte        
0739de move.w     #$1, $9a(a6)
0739e4 move.b     #$aa, d0
0739e8 bsr.w      $73a5c
0739ec move.w     #$1, $2cca(a3)
0739f2 bsr.w      $73a6c
0739f6 move.w     #$1, $9c(a6)
0739fc move.w     #$8001, $9a(a6)
073a02 bsr.b      $73a0e
073a04 rts        
073a06 bsr.w      $73a6c
073a0a bsr.b      $73a0e
073a0c rts        
073a0e clr.w      $2cc8(a3)
073a12 lea.l      $2cdd(a3), a0
073a16 move.b     (a0), d0
073a18 bsr.b      $73a5c
073a1a rts        
073a1c move.w     #$1, $2cca(a3)
073a22 rts        
073a24 move.w     #$1, $9c(a6)
073a2a addq.w     #$1, $2cc8(a3)
073a2e move.w     $2cc8(a3), d0
073a32 cmp.w      $2ccc(a3), d0
073a36 bne.b      $73a3a
073a38 bra.b      $73a48
073a3a move.w     $2cc8(a3), d1
073a3e lea.l      $2cdd(a3), a0
073a42 move.b     (a0, d1.w), d0
073a46 bsr.b      $73a5c
073a48 rts        
073a4a move.w     $18(a6), d0
073a4e move.w     d0, d1
073a50 andi.w     #$4000, d1
073a54 beq.b      $73a4a
073a56 andi.w     #$ff, d0
073a5a rts        
073a5c move.b     d0, d1
073a5e andi.w     #$ff, d0
073a62 ori.w      #$100, d0
073a66 move.w     d0, $30(a6)
073a6a rts        
073a6c movem.l    d0-d7/a0-a4/a6, -(a7)
073a70 bsr.w      $77864
073a74 movem.l    (a7)+, d0-d7/a0-a4/a6
073a78 rts        
073a7a moveq      #$b, d4
073a7c move.w     d4, -(a7)
073a7e movea.l    $2fc4(a3), a1
073a82 bsr.b      $73af8
073a84 move.w     (a7)+, d4
073a86 dbra       d4, $73a7c
073a8a move.w     $2daa(a3), d4
073a8e moveq      #$1, d5
073a90 movea.l    $2fc4(a3), a1
073a94 bsr.b      $73aca
073a96 bsr.w      $75ec2
073a9a moveq      #$1, d4
073a9c moveq      #$1, d5
073a9e movea.l    $2fc4(a3), a1
073aa2 bsr.w      $73b3c
073aa6 bsr.w      $75ee2
073aaa clr.w      d4
073aac moveq      #$1, d5
073aae movea.l    $2fc4(a3), a1
073ab2 bsr.w      $73b3c
073ab6 bsr.w      $75f02
073aba moveq      #$2, d4
073abc moveq      #$1, d5
073abe movea.l    $2fc4(a3), a1
073ac2 bsr.b      $73b3c
073ac4 rts        
073ac6 movea.l    $2fc0(a3), a1
073aca add.w      d4, d4
073acc lea.l      $757e6(pc), a2
073ad0 move.w     (a2, d4.w), d0
073ad4 lea.l      $757fe(pc), a2
073ad8 move.w     (a2, d4.w), d1
073adc lea.l      $75816(pc), a2
073ae0 move.w     (a2, d4.w), d4
073ae4 movea.l    #$25d46, a0
073aea movea.l    #$2f986, a2
073af0 bsr.b      $73b60
073af2 rts        
073af4 movea.l    $2fc0(a3), a1
073af8 add.w      d4, d4
073afa lea.l      $75876(pc), a2
073afe move.w     (a2, d4.w), d0
073b02 beq.b      $73b36
073b04 lea.l      $7582e(pc), a2
073b08 move.w     (a2, d4.w), d0
073b0c lea.l      $75846(pc), a2
073b10 move.w     (a2, d4.w), d1
073b14 lea.l      $2b38(a3), a2
073b18 move.w     (a2, d4.w), d5
073b1c lea.l      $7585e(pc), a2
073b20 move.w     (a2, d4.w), d4
073b24 add.w      d5, d4
073b26 moveq      #$1, d5
073b28 movea.l    #$25d46, a0
073b2e movea.l    #$2f986, a2
073b34 bsr.b      $73b60
073b36 rts        
073b38 movea.l    $2fc0(a3), a1
073b3c add.w      d4, d4
073b3e lea.l      $7588e(pc), a2
073b42 move.w     (a2, d4.w), d0
073b46 lea.l      $75894(pc), a2
073b4a move.w     (a2, d4.w), d1
073b4e moveq      #$13, d4
073b50 movea.l    #$25d46, a0
073b56 movea.l    #$2f986, a2
073b5c bsr.b      $73b60
073b5e rts        
073b60 movem.l    d0-d5/a0-a2, -(a7)
073b64 move.l     (a2)+, $2f36(a3)
073b68 move.l     (a2)+, $2f3a(a3)
073b6c asl.w      #$3, d4
073b6e movea.l    (a2, d4.w), a4
073b72 move.w     $4(a2, d4.w), d6
073b76 move.w     $6(a2, d4.w), d7
073b7a adda.l     a2, a4
073b7c lsr.w      #$3, d6
073b7e mulu.w     #$28, d1
073b82 add.w      d0, d1
073b84 adda.w     d1, a0
073b86 adda.w     d1, a1
073b88 move.l     a1, d0
073b8a andi.l     #$fffffffe, d0
073b90 movea.l    d0, a1
073b92 cmp.w      #$1, d5
073b96 beq.b      $73bda
073b98 cmp.w      #$2, d5
073b9c beq.w      $73c92
073ba0 move.w     $2f3c(a3), d2
073ba4 subq.w     #$1, d2
073ba6 move.w     d7, d1
073ba8 subq.w     #$1, d1
073baa movea.l    a1, a5
073bac move.l     a4, -(a7)
073bae move.w     d6, d0
073bb0 lsr.w      #$1, d0
073bb2 subq.w     #$1, d0
073bb4 move.w     (a4)+, (a1)+
073bb6 dbra       d0, $73bb4
073bba suba.w     d6, a1
073bbc adda.w     #$28, a1
073bc0 dbra       d1, $73bae
073bc4 movea.l    a5, a1
073bc6 adda.l     #$1f40, a1
073bcc movea.l    (a7)+, a4
073bce adda.l     $2f3a(a3), a4
073bd2 dbra       d2, $73ba6
073bd6 bra.w      $73d28
073bda moveq      #$5, d0
073bdc mulu.w     $2f3c(a3), d0
073be0 movea.l    a4, a5
073be2 adda.l     d0, a5
073be4 move.w     d7, d1
073be6 subq.w     #$1, d1
073be8 move.w     d6, d0
073bea lsr.w      #$1, d0
073bec subq.w     #$1, d0
073bee move.w     (a5)+, d4
073bf0 beq.b      $73c4a
073bf2 cmp.w      #$ffff, d4
073bf6 beq.w      $73c7c
073bfa move.w     (a4), d5
073bfc and.w      d4, (a1)
073bfe or.w       d5, (a1)
073c00 adda.l     $2f3a(a3), a4
073c04 move.w     (a4), d5
073c06 and.w      d4, $1f40(a1)
073c0a or.w       d5, $1f40(a1)
073c0e adda.l     $2f3a(a3), a4
073c12 move.w     (a4), d5
073c14 and.w      d4, $3e80(a1)
073c18 or.w       d5, $3e80(a1)
073c1c adda.l     $2f3a(a3), a4
073c20 move.w     (a4), d5
073c22 and.w      d4, $5dc0(a1)
073c26 or.w       d5, $5dc0(a1)
073c2a adda.l     $2f3a(a3), a4
073c2e move.w     (a4), d5
073c30 and.w      d4, $7d00(a1)
073c34 or.w       d5, $7d00(a1)
073c38 suba.l     $2f3a(a3), a4
073c3c suba.l     $2f3a(a3), a4
073c40 suba.l     $2f3a(a3), a4
073c44 suba.l     $2f3a(a3), a4
073c48 bra.b      $73c7c
073c4a move.w     (a4), (a1)
073c4c adda.l     $2f3a(a3), a4
073c50 move.w     (a4), $1f40(a1)
073c54 adda.l     $2f3a(a3), a4
073c58 move.w     (a4), $3e80(a1)
073c5c adda.l     $2f3a(a3), a4
073c60 move.w     (a4), $5dc0(a1)
073c64 adda.l     $2f3a(a3), a4
073c68 move.w     (a4), $7d00(a1)
073c6c suba.l     $2f3a(a3), a4
073c70 suba.l     $2f3a(a3), a4
073c74 suba.l     $2f3a(a3), a4
073c78 suba.l     $2f3a(a3), a4
073c7c addq.w     #$2, a1
073c7e addq.w     #$2, a4
073c80 dbra       d0, $73bee
073c84 suba.w     d6, a1
073c86 adda.w     #$28, a1
073c8a dbra       d1, $73be8
073c8e bra.w      $73d28
073c92 moveq      #$5, d0
073c94 mulu.w     $2f3c(a3), d0
073c98 movea.l    a4, a5
073c9a adda.l     d0, a5
073c9c move.w     d7, d1
073c9e subq.w     #$1, d1
073ca0 move.w     d6, d0
073ca2 lsr.w      #$1, d0
073ca4 subq.w     #$1, d0
073ca6 move.w     (a5)+, d4
073ca8 beq.b      $73cf6
073caa cmp.w      #$ffff, d4
073cae beq.b      $73d10
073cb0 move.w     d4, d3
073cb2 not.w      d3
073cb4 move.w     (a0), d5
073cb6 and.w      d3, d5
073cb8 and.w      d4, (a1)
073cba or.w       d5, (a1)
073cbc move.w     $1f40(a0), d5
073cc0 and.w      d3, d5
073cc2 and.w      d4, $1f40(a1)
073cc6 or.w       d5, $1f40(a1)
073cca move.w     $3e80(a0), d5
073cce and.w      d3, d5
073cd0 and.w      d4, $3e80(a1)
073cd4 or.w       d5, $3e80(a1)
073cd8 move.w     $5dc0(a0), d5
073cdc and.w      d3, d5
073cde and.w      d4, $5dc0(a1)
073ce2 or.w       d5, $5dc0(a1)
073ce6 move.w     $7d00(a0), d5
073cea and.w      d3, d5
073cec and.w      d4, $7d00(a1)
073cf0 or.w       d5, $7d00(a1)
073cf4 bra.b      $73d10
073cf6 move.w     (a0), (a1)
073cf8 move.w     $1f40(a0), $1f40(a1)
073cfe move.w     $3e80(a0), $3e80(a1)
073d04 move.w     $5dc0(a0), $5dc0(a1)
073d0a move.w     $7d00(a0), $7d00(a1)
073d10 addq.w     #$2, a0
073d12 addq.w     #$2, a1
073d14 dbra       d0, $73ca6
073d18 suba.w     d6, a1
073d1a suba.w     d6, a0
073d1c adda.w     #$28, a0
073d20 adda.w     #$28, a1
073d24 dbra       d1, $73ca0
073d28 movem.l    (a7)+, d0-d5/a0-a2
073d2c rts        
073d2e movem.l    d0-d7/a0-a6, -(a7)
073d32 moveq      #$0, d0
073d34 moveq      #$0, d1
073d36 moveq      #$0, d2
073d38 moveq      #$0, d3
073d3a movea.l    $7d970.l, a1
073d40 jsr        (a1)
073d42 move.l     a0, $7d974.l
073d48 moveq      #$4, d0
073d4a lea.l      $73d6c(pc), a1
073d4e move.w     $2faa(a3), d1
073d52 add.w      d1, d1
073d54 move.w     (a1, d1.w), d1
073d58 movea.l    $7d970.l, a1
073d5e jsr        (a1)
073d60 movem.l    (a7)+, d0-d7/a0-a6
073d64 move.w     #$1, $2cf4(a3)
073d6a rts        
073d6c ori.w      #$40, d0
073d70 ori.w      #$30, d0
073d74 ori.b      #$40, $40.w
073d7a ori.b      #$30, $38(a0, d0.w)
073d80 ori.b      #$6b, -$c(a0, d2.l)
073d86 beq.b      $73d98
073d88 movem.l    d0-d7/a0-a6, -(a7)
073d8c movea.l    $7d974.l, a0
073d92 jsr        (a0)
073d94 movem.l    (a7)+, d0-d7/a0-a6
073d98 rts        
073d9a move.w     #$f, $96(a6)
073da0 clr.w      $2cf4(a3)
073da4 moveq      #$5, d1
073da6 bsr.w      $74ac8
073daa rts        
073dac movea.l    $7e41e.l, a3
073db2 jsr        $a28.w
073db6 lea.l      $dff000.l, a6
073dbc move.w     #$800, $9e(a6)
073dc2 move.w     #$b9, $32(a6)
073dc8 move.w     #$800, $9c(a6)
073dce lea.l      $73872(pc), a0
073dd2 move.l     a0, $74.w
073dd6 move.w     #$8800, $9a(a6)
073ddc clr.w      $2fda(a3)
073de0 clr.w      $2fb8(a3)
073de4 move.w     #$ffff, $2fca(a3)
073dea bsr.w      $731f8
073dee move.w     #$83e0, $96(a6)
073df4 move.b     #$1, $bfee01.l
073dfc bsr.w      $75576
073e00 lea.l      $756d0(pc), a0
073e04 move.l     a0, $6c.w
073e08 move.w     #$c010, $9a(a6)
073e0e lea.l      $7feda.l, a0
073e14 move.l     a0, $80(a6)
073e18 move.w     #$ffff, $3034(a3)
073e1e clr.w      $2fd0(a3)
073e22 clr.w      $2fea(a3)
073e26 bsr.w      $76284
073e2a move.w     #$1, $2fd8(a3)
073e30 bsr.w      $73d2e
073e34 clr.w      $2da6(a3)
073e38 clr.w      $2fb8(a3)
073e3c clr.w      $2da8(a3)
073e40 clr.w      $2fda(a3)
073e44 bsr.w      $762dc
073e48 bsr.w      $756ae
073e4c movea.l    $2fc0(a3), a0
073e50 moveq      #$5, d0
073e52 bsr.w      $762a8
073e56 bsr.w      $76284
073e5a move.w     #$e, $2fca(a3)
073e60 move.w     #$a, $2fd2(a3)
073e66 move.w     #$f0, $2fd4(a3)
073e6c move.w     #$fa, $2fd6(a3)
073e72 clr.w      $2fd0(a3)
073e76 clr.w      $2fd8(a3)
073e7a bsr.w      $731f2
073e7e bsr.w      $7644e
073e82 bsr.w      $731f8
073e86 tst.w      $2fd8(a3)
073e8a beq.b      $73e86
073e8c bsr.w      $762dc
073e90 bsr.w      $756ae
073e94 movea.l    $2fc0(a3), a0
073e98 moveq      #$5, d0
073e9a bsr.w      $762a8
073e9e bsr.w      $76284
073ea2 move.w     #$f, $2fca(a3)
073ea8 move.w     #$a, $2fd2(a3)
073eae move.w     #$fff5, $2fd4(a3)
073eb4 move.w     #$ffff, $2fd6(a3)
073eba clr.w      $2fd0(a3)
073ebe clr.w      $2fd8(a3)
073ec2 tst.w      $2fd8(a3)
073ec6 beq.b      $73ec2
073ec8 move.w     $3030(a3), d0
073ecc move.w     d0, $3032(a3)
073ed0 bra.w      $73ed8
073ed4 jsr        $a30.w
073ed8 bra.b      $73ede
073eda bsr.w      $73d2e
073ede clr.w      $2da6(a3)
073ee2 clr.w      $2fb8(a3)
073ee6 clr.w      $2da8(a3)
073eea clr.w      $2fda(a3)
073eee move.w     #$1, $2da8(a3)
073ef4 addq.w     #$1, $3034(a3)
073ef8 bsr.w      $762dc
073efc bsr.w      $756ae
073f00 movea.l    $2fc0(a3), a0
073f04 moveq      #$5, d0
073f06 bsr.w      $762a8
073f0a bsr.w      $76284
073f0e move.w     #$10, $2fca(a3)
073f14 move.w     #$a, $2fd2(a3)
073f1a move.w     #$1ea, $2fd4(a3)
073f20 move.w     #$1f4, $2fd6(a3)
073f26 clr.w      $2fd0(a3)
073f2a clr.w      $2fd8(a3)
073f2e bsr.w      $731f2
073f32 bsr.w      $765fa
073f36 bsr.w      $731f8
073f3a tst.w      $2fda(a3)
073f3e bne.w      $741c2
073f42 tst.w      $2fd8(a3)
073f46 beq.b      $73f3a
073f48 bsr.w      $762dc
073f4c movea.l    #$33806, a0
073f52 moveq      #$3, d0
073f54 bsr.w      $762a8
073f58 bsr.w      $76284
073f5c move.w     #$10, $2fca(a3)
073f62 move.w     #$a, $2fd2(a3)
073f68 move.w     #$122, $2fd4(a3)
073f6e move.w     #$12c, $2fd6(a3)
073f74 clr.w      $2fd0(a3)
073f78 clr.w      $2fd8(a3)
073f7c bsr.w      $731f2
073f80 bsr.w      $7661c
073f84 bsr.w      $731f8
073f88 tst.w      $2fda(a3)
073f8c bne.w      $741c2
073f90 tst.w      $2fd8(a3)
073f94 beq.b      $73f88
073f96 bsr.w      $762dc
073f9a bsr.w      $756ae
073f9e movea.l    $2fc0(a3), a0
073fa2 moveq      #$5, d0
073fa4 bsr.w      $762a8
073fa8 bsr.w      $76284
073fac move.w     #$11, $2fca(a3)
073fb2 move.w     #$a, $2fd2(a3)
073fb8 move.w     #$1ea, $2fd4(a3)
073fbe move.w     #$1f4, $2fd6(a3)
073fc4 clr.w      $2fd0(a3)
073fc8 clr.w      $2fd8(a3)
073fcc bsr.w      $731f2
073fd0 bsr.w      $7660c
073fd4 bsr.w      $731f8
073fd8 tst.w      $2fda(a3)
073fdc bne.w      $741c2
073fe0 tst.w      $2fd8(a3)
073fe4 beq.b      $73fd8
073fe6 bsr.w      $762dc
073fea bsr.w      $756ae
073fee movea.l    $2fc0(a3), a0
073ff2 moveq      #$5, d0
073ff4 bsr.w      $762a8
073ff8 bsr.w      $76284
073ffc move.w     #$13, $2fca(a3)
074002 move.w     #$a, $2fd2(a3)
074008 move.w     #$fff5, $2fd4(a3)
07400e move.w     #$ffff, $2fd6(a3)
074014 clr.w      $2fd0(a3)
074018 clr.w      $2fd8(a3)
07401c move.w     $3034(a3), d0
074020 andi.w     #$7, d0
074024 move.w     d0, $2db8(a3)
074028 bsr.w      $78c64
07402c andi.w     #$1, d0
074030 move.w     d0, $3038(a3)
074034 clr.w      $303a(a3)
074038 move.w     #$1, $3076(a3)
07403e move.w     #$1, $314a(a3)
074044 move.w     #$1, $3078(a3)
07404a move.w     #$1, $314c(a3)
074050 bsr.w      $749a4
074054 bsr.w      $731f2
074058 move.w     #$1, $2f42(a3)
07405e move.l     #$1a1c6, $7e422.l
074068 bsr.w      $74ada
07406c tst.w      $2fda(a3)
074070 bne.w      $741c2
074074 bsr.w      $731f8
074078 move.w     #$ffff, $2fc8(a3)
07407e tst.w      $2fea(a3)
074082 bne.b      $7407e
074084 move.w     #$1, $2fd8(a3)
07408a move.w     #$34, $2fca(a3)
074090 bsr.w      $77102
074094 bsr.w      $77594
074098 bsr.w      $76a9a
07409c clr.w      $2da6(a3)
0740a0 clr.w      $2fb8(a3)
0740a4 move.w     #$3877, $9a(a6)
0740aa move.w     #$7877, $9c(a6)
0740b0 lea.l      $77774(pc), a0
0740b4 move.l     a0, $64.w
0740b8 move.w     #$8002, $9a(a6)
0740be move.l     #$7f5ee, $80(a6)
0740c6 move.w     #$1, $2f40(a3)
0740cc clr.w      $2f44(a3)
0740d0 moveq      #$a, d1
0740d2 bsr.w      $74ac8
0740d6 bsr.w      $78cb0
0740da clr.w      $2f40(a3)
0740de move.w     #$3877, $9a(a6)
0740e4 move.w     #$7877, $9c(a6)
0740ea lea.l      $73872(pc), a0
0740ee move.l     a0, $74.w
0740f2 move.w     #$8800, $9a(a6)
0740f8 lea.l      $756be(pc), a0
0740fc move.l     a0, $64.w
074100 lea.l      $756d0(pc), a0
074104 move.l     a0, $6c.w
074108 move.w     #$c010, $9a(a6)
07410e clr.w      $2fea(a3)
074112 clr.w      $2fc8(a3)
074116 bsr.w      $762dc
07411a bsr.w      $756ae
07411e movea.l    $2fc0(a3), a0
074122 moveq      #$0, d0
074124 bsr.w      $762a8
074128 bsr.w      $76284
07412c lea.l      $7feda.l, a0
074132 move.l     a0, $80(a6)
074136 move.l     #$10586, $2fc0(a3)
07413e move.l     #$1c106, $2fc4(a3)
074146 tst.w      $2fda(a3)
07414a bne.w      $741c2
07414e bsr.w      $731f2
074152 bsr.w      $7665e
074156 bsr.w      $75fa2
07415a bsr.w      $731f8
07415e tst.w      $2fda(a3)
074162 bne.w      $741c2
074166 tst.w      $2fd8(a3)
07416a beq.b      $7415e
07416c bsr.w      $762dc
074170 bsr.w      $756ae
074174 movea.l    $2fc0(a3), a0
074178 moveq      #$5, d0
07417a bsr.w      $762a8
07417e bsr.w      $76284
074182 move.w     #$18, $2fca(a3)
074188 move.w     #$a, $2fd2(a3)
07418e move.w     #$1ea, $2fd4(a3)
074194 move.w     #$1f4, $2fd6(a3)
07419a clr.w      $2fd0(a3)
07419e clr.w      $2fd8(a3)
0741a2 bsr.w      $731f2
0741a6 bsr.w      $765f6
0741aa bsr.w      $731f8
0741ae bsr.w      $7625c
0741b2 tst.w      $2fda(a3)
0741b6 bne.b      $741c2
0741b8 tst.w      $2fd8(a3)
0741bc beq.b      $741ae
0741be bra.w      $73ede
0741c2 bsr.w      $731f8
0741c6 clr.w      $2b32(a3)
0741ca clr.w      $2b34(a3)
0741ce clr.w      $2b36(a3)
0741d2 move.w     #$ffff, $2db8(a3)
0741d8 clr.w      $2da8(a3)
0741dc clr.w      $2fda(a3)
0741e0 move.w     #$1, $2da6(a3)
0741e6 clr.w      $2fb8(a3)
0741ea move.w     #$ffff, $2fc8(a3)
0741f0 tst.w      $2fea(a3)
0741f4 bne.b      $741f0
0741f6 clr.w      $2fc8(a3)
0741fa move.w     #$1, $2fd8(a3)
074200 move.l     #$10586, $2fc0(a3)
074208 move.l     #$1c106, $2fc4(a3)
074210 bsr.w      $731f2
074214 movem.l    d0-d7/a0-a6, -(a7)
074218 jsr        $a2c.l
07421e movem.l    (a7)+, d0-d7/a0-a6
074222 bsr.w      $76686
074226 bsr.w      $731f8
07422a move.w     #$7, $2daa(a3)
074230 bsr.w      $73a7a
074234 bsr.w      $762dc
074238 bsr.w      $756ae
07423c movea.l    $2fc0(a3), a0
074240 moveq      #$5, d0
074242 bsr.w      $762a8
074246 bsr.w      $76284
07424a move.w     #$20, $2fca(a3)
074250 move.w     #$ffff, $2dac(a3)
074256 move.w     #$a, $2fd2(a3)
07425c move.w     #$fff5, $2fd4(a3)
074262 move.w     #$ffff, $2fd6(a3)
074268 clr.w      $2fd0(a3)
07426c clr.w      $2fd8(a3)
074270 tst.w      $2fb8(a3)
074274 bne.w      $748c0
074278 tst.w      $2fd8(a3)
07427c beq.b      $74270
07427e moveq      #$2, d5
074280 move.w     $2daa(a3), d4
074284 bsr.w      $73ac6
074288 lea.l      $2b38(a3), a0
07428c move.w     (a0)+, d0
07428e move.w     (a0)+, $3078(a3)
074292 move.w     (a0)+, $3076(a3)
074296 move.w     (a0)+, d0
074298 move.w     (a0)+, d0
07429a move.w     (a0)+, $3038(a3)
07429e move.w     (a0)+, $303a(a3)
0742a2 move.w     (a0)+, d0
0742a4 move.w     (a0)+, d0
0742a6 move.w     (a0)+, $314c(a3)
0742aa move.w     (a0)+, $314a(a3)
0742ae move.w     (a0)+, $2f48(a3)
0742b2 tst.w      $303a(a3)
0742b6 beq.w      $74356
0742ba bsr.w      $74932
0742be bsr.w      $762dc
0742c2 bsr.w      $756ae
0742c6 movea.l    $2fc0(a3), a0
0742ca moveq      #$2, d0
0742cc bsr.w      $762a8
0742d0 bsr.w      $76284
0742d4 move.w     #$23, $2fca(a3)
0742da move.w     #$ffff, $2dac(a3)
0742e0 move.w     #$a, $2fd2(a3)
0742e6 move.w     #$fff5, $2fd4(a3)
0742ec move.w     #$ffff, $2fd6(a3)
0742f2 clr.w      $2fd0(a3)
0742f6 clr.w      $2fd8(a3)
0742fa moveq      #$40, d0
0742fc bsr.w      $74a84
074300 bne.w      $748c0
074304 move.b     #$ff, $2d00(a3)
07430a bsr.w      $7526e
07430e andi.w     #$f, d0
074312 ori.w      #$60, d0
074316 move.b     d0, $2cfe(a3)
07431a moveq      #$60, d0
07431c bsr.w      $74a84
074320 bne.w      $748c0
074324 bsr.w      $75388
074328 moveq      #$6f, d0
07432a bsr.w      $74a84
07432e bne.w      $748c0
074332 bsr.w      $7539e
074336 move.b     $2cfe(a3), d0
07433a cmp.b      $2d00(a3), d0
07433e beq.b      $74304
074340 bpl.b      $74346
074342 addq.w     #$1, $303a(a3)
074346 move.w     #$ffff, $2fc8(a3)
07434c tst.w      $2fea(a3)
074350 bne.b      $7434c
074352 clr.w      $2fc8(a3)
074356 moveq      #$61, d0
074358 bsr.w      $74a84
07435c bne.w      $748c0
074360 clr.w      $2cf6(a3)
074364 clr.w      $2cf8(a3)
074368 lea.l      $74e7e(pc), a1
07436c moveq      #$1, d7
07436e movea.l    a1, a2
074370 lea.l      $28b0(a3), a0
074374 moveq      #$b, d6
074376 cmpm.b     (a2)+, (a0)+
074378 bne.b      $74380
07437a dbra       d6, $74376
07437e bra.b      $7438e
074380 adda.w     #$c, a1
074384 addq.w     #$1, d7
074386 cmp.w      #$b, d7
07438a bne.b      $7436e
07438c clr.w      d7
07438e move.w     d7, $2db8(a3)
074392 clr.w      $3022(a3)
074396 cmp.w      #$9, d7
07439a bmi.b      $743a6
07439c subq.w     #$8, d7
07439e move.w     d7, $3022(a3)
0743a2 clr.w      $2db8(a3)
0743a6 cmp.w      #$8, d7
0743aa bne.b      $743f0
0743ac lea.l      $50000.l, a0
0743b2 move.w     #$3fff, d7
0743b6 clr.l      (a0)+
0743b8 dbra       d7, $743b6
0743bc bsr.w      $731f2
0743c0 move.w     #$fc, d0
0743c4 move.l     #$40000, d1
0743ca jsr        $7db4c.l
0743d0 bsr.w      $731f8
0743d4 bsr.w      $73d9a
0743d8 movem.l    d0-d7/a0-a6, -(a7)
0743dc jsr        $40000.l
0743e2 movem.l    (a7)+, d0-d7/a0-a6
0743e6 move.w     #$c000, $9a(a6)
0743ec bra.w      $748c0
0743f0 andi.w     #$7, $2db8(a3)
0743f6 bsr.w      $749a4
0743fa bsr.w      $753a8
0743fe tst.w      $303a(a3)
074402 beq.b      $74416
074404 bsr.w      $7530a
074408 moveq      #$62, d0
07440a bsr.w      $74a84
07440e bne.w      $748c0
074412 bsr.w      $7534c
074416 bsr.w      $7ad62
07441a move.w     $3038(a3), d0
07441e mulu.w     #$4, d0
074422 addq.w     #$5, d0
074424 move.w     d0, $2ccc(a3)
074428 move.w     $2dbc(a3), d0
07442c mulu.w     #$4, d0
074430 addq.w     #$6, d0
074432 move.w     d0, $2cce(a3)
074436 move.l     #$1c106, $2fc0(a3)
07443e move.l     #$10586, $2fc4(a3)
074446 bsr.w      $73d9a
07444a bsr.w      $731f2
07444e bsr.w      $763b6
074452 tst.w      $2fb8(a3)
074456 bne.w      $748c0
07445a move.l     a0, $2fc4(a3)
07445e move.l     a0, d0
074460 addi.l     #$bb80, d0
074466 cmp.l      #$1a1c6, d0
07446c bpl.b      $74474
07446e move.l     #$1a1c6, d0
074474 move.l     d0, $7e422.l
07447a bsr.w      $766d2
07447e tst.w      $2fb8(a3)
074482 bne.w      $748c0
074486 bsr.w      $731f8
07448a moveq      #$63, d0
07448c bsr.w      $74a84
074490 bne.w      $748c0
074494 bsr.w      $7526e
074498 bsr.w      $753a8
07449c tst.w      $303a(a3)
0744a0 beq.b      $744b4
0744a2 bsr.w      $752a8
0744a6 moveq      #$64, d0
0744a8 bsr.w      $74a84
0744ac bne.w      $748c0
0744b0 bsr.w      $752de
0744b4 bsr.w      $75460
0744b8 bsr.w      $761a4
0744bc bsr.w      $75296
0744c0 bsr.w      $762dc
0744c4 bsr.w      $756ae
0744c8 movea.l    $2fc0(a3), a0
0744cc moveq      #$6, d0
0744ce bsr.w      $762a8
0744d2 bsr.w      $76284
0744d6 move.w     #$30, $2fca(a3)
0744dc move.w     #$a, $2fd2(a3)
0744e2 move.w     #$fff5, $2fd4(a3)
0744e8 move.w     #$ffff, $2fd6(a3)
0744ee clr.w      $2fd0(a3)
0744f2 clr.w      $2fd8(a3)
0744f6 bsr.w      $73d2e
0744fa bsr.w      $731f2
0744fe clr.w      $2f42(a3)
074502 bsr.w      $74ada
074506 bne.w      $748c0
07450a bsr.w      $731f8
07450e moveq      #$65, d0
074510 bsr.w      $74a84
074514 bne.w      $748c0
074518 move.w     #$ffff, $2fc8(a3)
07451e tst.w      $2fea(a3)
074522 bne.b      $7451e
074524 move.w     #$1, $2fd8(a3)
07452a bsr.w      $73d9a
07452e move.w     #$34, $2fca(a3)
074534 moveq      #$a, d1
074536 bsr.w      $74ac8
07453a bsr.w      $77102
07453e bsr.w      $77594
074542 bsr.w      $76a9a
074546 moveq      #$6b, d0
074548 bsr.w      $74a84
07454c bne.w      $748c0
074550 clr.w      $2da6(a3)
074554 clr.w      $2fb8(a3)
074558 move.w     #$3877, $9a(a6)
07455e move.w     #$7877, $9c(a6)
074564 bsr.w      $73212
074568 cmpi.w     #$1, $303a(a3)
07456e beq.b      $74582
074570 cmpi.w     #$2, $303a(a3)
074576 beq.b      $745a4
074578 lea.l      $77774(pc), a0
07457c move.l     a0, $64.w
074580 bra.b      $745c4
074582 lea.l      $7399e(pc), a0
074586 move.l     a0, $64.w
07458a lea.l      $73950(pc), a0
07458e move.l     a0, $74.w
074592 move.w     #$801, $9c(a6)
074598 move.w     #$8803, $9a(a6)
07459e clr.w      $2cca(a3)
0745a2 bra.b      $745c4
0745a4 lea.l      $739be(pc), a0
0745a8 move.l     a0, $64.w
0745ac lea.l      $73950(pc), a0
0745b0 move.l     a0, $74.w
0745b4 move.w     #$801, $9c(a6)
0745ba move.w     #$8803, $9a(a6)
0745c0 clr.w      $2cca(a3)
0745c4 move.w     #$8002, $9a(a6)
0745ca move.l     #$7f5ee, $80(a6)
0745d2 moveq      #$a, d1
0745d4 bsr.w      $74ac8
0745d8 bsr.w      $78cb0
0745dc moveq      #$a, d1
0745de bsr.w      $74ac8
0745e2 move.w     #$3877, $9a(a6)
0745e8 move.w     #$7877, $9c(a6)
0745ee lea.l      $73872(pc), a0
0745f2 move.l     a0, $74.w
0745f6 move.w     #$8800, $9a(a6)
0745fc lea.l      $756be(pc), a0
074600 move.l     a0, $64.w
074604 lea.l      $756d0(pc), a0
074608 move.l     a0, $6c.w
07460c move.w     #$c010, $9a(a6)
074612 bsr.w      $73d9a
074616 clr.w      $2fea(a3)
07461a clr.w      $2fc8(a3)
07461e bsr.w      $762dc
074622 bsr.w      $756ae
074626 movea.l    $2fc0(a3), a0
07462a moveq      #$0, d0
07462c bsr.w      $762a8
074630 bsr.w      $76284
074634 lea.l      $7feda.l, a0
07463a move.l     a0, $80(a6)
07463e cmpi.w     #$ff, $2dcc(a3)
074644 beq.w      $748c0
074648 clr.w      $2fb8(a3)
07464c move.w     #$1, $2da6(a3)
074652 cmpi.w     #$3, $2dcc(a3)
074658 beq.b      $7466c
07465a cmpi.w     #$1, $3022(a3)
074660 beq.b      $7466c
074662 cmpi.w     #$3, $2dd2(a3)
074668 bne.w      $746f8
07466c move.w     #$28, $2fca(a3)
074672 move.w     #$ffff, $2fd2(a3)
074678 move.w     #$fff5, $2fd4(a3)
07467e move.w     #$ffff, $2fd6(a3)
074684 clr.w      $2fd0(a3)
074688 clr.w      $2fd8(a3)
07468c addq.w     #$1, $2db8(a3)
074690 cmpi.w     #$8, $2db8(a3)
074696 beq.w      $747d8
07469a move.l     #$1c106, $2fc0(a3)
0746a2 move.l     #$10586, $2fc4(a3)
0746aa bsr.w      $731f2
0746ae bsr.w      $763b6
0746b2 tst.w      $2fb8(a3)
0746b6 bne.w      $748c0
0746ba move.l     a0, $2fc4(a3)
0746be move.l     a0, d0
0746c0 addi.l     #$bb80, d0
0746c6 cmp.l      #$1a1c6, d0
0746cc bpl.b      $746d4
0746ce move.l     #$1a1c6, d0
0746d4 move.l     d0, $7e422.l
0746da bsr.w      $766d2
0746de tst.w      $2fb8(a3)
0746e2 bne.w      $748c0
0746e6 bsr.w      $731f8
0746ea moveq      #$66, d0
0746ec bsr.w      $74a84
0746f0 bne.w      $748c0
0746f4 bra.w      $74494
0746f8 move.l     #$1c106, $2fc0(a3)
074700 move.l     #$10586, $2fc4(a3)
074708 bsr.w      $731f2
07470c bsr.w      $76326
074710 tst.w      $2fb8(a3)
074714 bne.w      $748c0
074718 bsr.w      $76706
07471c tst.w      $2fb8(a3)
074720 bne.w      $748c0
074724 bsr.w      $731f8
074728 bsr.w      $7526e
07472c bsr.w      $753a8
074730 tst.w      $303a(a3)
074734 beq.b      $74748
074736 bsr.w      $752a8
07473a moveq      #$67, d0
07473c bsr.w      $74a84
074740 bne.w      $748c0
074744 bsr.w      $752de
074748 bsr.w      $75460
07474c bsr.w      $761a0
074750 bsr.w      $75296
074754 bsr.w      $73d2e
074758 bsr.w      $762dc
07475c bsr.w      $756ae
074760 movea.l    $2fc0(a3), a0
074764 moveq      #$6, d0
074766 bsr.w      $762a8
07476a bsr.w      $76284
07476e move.w     #$2c, $2fca(a3)
074774 move.w     #$a, $2fd2(a3)
07477a move.w     #$1ea, $2fd4(a3)
074780 move.w     #$1f4, $2fd6(a3)
074786 clr.w      $2fd0(a3)
07478a clr.w      $2fd8(a3)
07478e bsr.w      $75202
074792 bsr.w      $731f2
074796 bsr.w      $76406
07479a tst.w      $2fb8(a3)
07479e bne.w      $748c0
0747a2 bsr.w      $7665e
0747a6 tst.w      $2fb8(a3)
0747aa bne.w      $748c0
0747ae bsr.w      $75fa2
0747b2 bsr.w      $731f8
0747b6 bsr.w      $7625c
0747ba tst.w      $2fb8(a3)
0747be bne.w      $748c0
0747c2 tst.w      $2fd8(a3)
0747c6 beq.b      $747b6
0747c8 bsr.w      $73d9a
0747cc bsr.w      $73d2e
0747d0 clr.w      $2da6(a3)
0747d4 bra.w      $7416c
0747d8 move.l     #$1c106, $2fc0(a3)
0747e0 move.l     #$10586, $2fc4(a3)
0747e8 bsr.w      $731f2
0747ec bsr.w      $7636e
0747f0 tst.w      $2fb8(a3)
0747f4 bne.w      $748c0
0747f8 bsr.w      $7674e
0747fc tst.w      $2fb8(a3)
074800 bne.w      $748c0
074804 bsr.w      $731f8
074808 bsr.w      $7526e
07480c bsr.w      $753a8
074810 tst.w      $303a(a3)
074814 beq.b      $74828
074816 bsr.w      $752a8
07481a moveq      #$68, d0
07481c bsr.w      $74a84
074820 bne.w      $748c0
074824 bsr.w      $752de
074828 bsr.w      $75460
07482c bsr.w      $761a0
074830 bsr.w      $75296
074834 bsr.w      $73d2e
074838 bsr.w      $762dc
07483c bsr.w      $756ae
074840 movea.l    $2fc0(a3), a0
074844 moveq      #$5, d0
074846 bsr.w      $762a8
07484a bsr.w      $76284
07484e move.w     #$2e, $2fca(a3)
074854 move.w     #$a, $2fd2(a3)
07485a move.w     #$fff5, $2fd4(a3)
074860 move.w     #$ffff, $2fd6(a3)
074866 clr.w      $2fd0(a3)
07486a clr.w      $2fd8(a3)
07486e bsr.w      $75202
074872 bsr.w      $731f2
074876 bsr.w      $7665e
07487a tst.w      $2fb8(a3)
07487e bne.b      $748c0
074880 bsr.w      $75fa2
074884 tst.w      $2fb8(a3)
074888 bne.b      $748c0
07488a bsr.w      $731f8
07488e bsr.w      $7625c
074892 tst.w      $2fb8(a3)
074896 bne.b      $748c0
074898 tst.w      $2fd8(a3)
07489c beq.b      $7488e
07489e bsr.w      $73d9a
0748a2 bsr.w      $731f2
0748a6 bsr.w      $76406
0748aa tst.w      $2fb8(a3)
0748ae bne.b      $748c0
0748b0 bsr.w      $731f8
0748b4 bsr.w      $73d2e
0748b8 clr.w      $2da6(a3)
0748bc bra.w      $7416c
0748c0 tst.w      $303a(a3)
0748c4 beq.b      $748d4
0748c6 tst.w      $2db8(a3)
0748ca bmi.b      $748d4
0748cc move.b     #$ff, d0
0748d0 bsr.w      $731fe
0748d4 clr.w      $303a(a3)
0748d8 clr.w      $2cbc(a3)
0748dc clr.w      $2cc6(a3)
0748e0 clr.w      $2da6(a3)
0748e4 move.l     #$1c106, $2fc0(a3)
0748ec move.l     #$10586, $2fc4(a3)
0748f4 move.w     #$ffff, $2fca(a3)
0748fa move.w     #$1, $2fd8(a3)
074900 clr.w      $2fb8(a3)
074904 lea.l      $7feda.l, a0
07490a move.l     a0, $80(a6)
07490e clr.w      $2fea(a3)
074912 clr.w      $2fc8(a3)
074916 bsr.w      $76284
07491a bsr.w      $73d9a
07491e bsr.w      $731f2
074922 bsr.w      $76406
074926 bsr.w      $765f6
07492a bsr.w      $731f8
07492e bra.w      $73eda
074932 movea.l    $2fc4(a3), a0
074936 move.w     #$270f, d7
07493a clr.l      (a0)+
07493c dbra       d7, $7493a
074940 moveq      #$1, d7
074942 lea.l      $74970(pc), a0
074946 lea.l      $749a0(pc), a1
07494a moveq      #$8, d1
07494c move.w     (a1)+, d2
07494e moveq      #$17, d6
074950 move.b     (a0)+, d0
074952 movem.l    d0-d7/a0-a5, -(a7)
074956 movea.l    $2fc4(a3), a0
07495a moveq      #$5, d4
07495c bsr.w      $761f8
074960 movem.l    (a7)+, d0-d7/a0-a5
074964 addq.w     #$1, d1
074966 dbra       d6, $74950
07496a dbra       d7, $7494a
07496e rts        
074970 bsr.b      $749e6
074972 moveq      #$65, d2
074974 blt.b      $749e6
074976 moveq      #$69, d2
074978 bgt.b      $749e1
07497a movea.l    $6c69(a4, d6.l * 8), a0
074980 bgt.b      $749ed
074982 movea.l    $2e(a5, d7.w), a0
074986 move.l     $2020(a6), d7
07498a moveq      #$72, d0
07498c bcs.b      $74a01
07498e .byte      0x73, 0x20
074990 bcs.b      $74a05
074992 bls.b      $749f5
074994 moveq      #$65, d0
074996 movea.l    $7175(a4, d6.l * 8), a0
07499c bvs.b      $74a12
07499e move.l     -(a0), d7
0749a0 ori.w      #$78, d6
0749a4 lea.l      $7e42a.l, a0
0749aa lea.l      $7ed0e.l, a1
0749b0 lea.l      $7f5f2.l, a2
0749b6 move.l     #$7fed2, d0
0749bc move.w     d0, $6(a0)
0749c0 move.w     d0, $6(a1)
0749c4 move.w     d0, $6(a2)
0749c8 swap       d0
0749ca move.w     d0, $2(a0)
0749ce move.w     d0, $2(a1)
0749d2 move.w     d0, $2(a2)
0749d6 move.w     $3038(a3), d0
0749da eori.w     #$1, d0
0749de mulu.w     #$68, d0
0749e2 addi.w     #$60, d0
0749e6 move.w     d0, $2e94(a3)
0749ea clr.l      $306c(a3)
0749ee clr.l      $3140(a3)
0749f2 clr.l      $2fe0(a3)
0749f6 clr.l      $2fe4(a3)
0749fa move.l     #$7ecfe, d3
074a00 move.l     #$7f5e2, d2
074a06 move.l     #$7fec6, d1
074a0c tst.w      $3038(a3)
074a10 beq.b      $74a24
074a12 move.l     #$7e8f6, d3
074a18 move.l     #$7f1da, d2
074a1e move.l     #$7fabe, d1
074a24 lea.l      $7e8ea.l, a2
074a2a lea.l      $7f1ce.l, a1
074a30 lea.l      $7fab2.l, a0
074a36 move.w     d3, $6(a2)
074a3a move.w     d2, $6(a1)
074a3e move.w     d1, $6(a0)
074a42 swap       d3
074a44 swap       d2
074a46 swap       d1
074a48 move.w     d3, $2(a2)
074a4c move.w     d2, $2(a1)
074a50 move.w     d1, $2(a0)
074a54 lea.l      $7ecfe.l, a0
074a5a lea.l      $7f5e2.l, a1
074a60 lea.l      $7fec6.l, a2
074a66 move.w     #$8002, d0
074a6a cmpi.w     #$2, $303a(a3)
074a70 bne.b      $74a76
074a72 move.w     #$8000, d0
074a76 move.w     d0, $6(a0)
074a7a move.w     d0, $6(a1)
074a7e move.w     d0, $6(a2)
074a82 rts        
074a84 move.w     d0, -(a7)
074a86 moveq      #$3, d1
074a88 bsr.b      $74ac8
074a8a move.w     (a7)+, d0
074a8c addi.w     #$80, d0
074a90 move.w     d0, $2cfa(a3)
074a94 tst.w      $2fb8(a3)
074a98 bne.b      $74ac0
074a9a tst.w      $303a(a3)
074a9e beq.b      $74ab8
074aa0 move.w     $2cfa(a3), d0
074aa4 bsr.w      $731fe
074aa8 tst.w      $2fb8(a3)
074aac bne.b      $74ac0
074aae move.w     $2cfa(a3), d0
074ab2 cmp.w      $2cfc(a3), d0
074ab6 bne.b      $74aa0
074ab8 moveq      #$3, d1
074aba bsr.b      $74ac8
074abc moveq      #$0, d0
074abe rts        
074ac0 moveq      #$3, d1
074ac2 bsr.b      $74ac8
074ac4 moveq      #$ff, d0
074ac6 rts        
074ac8 move.w     $6(a6), d0
074acc bpl.b      $74ac8
074ace move.w     $6(a6), d0
074ad2 bmi.b      $74ace
074ad4 dbra       d1, $74ac8
074ad8 rts        
074ada bsr.w      $76ec8
074ade tst.w      $2fb8(a3)
074ae2 bne.w      $74e7a
074ae6 tst.w      $2fda(a3)
074aea bne.w      $74e7a
074aee lea.l      $2dd4(a3), a0
074af2 lea.l      $2dee(a3), a1
074af6 clr.w      (a0)+
074af8 cmpa.l     a0, a1
074afa bne.b      $74af6
074afc lea.l      $2dde(a3), a0
074b00 move.w     $2db8(a3), d0
074b04 add.w      d0, d0
074b06 move.w     #$1, (a0, d0.w)
074b0c move.w     #$1, d1
074b10 move.w     $2db8(a3), d0
074b14 cmp.w      #$0, d0
074b18 beq.b      $74b44
074b1a cmp.w      #$1, d0
074b1e beq.b      $74b4a
074b20 cmp.w      #$2, d0
074b24 beq.b      $74b54
074b26 cmp.w      #$3, d0
074b2a beq.b      $74b5a
074b2c cmp.w      #$4, d0
074b30 beq.b      $74b60
074b32 cmp.w      #$5, d0
074b36 beq.b      $74b66
074b38 cmp.w      #$6, d0
074b3c beq.b      $74b6c
074b3e cmp.w      #$7, d0
074b42 beq.b      $74b72
074b44 move.w     d1, $2dd4(a3)
074b48 bra.b      $74b7e
074b4a move.w     d1, $2dd8(a3)
074b4e move.w     d1, $2dda(a3)
074b52 bra.b      $74b7e
074b54 move.w     d1, $2dda(a3)
074b58 bra.b      $74b7e
074b5a move.w     d1, $2ddc(a3)
074b5e bra.b      $74b7e
074b60 move.w     d1, $2dd6(a3)
074b64 bra.b      $74b7e
074b66 move.w     d1, $2dd8(a3)
074b6a bra.b      $74b7e
074b6c move.w     d1, $2dd4(a3)
074b70 bra.b      $74b7e
074b72 move.w     d1, $2ddc(a3)
074b76 move.w     d1, $2dd6(a3)
074b7a move.w     d1, $2dd4(a3)
074b7e move.b     #$62, d0
074b82 tst.w      $2dec(a3)
074b86 bne.b      $74b8c
074b88 move.b     #$65, d0
074b8c lea.l      $2947(a3), a0
074b90 move.b     d0, (a0)
074b92 lea.l      $74f8e(pc), a0
074b96 move.l     a0, $2ff2(a3)
074b9a lea.l      $75026(pc), a0
074b9e move.l     a0, $2ff6(a3)
074ba2 lea.l      $750be(pc), a0
074ba6 move.l     a0, $2ffa(a3)
074baa move.w     $2db8(a3), d0
074bae andi.w     #$1, d0
074bb2 bne.b      $74bcc
074bb4 lea.l      $750c8(pc), a0
074bb8 move.l     a0, $2ff2(a3)
074bbc lea.l      $75160(pc), a0
074bc0 move.l     a0, $2ff6(a3)
074bc4 lea.l      $751f8(pc), a0
074bc8 move.l     a0, $2ffa(a3)
074bcc move.w     #$1, $3026(a3)
074bd2 move.w     #$6, $3028(a3)
074bd8 move.w     #$3, $302a(a3)
074bde move.w     $2db8(a3), d0
074be2 add.w      d0, d0
074be4 lea.l      -$72f0(a3), a0
074be8 move.w     (a0, d0.w), $2c82(a3)
074bee lea.l      -$72d0(a3), a0
074bf2 move.w     (a0, d0.w), d1
074bf6 move.w     d1, $2c84(a3)
074bfa lea.l      -$72c0(a3), a0
074bfe move.w     (a0, d0.w), $2c86(a3)
074c04 add.w      d1, $2c86(a3)
074c08 lea.l      -$72e0(a3), a0
074c0c move.w     (a0, d0.w), d0
074c10 mulu.w     #$2000, d0
074c14 divu.w     #$c0, d0
074c18 move.w     d0, $2f9a(a3)
074c1c tst.w      $2dec(a3)
074c20 bne.b      $74c64
074c22 tst.w      $2de6(a3)
074c26 bne.b      $74c52
074c28 tst.w      $2de4(a3)
074c2c bne.b      $74c40
074c2e move.w     #$1e, d3
074c32 move.w     #$a00, d0
074c36 move.w     #$a00, d1
074c3a move.w     #$2, d2
074c3e bra.b      $74c74
074c40 move.w     #$f, d3
074c44 move.w     #$355, d0
074c48 move.w     #$6aa, d1
074c4c move.w     #$8, d2
074c50 bra.b      $74c74
074c52 move.w     #$14, d3
074c56 move.w     #$0, d0
074c5a move.w     #$a00, d1
074c5e move.w     #$4, d2
074c62 bra.b      $74c74
074c64 move.w     #$19, d3
074c68 move.w     #$6aa, d0
074c6c move.w     #$6aa, d1
074c70 move.w     #$4, d2
074c74 move.w     d0, $2f7c(a3)
074c78 move.w     d1, $2f7e(a3)
074c7c move.w     d2, $2f80(a3)
074c80 move.w     d3, $2f82(a3)
074c84 move.w     $2c84(a3), d0
074c88 lsr.w      #$2, d0
074c8a addq.w     #$2, d0
074c8c move.w     d0, $302e(a3)
074c90 lea.l      -$7bb0(a3), a0
074c94 lea.l      $2188(a3), a1
074c98 move.w     $2db8(a3), d0
074c9c cmp.w      #$2, d0
074ca0 beq.b      $74cb6
074ca2 cmp.w      #$3, d0
074ca6 beq.b      $74cb2
074ca8 cmp.w      #$1, d0
074cac bne.b      $74cb8
074cae moveq      #$11, d0
074cb0 bra.b      $74cb8
074cb2 moveq      #$1a, d0
074cb4 bra.b      $74cb8
074cb6 moveq      #$8, d0
074cb8 mulu.w     #$40, d0
074cbc adda.w     d0, a0
074cbe move.w     #$11f, d7
074cc2 move.w     (a0)+, (a1)+
074cc4 dbra       d7, $74cc2
074cc8 lea.l      -$70b0(a3), a0
074ccc lea.l      $23f8(a3), a1
074cd0 move.w     $2db8(a3), d0
074cd4 mulu.w     #$40, d0
074cd8 adda.w     d0, a0
074cda moveq      #$1f, d7
074cdc move.w     (a0)+, (a1)+
074cde dbra       d7, $74cdc
074ce2 lea.l      -$72b0(a3), a0
074ce6 lea.l      $2478(a3), a1
074cea move.w     $2db8(a3), d0
074cee mulu.w     #$40, d0
074cf2 adda.w     d0, a0
074cf4 moveq      #$1f, d7
074cf6 move.w     (a0)+, (a1)+
074cf8 dbra       d7, $74cf6
074cfc lea.l      -$6eb0(a3), a0
074d00 lea.l      $2438(a3), a1
074d04 move.w     $2db8(a3), d0
074d08 mulu.w     #$40, d0
074d0c adda.w     d0, a0
074d0e moveq      #$1f, d7
074d10 move.w     (a0)+, (a1)+
074d12 dbra       d7, $74d10
074d16 lea.l      -$6cb0(a3), a0
074d1a lea.l      $24b8(a3), a1
074d1e move.w     $2db8(a3), d0
074d22 mulu.w     #$28, d0
074d26 adda.w     d0, a0
074d28 moveq      #$13, d7
074d2a move.w     (a0)+, (a1)+
074d2c dbra       d7, $74d2a
074d30 lea.l      -$7d30(a3), a0
074d34 move.w     $2db8(a3), d1
074d38 mulu.w     #$30, d1
074d3c adda.w     d1, a0
074d3e lea.l      $24e0(a3), a1
074d42 adda.w     #$94, a1
074d46 moveq      #$17, d7
074d48 move.w     -(a0), -(a1)
074d4a dbra       d7, $74d48
074d4e moveq      #$31, d7
074d50 move.w     (a0), -(a1)
074d52 dbra       d7, $74d50
074d56 tst.w      $2dec(a3)
074d5a beq.b      $74d7e
074d5c lea.l      -$7bb0(a3), a0
074d60 movea.l    $7e422.l, a1
074d66 move.l     a1, $2574(a3)
074d6a adda.w     #$94, a1
074d6e moveq      #$17, d7
074d70 move.w     -(a0), -(a1)
074d72 dbra       d7, $74d70
074d76 moveq      #$31, d7
074d78 move.w     (a0), -(a1)
074d7a dbra       d7, $74d78
074d7e lea.l      $24e0(a3), a0
074d82 move.l     a0, $2c74(a3)
074d86 bsr.w      $773b4
074d8a lea.l      -$7fe0(a3), a0
074d8e move.w     $2db8(a3), d0
074d92 mulu.w     #$30, d0
074d96 adda.w     d0, a0
074d98 lea.l      $23c8(a3), a1
074d9c moveq      #$2f, d7
074d9e move.b     (a0)+, (a1)+
074da0 dbra       d7, $74d9e
074da4 move.l     $7e422.l, d0
074daa tst.w      $2dec(a3)
074dae beq.b      $74db6
074db0 addi.l     #$94, d0
074db6 move.l     d0, $2d06(a3)
074dba bsr.w      $768bc
074dbe add.l      $2d06(a3), d0
074dc2 move.l     d0, $2d0a(a3)
074dc6 tst.w      $2fb8(a3)
074dca bne.w      $74e7a
074dce tst.w      $2fda(a3)
074dd2 bne.w      $74e7a
074dd6 move.l     d0, -(a7)
074dd8 bsr.w      $76bbc
074ddc move.l     (a7)+, d0
074dde move.l     $2d02(a3), d1
074de2 add.l      d1, d0
074de4 move.l     d0, $2d0e(a3)
074de8 add.l      d1, d0
074dea move.l     d0, $2d12(a3)
074dee bsr.w      $76d00
074df2 tst.w      $2fb8(a3)
074df6 bne.w      $74e7a
074dfa tst.w      $2fda(a3)
074dfe bne.w      $74e7a
074e02 move.l     $2cec(a3), d0
074e06 divu.w     #$140, d0
074e0a move.w     d0, $2c78(a3)
074e0e bsr.w      $76d16
074e12 move.l     $2d12(a3), d0
074e16 move.w     $2c78(a3), d1
074e1a mulu.w     #$1e0, d1
074e1e add.l      d1, d0
074e20 move.l     d0, $2d16(a3)
074e24 bsr.w      $76d7a
074e28 tst.w      $2fb8(a3)
074e2c bne.b      $74e7a
074e2e tst.w      $2fda(a3)
074e32 bne.b      $74e7a
074e34 lea.l      -$8000(a3), a0
074e38 lea.l      -$340e(a3), a1
074e3c clr.w      (a0)+
074e3e cmpa.l     a0, a1
074e40 bne.b      $74e3c
074e42 bsr.w      $76e86
074e46 tst.w      $2fb8(a3)
074e4a bne.b      $74e7a
074e4c tst.w      $2fda(a3)
074e50 bne.b      $74e7a
074e52 bsr.w      $77116
074e56 bsr.w      $77136
074e5a bsr.w      $77140
074e5e bsr.w      $76ed8
074e62 bsr.w      $76cda
074e66 bsr.w      $77506
074e6a tst.w      $2fb8(a3)
074e6e bne.b      $74e7a
074e70 tst.w      $2fda(a3)
074e74 bne.b      $74e7a
074e76 moveq      #$0, d0
074e78 rts        
074e7a moveq      #$ff, d0
074e7c rts        
074e7e moveq      #$77, d2
074e80 bvs.b      $74eee
074e82 bvs.b      $74eeb
074e84 bvc.b      $74efa
074e86 move.l     -(a0), d0
074e88 move.l     -(a0), d0
074e8a moveq      #$65, d0
074e8c bsr.b      $74eae
074e8e .byte      0x73, 0x6f
074e90 .byte      0x75, 0x70
074e92 move.l     -(a0), d0
074e94 move.l     -(a0), d0
074e96 moveq      #$68, d2
074e98 bcs.b      $74eba
074e9a .byte      0x73, 0x6b
074e9c bvs.b      $74f02
074e9e .byte      0x73, 0x20
074ea0 move.l     -(a0), d0
074ea2 moveq      #$65, d0
074ea4 bsr.b      $74f09
074ea6 bvc.b      $74f0d
074ea8 .byte      0x73, 0x20
074eaa move.l     -(a0), d0
074eac move.l     -(a0), d0
074eae bge.b      $74f19
074eb0 moveq      #$65, d3
074eb2 moveq      #$70, d1
074eb4 ble.b      $74f25
074eb6 bge.b      $74ed8
074eb8 move.l     -(a0), d0
074eba bhi.b      $74f1d
074ebc beq.b      $74f2a
074ebe bcs.b      $74f39
074ec0 move.l     -(a0), d0
074ec2 move.l     -(a0), d0
074ec4 move.l     -(a0), d0
074ec6 bcs.b      $74ee8
074ec8 bhi.b      $74f39
074eca .byte      0x77, 0x20
074ecc move.l     -(a0), d0
074ece move.l     -(a0), d0
074ed0 move.l     -(a0), d0
074ed2 bcc.b      $74f49
074ed4 moveq      #$20, d4
074ed6 move.l     -(a0), d0
074ed8 move.l     -(a0), d0
074eda move.l     -(a0), d0
074edc move.l     -(a0), d0
074ede bcc.b      $74f45
074ee0 bcs.b      $74f55
074ee2 bvs.b      $74f48
074ee4 bcs.b      $74f06
074ee6 move.l     -(a0), d0
074ee8 move.l     -(a0), d0
074eea moveq      #$75, d2
074eec moveq      #$70, d1
074eee bcs.b      $74f5e
074ef0 moveq      #$69, d2
074ef2 bgt.b      $74f59
074ef4 move.l     -(a0), d0
074ef6 ori.b      #$32, $3c(a2, d0.w)
074efc ori.b      #$46, ccr
074f00 ori.w      #$50, d6
074f04 ori.w      #$5a, (a0)
074f08 ori.w      #$6e, -(a4)
074f0c ori.w      #$82, $8c.w
074f12 ori.l      #$a000a5, (a6)
074f18 ori.l      #$b400b9, $be(a2)
074f20 .byte      0x00, 0xc3
074f22 .byte      0x00, 0xc8
074f24 .byte      0x00, 0xcd
074f26 .byte      0x00, 0xd2
074f28 .byte      0x00, 0xd7
074f2a .byte      0x00, 0xdc
074f2c .byte      0x00, 0xe1
074f2e .byte      0x00, 0xe6
074f30 .byte      0x00, 0xeb
074f32 .byte      0x00, 0xf0
074f34 .byte      0x00, 0xf5
074f36 .byte      0x00, 0xfa
074f38 .byte      0x00, 0xff
074f3a btst.l     d0, d4
074f3c movep.w    $109(a1), d0
074f40 btst.l     d0, d4
074f42 .byte      0x00, 0xff
074f44 .byte      0x00, 0xfa
074f46 .byte      0x00, 0xf5
074f48 .byte      0x00, 0xf0
074f4a .byte      0x00, 0xeb
074f4c .byte      0x00, 0xe6
074f4e .byte      0x00, 0xe1
074f50 .byte      0x00, 0xdc
074f52 .byte      0x00, 0xd7
074f54 .byte      0x00, 0xd2
074f56 .byte      0x00, 0xcd
074f58 .byte      0x00, 0xc8
074f5a .byte      0x00, 0xc3
074f5c .byte      0x00, 0xbe
074f5e ori.l      #$b400aa, $a500a0.l
074f68 ori.l      #$8c0082, (a6)
074f6e ori.w      #$6e, $64.w
074f74 ori.w      #$50, (a2)+
074f78 ori.w      #$46, (a0)
074f7c ori.w      #$3c, d6
074f80 ori.b      #$32, ccr
074f84 ori.b      #$28, $1e(a2, d0.w)
074f8a ori.b      #$a, (a4)
074f8e ori.b      #$19, (a1)+
074f92 ori.b      #$1e, (a6)+
074f96 ori.b      #$23, -(a3)
074f9a ori.b      #$28, $2c(a0)
074fa0 ori.b      #$34, $38(a0, d0.w)
074fa6 ori.b      #$40, ccr
074faa ori.w      #$48, d4
074fae .byte      0x00, 0x4b
074fb0 .byte      0x00, 0x4e
074fb2 ori.w      #$54, (a1)
074fb6 ori.w      #$58, (a6)
074fba ori.w      #$5c, (a2)+
074fbe ori.w      #$5f, (a6)+
074fc2 ori.w      #$60, -(a0)
074fc6 ori.w      #$60, -(a0)
074fca ori.w      #$5e, (a7)+
074fce ori.w      #$5a, (a4)+
074fd2 ori.w      #$56, (a0)+
074fd6 ori.w      #$51, (a4)
074fda .byte      0x00, 0x4e
074fdc .byte      0x00, 0x4b
074fde .byte      0x00, 0x48
074fe0 ori.w      #$40, d4
074fe4 ori.b      #$38, ccr
074fe8 ori.b      #$30, $2c(a4, d0.w)
074fee ori.b      #$24, $20(a0)
074ff4 ori.b      #$18, (a4)+
074ff8 ori.b      #$10, (a4)
074ffc .byte      0x00, 0x0c
074ffe .byte      0x00, 0x08
075000 ori.b      #$0, d4
075004 .byte      0xff, 0xfb
075006 .byte      0xff, 0xf6
075008 .byte      0xff, 0xf1
07500a .byte      0xff, 0xec
07500c .byte      0xff, 0xe7
07500e .byte      0xff, 0xe2
075010 .byte      0xff, 0xd8
075012 .byte      0xff, 0xc4
075014 .byte      0xff, 0xb0
075016 .byte      0xff, 0x9c
075018 dc.w       $ff6a
07501a dc.w       $ff38
07501c .byte      0xff, 0x06
07501e dc.w       $fed4
075020 dc.w       $fe70
075022 dc.w       $fe0c
075024 .byte      0xfd, 0xa8
075026 .byte      0xff, 0xfb
075028 .byte      0xff, 0xfb
07502a .byte      0xff, 0xfb
07502c .byte      0xff, 0xfb
07502e .byte      0xff, 0xfb
075030 .byte      0xff, 0xfb
075032 .byte      0xff, 0xfb
075034 .byte      0xff, 0xfb
075036 .byte      0xff, 0xf6
075038 .byte      0xff, 0xf6
07503a .byte      0xff, 0xf6
07503c .byte      0xff, 0xf6
07503e .byte      0xff, 0xf6
075040 .byte      0xff, 0xf6
075042 .byte      0xff, 0xf6
075044 .byte      0xff, 0xf6
075046 .byte      0xff, 0xf1
075048 .byte      0xff, 0xf1
07504a .byte      0xff, 0xf1
07504c .byte      0xff, 0xf1
07504e .byte      0xff, 0xf1
075050 .byte      0xff, 0xf1
075052 .byte      0xff, 0xf1
075054 .byte      0xff, 0xf1
075056 .byte      0xff, 0xec
075058 .byte      0xff, 0xec
07505a .byte      0xff, 0xec
07505c .byte      0xff, 0xec
07505e .byte      0xff, 0xec
075060 .byte      0xff, 0xec
075062 .byte      0xff, 0xec
075064 .byte      0xff, 0xec
075066 .byte      0xff, 0xe7
075068 .byte      0xff, 0xe7
07506a .byte      0xff, 0xe7
07506c .byte      0xff, 0xe7
07506e .byte      0xff, 0xe2
075070 .byte      0xff, 0xe2
075072 .byte      0xff, 0xe2
075074 .byte      0xff, 0xe2
075076 .byte      0xff, 0xd8
075078 .byte      0xff, 0xd8
07507a .byte      0xff, 0xd8
07507c .byte      0xff, 0xd8
07507e .byte      0xff, 0xd3
075080 .byte      0xff, 0xd3
075082 .byte      0xff, 0xd3
075084 .byte      0xff, 0xd3
075086 .byte      0xff, 0xce
075088 .byte      0xff, 0xce
07508a .byte      0xff, 0xc9
07508c .byte      0xff, 0xc9
07508e .byte      0xff, 0xc4
075090 .byte      0xff, 0xc4
075092 .byte      0xff, 0xbf
075094 .byte      0xff, 0xbf
075096 .byte      0xff, 0xba
075098 .byte      0xff, 0xb5
07509a .byte      0xff, 0xb0
07509c .byte      0xff, 0xab
07509e .byte      0xff, 0xa6
0750a0 .byte      0xff, 0xa1
0750a2 .byte      0xff, 0x9c
0750a4 .byte      0xff, 0x97
0750a6 .byte      0xff, 0x92
0750a8 .byte      0xff, 0x88
0750aa dc.w       $ff74
0750ac .byte      0xff, 0x60
0750ae .byte      0xff, 0x4c
0750b0 dc.w       $ff38
0750b2 .byte      0xff, 0x06
0750b4 dc.w       $fed4
0750b6 dc.w       $fe70
0750b8 dc.w       $fe0c
0750ba .byte      0xfd, 0xa8
0750bc .byte      0xfd, 0x44
0750be move.w     (a5), $6455(a6)
0750c2 sub.l      d0, d3
0750c4 and.b      d0, d4
0750c6 dc.w       $f800
0750c8 ori.b      #$19, (a1)+
0750cc ori.b      #$1e, (a6)+
0750d0 ori.b      #$23, -(a3)
0750d4 ori.b      #$28, $2c(a0)
0750da ori.b      #$34, $38(a0, d0.w)
0750e0 ori.b      #$40, ccr
0750e4 ori.w      #$48, d4
0750e8 .byte      0x00, 0x4b
0750ea .byte      0x00, 0x4e
0750ec ori.w      #$54, (a1)
0750f0 ori.w      #$58, (a6)
0750f4 ori.w      #$5c, (a2)+
0750f8 ori.w      #$5f, (a6)+
0750fc ori.w      #$60, -(a0)
075100 ori.w      #$60, -(a0)
075104 ori.w      #$5c, (a6)+
075108 ori.w      #$56, (a2)+
07510c ori.w      #$4e, (a2)
075110 .byte      0x00, 0x4a
075112 ori.w      #$41, d6
075116 ori.b      #$37, ccr
07511a ori.b      #$2d, $28(a2, d0.w)
075120 ori.b      #$1e, -(a3)
075124 ori.b      #$14, (a1)+
075128 .byte      0x00, 0x0f
07512a .byte      0x00, 0x0a
07512c ori.b      #$0, d5
075130 .byte      0xff, 0xfa
075132 .byte      0xff, 0xf4
075134 .byte      0xff, 0xee
075136 .byte      0xff, 0xe8
075138 .byte      0xff, 0xe2
07513a .byte      0xff, 0xd8
07513c .byte      0xff, 0xce
07513e .byte      0xff, 0xc4
075140 .byte      0xff, 0xba
075142 .byte      0xff, 0xb0
075144 .byte      0xff, 0xa6
075146 .byte      0xff, 0x9c
075148 dc.w       $ff6a
07514a dc.w       $ff38
07514c dc.w       $fed4
07514e dc.w       $fe70
075150 .byte      0xfd, 0xa8
075152 .byte      0xfd, 0xa8
075154 .byte      0xfd, 0xa8
075156 .byte      0xfd, 0xa8
075158 .byte      0xfd, 0xa8
07515a .byte      0xfd, 0xa8
07515c .byte      0xfd, 0xa8
07515e .byte      0xfd, 0xa8
075160 .byte      0xff, 0xfb
075162 .byte      0xff, 0xfb
075164 .byte      0xff, 0xfb
075166 .byte      0xff, 0xfb
075168 .byte      0xff, 0xfb
07516a .byte      0xff, 0xfb
07516c .byte      0xff, 0xfb
07516e .byte      0xff, 0xfb
075170 .byte      0xff, 0xf6
075172 .byte      0xff, 0xf6
075174 .byte      0xff, 0xf6
075176 .byte      0xff, 0xf6
075178 .byte      0xff, 0xf6
07517a .byte      0xff, 0xf6
07517c .byte      0xff, 0xf6
07517e .byte      0xff, 0xf6
075180 .byte      0xff, 0xf1
075182 .byte      0xff, 0xf1
075184 .byte      0xff, 0xf1
075186 .byte      0xff, 0xf1
075188 .byte      0xff, 0xf1
07518a .byte      0xff, 0xf1
07518c .byte      0xff, 0xf1
07518e .byte      0xff, 0xf1
075190 .byte      0xff, 0xec
075192 .byte      0xff, 0xec
075194 .byte      0xff, 0xec
075196 .byte      0xff, 0xec
075198 .byte      0xff, 0xec
07519a .byte      0xff, 0xec
07519c .byte      0xff, 0xec
07519e .byte      0xff, 0xec
0751a0 .byte      0xff, 0xe7
0751a2 .byte      0xff, 0xe7
0751a4 .byte      0xff, 0xe7
0751a6 .byte      0xff, 0xe7
0751a8 .byte      0xff, 0xe2
0751aa .byte      0xff, 0xe2
0751ac .byte      0xff, 0xe2
0751ae .byte      0xff, 0xe2
0751b0 .byte      0xff, 0xd8
0751b2 .byte      0xff, 0xd8
0751b4 .byte      0xff, 0xd8
0751b6 .byte      0xff, 0xd8
0751b8 .byte      0xff, 0xce
0751ba .byte      0xff, 0xce
0751bc .byte      0xff, 0xce
0751be .byte      0xff, 0xce
0751c0 .byte      0xff, 0xc4
0751c2 .byte      0xff, 0xc4
0751c4 .byte      0xff, 0xba
0751c6 .byte      0xff, 0xba
0751c8 .byte      0xff, 0xb0
0751ca .byte      0xff, 0xb0
0751cc .byte      0xff, 0xa6
0751ce .byte      0xff, 0xa6
0751d0 .byte      0xff, 0x9c
0751d2 .byte      0xff, 0x88
0751d4 dc.w       $ff6a
0751d6 dc.w       $ff38
0751d8 dc.w       $fed4
0751da dc.w       $fe70
0751dc dc.w       $fe0c
0751de .byte      0xfd, 0xa8
0751e0 .byte      0xfd, 0x44
0751e2 .byte      0xfd, 0x44
0751e4 dc.w       $fce0
0751e6 dc.w       $fce0
0751e8 dc.w       $fc18
0751ea dc.w       $fc18
0751ec dc.w       $fc18
0751ee dc.w       $fc18
0751f0 dc.w       $fc18
0751f2 dc.w       $fc18
0751f4 dc.w       $fc18
0751f6 dc.w       $fc18
0751f8 move.w     d0, d6
0751fa bvc.b      $751a6
0751fc sub.b      d0, d3
0751fe abcd.b     d0, d1
075200 .byte      0xf1, 0xaa
075202 lea.l      $2838(a3), a0
075206 bsr.b      $7521c
075208 lea.l      $2850(a3), a0
07520c bsr.b      $7521c
07520e lea.l      $2868(a3), a0
075212 bsr.b      $7521c
075214 lea.l      $2880(a3), a0
075218 bsr.b      $7521c
07521a rts        
07521c cmpi.b     #$60, $17(a0)
075222 beq.b      $7526c
075224 lea.l      $2c5c(a3), a1
075228 moveq      #$12, d7
07522a move.b     $5(a0, d7.w), $5(a1, d7.w)
075230 dbra       d7, $7522a
075234 moveq      #$9, d7
075236 lea.l      $2c44(a3), a0
07523a moveq      #$10, d5
07523c move.b     $18(a0, d5.w), d0
075240 cmp.b      (a0, d5.w), d0
075244 bmi.b      $7526c
075246 bne.b      $75250
075248 addq.w     #$1, d5
07524a cmp.w      #$18, d5
07524e bne.b      $7523c
075250 moveq      #$12, d5
075252 move.b     $1d(a0, d5.w), d0
075256 move.b     $5(a0, d5.w), $1d(a0, d5.w)
07525c move.b     d0, $5(a0, d5.w)
075260 dbra       d5, $75252
075264 suba.w     #$18, a0
075268 dbra       d7, $7523a
07526c rts        
07526e moveq      #$4, d7
075270 moveq      #$0, d0
075272 move.w     $6(a6), d1
075276 eor.w      d1, d0
075278 ror.w      #$3, d0
07527a andi.w     #$3ff, d1
07527e addi.w     #$200, d1
075282 dbra       d1, $75282
075286 dbra       d7, $75272
07528a andi.b     #$7f, d0
07528e beq.b      $7526e
075290 move.b     d0, $2d1a(a3)
075294 rts        
075296 move.b     $2d1a(a3), d0
07529a lea.l      $2f4c(a3), a0
07529e moveq      #$1f, d7
0752a0 move.b     d0, (a0)+
0752a2 dbra       d7, $752a0
0752a6 rts        
0752a8 lea.l      $2d26(a3), a0
0752ac move.b     #$7f, (a0)+
0752b0 moveq      #$8, d0
0752b2 mulu.w     $3038(a3), d0
0752b6 addi.w     #$9, d0
0752ba move.b     d0, (a0)+
0752bc move.b     $2d1a(a3), (a0)+
0752c0 lea.l      $2848(a3), a1
0752c4 moveq      #$7, d7
0752c6 move.b     (a1)+, (a0)+
0752c8 dbra       d7, $752c6
0752cc lea.l      $2860(a3), a1
0752d0 moveq      #$7, d7
0752d2 move.b     (a1)+, (a0)+
0752d4 dbra       d7, $752d2
0752d8 bsr.w      $75552
0752dc rts        
0752de lea.l      $2d66(a3), a0
0752e2 move.b     (a0)+, d0
0752e4 cmpi.w     #$2, $303a(a3)
0752ea bne.b      $752f0
0752ec move.b     d0, $2d1a(a3)
0752f0 lea.l      $2878(a3), a1
0752f4 moveq      #$7, d7
0752f6 move.b     (a0)+, (a1)+
0752f8 dbra       d7, $752f6
0752fc lea.l      $2890(a3), a1
075300 moveq      #$7, d7
075302 move.b     (a0)+, (a1)+
075304 dbra       d7, $75302
075308 rts        
07530a lea.l      $2d26(a3), a0
07530e move.b     #$7f, (a0)+
075312 moveq      #$a, d0
075314 mulu.w     $3038(a3), d0
075318 addi.w     #$c, d0
07531c move.b     d0, (a0)+
07531e move.b     $3039(a3), d0
075322 addq.b     #$1, d0
075324 move.b     d0, (a0)+
075326 move.b     $2db9(a3), d0
07532a addq.b     #$1, d0
07532c move.b     d0, (a0)+
07532e lea.l      $28c8(a3), a1
075332 moveq      #$9, d7
075334 move.b     (a1)+, (a0)+
075336 dbra       d7, $75334
07533a lea.l      $28bc(a3), a1
07533e moveq      #$9, d7
075340 move.b     (a1)+, (a0)+
075342 dbra       d7, $75340
075346 bsr.w      $75552
07534a rts        
07534c lea.l      $2d66(a3), a0
075350 move.b     (a0)+, d0
075352 subq.b     #$1, d0
075354 move.b     d0, $2dbd(a3)
075358 move.b     (a0)+, d0
07535a subq.b     #$1, d0
07535c move.b     d0, $2d1d(a3)
075360 move.w     $2d1c(a3), d0
075364 cmp.w      $2db8(a3), d0
075368 bmi.b      $7536e
07536a move.w     d0, $2db8(a3)
07536e lea.l      $28d4(a3), a1
075372 moveq      #$9, d7
075374 move.b     (a0)+, (a1)+
075376 dbra       d7, $75374
07537a lea.l      $28e0(a3), a1
07537e moveq      #$9, d7
075380 move.b     (a0)+, (a1)+
075382 dbra       d7, $75380
075386 rts        
075388 lea.l      $2d26(a3), a0
07538c move.b     #$7f, (a0)+
075390 move.b     #$1, (a0)+
075394 move.b     $2cfe(a3), (a0)+
075398 bsr.w      $75552
07539c rts        
07539e lea.l      $2d66(a3), a0
0753a2 move.b     (a0)+, $2d00(a3)
0753a6 rts        
0753a8 lea.l      $28c8(a3), a0
0753ac lea.l      $283d(a3), a1
0753b0 moveq      #$9, d7
0753b2 move.b     (a0)+, (a1)+
0753b4 dbra       d7, $753b2
0753b8 lea.l      $28bc(a3), a0
0753bc lea.l      $2855(a3), a1
0753c0 moveq      #$9, d7
0753c2 move.b     (a0)+, (a1)+
0753c4 dbra       d7, $753c2
0753c8 lea.l      $28d4(a3), a0
0753cc lea.l      $286d(a3), a1
0753d0 moveq      #$9, d7
0753d2 move.b     (a0)+, (a1)+
0753d4 dbra       d7, $753d2
0753d8 lea.l      $28e0(a3), a0
0753dc lea.l      $2885(a3), a1
0753e0 moveq      #$9, d7
0753e2 move.b     (a0)+, (a1)+
0753e4 dbra       d7, $753e2
0753e8 lea.l      $2848(a3), a1
0753ec move.l     $306c(a3), d0
0753f0 bsr.b      $7542a
0753f2 moveq      #$7, d6
0753f4 lea.l      $2d1e(a3), a0
0753f8 move.b     (a0, d6.w), d0
0753fc addi.b     #$30, d0
075400 move.b     d0, (a1, d6.w)
075404 dbra       d6, $753f8
075408 lea.l      $2860(a3), a1
07540c move.l     $3140(a3), d0
075410 bsr.b      $7542a
075412 moveq      #$7, d6
075414 lea.l      $2d1e(a3), a0
075418 move.b     (a0, d6.w), d0
07541c addi.b     #$30, d0
075420 move.b     d0, (a1, d6.w)
075424 dbra       d6, $75418
075428 rts        
07542a lea.l      $2d26(a3), a0
07542e divu.w     #$2710, d0
075432 move.l     d0, d1
075434 swap       d0
075436 ext.l      d0
075438 ext.l      d1
07543a moveq      #$3, d7
07543c divu.w     #$a, d0
075440 swap       d0
075442 move.b     d0, -(a0)
075444 clr.w      d0
075446 swap       d0
075448 dbra       d7, $7543c
07544c moveq      #$3, d7
07544e divu.w     #$a, d1
075452 swap       d1
075454 move.b     d1, -(a0)
075456 clr.w      d1
075458 swap       d1
07545a dbra       d7, $7544e
07545e rts        
075460 move.l     #$706c7931, $2838(a3)
075468 move.l     #$706c7932, $2850(a3)
075470 move.l     #$706c7933, $2868(a3)
075478 move.l     #$706c7934, $2880(a3)
075480 moveq      #$1, d1
075482 moveq      #$1, d2
075484 moveq      #$1, d3
075486 moveq      #$1, d4
075488 tst.w      $303a(a3)
07548c bne.b      $75492
07548e moveq      #$0, d3
075490 moveq      #$0, d4
075492 tst.w      $2dbc(a3)
075496 bne.b      $7549a
075498 moveq      #$0, d4
07549a tst.w      $3038(a3)
07549e bne.b      $754a2
0754a0 moveq      #$0, d2
0754a2 movem.l    d1-d4, -(a7)
0754a6 lea.l      $2838(a3), a0
0754aa moveq      #$3, d7
0754ac move.l     (a7)+, d0
0754ae bne.b      $754bc
0754b0 moveq      #$17, d6
0754b2 move.b     #$60, (a0, d6.w)
0754b8 dbra       d6, $754b2
0754bc adda.w     #$18, a0
0754c0 dbra       d7, $754ac
0754c4 moveq      #$3, d7
0754c6 lea.l      $2838(a3), a0
0754ca moveq      #$3, d6
0754cc lea.l      $2838(a3), a1
0754d0 moveq      #$10, d5
0754d2 move.b     (a0, d5.w), d0
0754d6 cmp.b      (a1, d5.w), d0
0754da bmi.b      $7551a
0754dc bne.b      $75506
0754de addq.w     #$1, d5
0754e0 cmp.w      #$18, d5
0754e4 bne.b      $754d2
0754e6 moveq      #$5, d5
0754e8 move.b     (a0, d5.w), d0
0754ec cmp.b      (a1, d5.w), d0
0754f0 bmi.b      $75506
0754f2 bne.b      $7551a
0754f4 addq.w     #$1, d5
0754f6 cmp.w      #$f, d5
0754fa bne.b      $754e8
0754fc move.b     $3(a0), d0
075500 cmp.b      $3(a1), d0
075504 bpl.b      $7551a
075506 moveq      #$17, d5
075508 move.b     (a0, d5.w), d0
07550c move.b     (a1, d5.w), (a0, d5.w)
075512 move.b     d0, (a1, d5.w)
075516 dbra       d5, $75508
07551a adda.w     #$18, a1
07551e dbra       d6, $754d0
075522 adda.w     #$18, a0
075526 dbra       d7, $754ca
07552a lea.l      $2838(a3), a0
07552e moveq      #$3, d7
075530 moveq      #$10, d5
075532 cmpi.b     #$30, (a0, d5.w)
075538 bne.b      $75548
07553a move.b     #$20, (a0, d5.w)
075540 addq.w     #$1, d5
075542 cmp.w      #$17, d5
075546 bne.b      $75532
075548 adda.w     #$18, a0
07554c dbra       d7, $75530
075550 rts        
075552 lea.l      $2d26(a3), a0
075556 move.l     a0, $2cc2(a3)
07555a move.b     $2d27(a3), d0
07555e andi.w     #$ff, d0
075562 addq.w     #$2, d0
075564 move.w     d0, $2cc6(a3)
075568 tst.w      $2cc6(a3)
07556c bne.b      $75568
07556e moveq      #$3, d1
075570 bsr.w      $74ac8
075574 rts        
075576 lea.l      $bfe001.l, a0
07557c move.b     #$8, $e00(a0)
075582 move.b     #$0, $400(a0)
075588 move.b     #$0, $f00(a0)
07558e move.b     #$7f, $d00(a0)
075594 move.b     #$99, $d00(a0)
07559a move.b     #$0, $300(a0)
0755a0 move.b     $d00(a0), d0
0755a4 lea.l      $755ba(pc), a0
0755a8 move.l     a0, $68.w
0755ac move.w     #$8, $9c(a6)
0755b2 move.w     #$c008, $9a(a6)
0755b8 rts        
0755ba movem.l    d0-d1/a0/a3/a6, -(a7)
0755be lea.l      $dff000.l, a6
0755c4 movea.l    $7e41e.l, a3
0755ca lea.l      $bfe001.l, a0
0755d0 move.b     $d00(a0), d0
0755d4 btst.b     #$0, d0
0755d8 bne.b      $7564e
0755da btst.b     #$3, d0
0755de bne.b      $755e2
0755e0 bra.b      $75654
0755e2 move.b     $c00(a0), d0
0755e6 nop        
0755e8 nop        
0755ea nop        
0755ec not.b      d0
0755ee ror.b      #$1, d0
0755f0 move.b     d0, $2fb6(a3)
0755f4 bset.b     #$6, $e00(a0)
0755fa move.b     #$1, $500(a0)
075600 cmpi.w     #$1, $2f48(a3)
075606 bne.b      $7564c
075608 move.b     $2f46(a3), d1
07560c cmp.b      #$31, d0
075610 beq.b      $75660
075612 cmp.b      #$32, d0
075616 beq.b      $75666
075618 cmp.b      #$28, d0
07561c beq.b      $7566c
07561e cmp.b      #$38, d0
075622 beq.b      $75672
075624 cmp.b      #$40, d0
075628 beq.b      $75678
07562a cmp.b      #$b1, d0
07562e beq.b      $7567e
075630 cmp.b      #$b2, d0
075634 beq.b      $75684
075636 cmp.b      #$a8, d0
07563a beq.b      $7568a
07563c cmp.b      #$b8, d0
075640 beq.b      $75690
075642 cmp.b      #$c0, d0
075646 beq.b      $75696
075648 move.b     d1, $2f46(a3)
07564c bra.b      $75654
07564e bclr.b     #$6, $e00(a0)
075654 move.w     #$8, $9c(a6)
07565a movem.l    (a7)+, d0-d1/a0/a3/a6
07565e rte        
075660 bset.b     #$0, d1
075664 bra.b      $75648
075666 bset.b     #$1, d1
07566a bra.b      $75648
07566c bset.b     #$3, d1
075670 bra.b      $75648
075672 bset.b     #$2, d1
075676 bra.b      $75648
075678 bset.b     #$4, d1
07567c bra.b      $75648
07567e bclr.b     #$0, d1
075682 bra.b      $75648
075684 bclr.b     #$1, d1
075688 bra.b      $75648
07568a bclr.b     #$3, d1
07568e bra.b      $75648
075690 bclr.b     #$2, d1
075694 bra.b      $75648
075696 bclr.b     #$4, d1
07569a bra.b      $75648
07569c move.b     $2fb6(a3), d0
0756a0 move.b     #$ff, $2fb6(a3)
0756a6 ext.w      d0
0756a8 move.w     d0, $2fb4(a3)
0756ac rts        
0756ae move.l     $2fc0(a3), -(a7)
0756b2 move.l     $2fc4(a3), $2fc0(a3)
0756b8 move.l     (a7)+, $2fc4(a3)
0756bc rts        
0756be move.w     d0, -(a7)
0756c0 move.w     $1e(a6), d0
0756c4 andi.w     #$3, d0
0756c8 move.w     d0, $9c(a6)
0756cc move.w     (a7)+, d0
0756ce rte        
0756d0 movem.l    d0-d7/a0-a6, -(a7)
0756d4 movea.l    $7e41e.l, a3
0756da lea.l      $dff000.l, a6
0756e0 move.w     $1e(a6), d0
0756e4 andi.w     #$10, d0
0756e8 beq.w      $757e0
0756ec move.w     d0, $9c(a6)
0756f0 bsr.w      $77782
0756f4 bsr.b      $7569c
0756f6 tst.w      $2da8(a3)
0756fa beq.b      $75710
0756fc btst.b     #$4, $2f94(a3)
075702 beq.b      $75710
075704 move.w     #$1, $2fda(a3)
07570a move.w     #$1, $7fc.w
075710 cmpi.w     #$40, $2fb4(a3)
075716 bne.b      $7571e
075718 move.w     #$1, $2fdc(a3)
07571e tst.w      $2da6(a3)
075722 beq.b      $75730
075724 cmpi.w     #$45, $2fb4(a3)
07572a bne.b      $75730
07572c bsr.w      $738b8
075730 tst.w      $2fd8(a3)
075734 bne.w      $757d8
075738 addq.w     #$1, $2fd0(a3)
07573c cmpi.w     #$2000, $2fd0(a3)
075742 bne.b      $7574a
075744 move.w     #$1000, $2fd0(a3)
07574a move.w     $2fd0(a3), d0
07574e cmp.w      $2fd2(a3), d0
075752 bne.b      $7575a
075754 move.w     #$1, $2fc8(a3)
07575a cmp.w      $2fd4(a3), d0
07575e bne.b      $75766
075760 move.w     #$ffff, $2fc8(a3)
075766 cmp.w      $2fd6(a3), d0
07576a bne.b      $75774
07576c move.w     #$1, $2fd8(a3)
075772 bra.b      $757d8
075774 move.w     $2fc8(a3), d0
075778 beq.b      $757a6
07577a bpl.b      $7578c
07577c add.w      d0, $2fea(a3)
075780 bpl.b      $757a2
075782 clr.w      $2fea(a3)
075786 clr.w      $2fc8(a3)
07578a bra.b      $757a2
07578c add.w      d0, $2fea(a3)
075790 cmpi.w     #$8, $2fea(a3)
075796 bcs.b      $757a2
075798 move.w     #$8, $2fea(a3)
07579e clr.w      $2fc8(a3)
0757a2 bsr.w      $76284
0757a6 move.w     $2fca(a3), d0
0757aa cmp.w      #$20, d0
0757ae beq.b      $757d4
0757b0 cmp.w      #$f, d0
0757b4 beq.b      $757ce
0757b6 cmp.w      #$2c, d0
0757ba beq.b      $757c8
0757bc cmp.w      #$11, d0
0757c0 bne.b      $757d8
0757c2 bsr.w      $7595a
0757c6 bra.b      $757d8
0757c8 bsr.w      $75ace
0757cc bra.b      $757d8
0757ce bsr.w      $7589a
0757d2 bra.b      $757d8
0757d4 bsr.w      $75b38
0757d8 bsr.w      $73d82
0757dc bsr.w      $73914
0757e0 movem.l    (a7)+, d0-d7/a0-a6
0757e4 rte        
0757e6 ori.b      #$0, d0
0757ea ori.b      #$0, d0
0757ee .byte      0x00, 0x0c
0757f0 .byte      0x00, 0x0c
0757f2 .byte      0x00, 0x0c
0757f4 .byte      0x00, 0x0c
0757f6 ori.b      #$1a, (a2)+
0757fa ori.b      #$1a, (a2)+
0757fe ori.b      #$33, -(a3)
075802 ori.w      #$97, -(a5)
075806 ori.b      #$33, -(a3)
07580a ori.w      #$97, -(a5)
07580e ori.b      #$33, -(a3)
075812 ori.w      #$97, -(a5)
075816 .byte      0x00, 0x0e
075818 ori.b      #$10, (a0)
07581c ori.b      #$14, (a0)
075820 ori.b      #$11, (a1)
075824 ori.b      #$f, (a1)
075828 ori.b      #$12, (a2)
07582c ori.b      #$0, (a2)
075830 ori.b      #$0, d0
075834 ori.b      #$e, d0
075838 .byte      0x00, 0x0e
07583a .byte      0x00, 0x0e
07583c .byte      0x00, 0x0e
07583e ori.b      #$1c, (a4)+
075842 ori.b      #$1c, (a4)+
075846 ori.b      #$3f, -(a3)
07584a ori.w      #$a3, $23(a1, d0.w)
075850 .byte      0x00, 0x3f
075852 ori.w      #$a3, $23(a1, d0.w)
075858 .byte      0x00, 0x3f
07585a ori.w      #$a3, ([$2000c])
075864 .byte      0xff, 0xff
075866 .byte      0xff, 0xff
075868 ori.b      #$a, d0
07586c .byte      0xff, 0xff
07586e .byte      0xff, 0xff
075870 ori.b      #$6, d4
075874 .byte      0x00, 0x08
075876 ori.b      #$2, d0
07587a ori.b      #$0, d2
07587e ori.b      #$2, d0
075882 ori.b      #$0, d2
075886 ori.b      #$2, d0
07588a ori.b      #$2, d2
07588e ori.b      #$e, d0
075892 ori.b      #$27, (a4)+
075896 ori.b      #$27, -(a7)
07589a move.w     $2fd0(a3), d0
07589e cmp.w      $2fd4(a3), d0
0758a2 bcc.b      $758c6
0758a4 btst.b     #$4, $3072(a3)
0758aa beq.b      $758c8
0758ac move.w     $2fd4(a3), d0
0758b0 subq.w     #$1, d0
0758b2 move.w     d0, $2fd0(a3)
0758b6 lea.l      $76524(pc), a0
0758ba move.b     #$78, $b9(a0)
0758c0 move.b     #$78, $ba(a0)
0758c6 rts        
0758c8 move.w     $3032(a3), d0
0758cc btst.b     #$0, $3072(a3)
0758d2 beq.b      $758da
0758d4 subq.w     #$1, d0
0758d6 bpl.b      $758da
0758d8 moveq      #$1d, d0
0758da btst.b     #$1, $3072(a3)
0758e0 beq.b      $758ec
0758e2 addq.w     #$1, d0
0758e4 cmp.w      #$1e, d0
0758e8 bmi.b      $758ec
0758ea moveq      #$0, d0
0758ec move.w     d0, $3032(a3)
0758f0 addq.w     #$2, d0
0758f2 ext.l      d0
0758f4 divu.w     #$a, d0
0758f8 move.w     d0, d2
0758fa swap       d0
0758fc move.w     d0, d3
0758fe lea.l      $76524(pc), a0
075902 addi.b     #$30, d2
075906 addi.b     #$30, d3
07590a move.b     d2, $b9(a0)
07590e move.b     d3, $ba(a0)
075912 movea.l    $2fc0(a3), a0
075916 adda.l     #$1dc8, a0
07591c moveq      #$4, d7
07591e moveq      #$9, d6
075920 clr.l      (a0)
075922 adda.w     #$28, a0
075926 dbra       d6, $75920
07592a adda.w     #$1db0, a0
07592e dbra       d7, $7591e
075932 moveq      #$19, d1
075934 move.w     #$be, d2
075938 moveq      #$1, d6
07593a lea.l      $765dd(pc), a0
07593e move.b     (a0)+, d0
075940 movem.l    d0-d7/a0-a5, -(a7)
075944 movea.l    $2fc0(a3), a0
075948 moveq      #$5, d4
07594a bsr.w      $761f4
07594e movem.l    (a7)+, d0-d7/a0-a5
075952 addq.w     #$1, d1
075954 dbra       d6, $7593e
075958 rts        
07595a move.w     $2fd0(a3), d0
07595e ext.l      d0
075960 divu.w     #$2, d0
075964 swap       d0
075966 cmp.w      #$1, d0
07596a bne.w      $75a46
07596e swap       d0
075970 subi.w     #$20, d0
075974 bmi.b      $7598c
075976 cmp.w      #$50, d0
07597a bcc.w      $75a46
07597e lea.l      $75ae8(pc), a0
075982 move.b     (a0, d0.w), d0
075986 andi.w     #$ff, d0
07598a bra.b      $7598e
07598c clr.w      d0
07598e move.w     $3034(a3), d1
075992 andi.w     #$1, d1
075996 beq.w      $75a48
07599a lea.l      $25d46.l, a1
0759a0 mulu.w     #$230, d0
0759a4 adda.l     d0, a1
0759a6 movea.l    a1, a2
0759a8 movea.l    a1, a4
0759aa movea.l    a1, a5
0759ac adda.w     #$f50, a2
0759b0 adda.w     #$2df0, a4
0759b4 adda.w     #$3d40, a5
0759b8 movea.l    $2fc0(a3), a0
0759bc adda.w     #$eb4, a0
0759c0 moveq      #$1b, d7
0759c2 move.l     (a5)+, $7d00(a0)
0759c6 move.l     (a4)+, $5dc0(a0)
0759ca move.l     $f50(a2), $3e80(a0)
0759d0 move.l     (a2)+, $1f40(a0)
0759d4 move.l     (a1)+, (a0)+
0759d6 move.l     (a5)+, $7d00(a0)
0759da move.l     (a4)+, $5dc0(a0)
0759de move.l     $f50(a2), $3e80(a0)
0759e4 move.l     (a2)+, $1f40(a0)
0759e8 move.l     (a1)+, (a0)+
0759ea move.w     (a5)+, $7d00(a0)
0759ee move.w     (a4)+, $5dc0(a0)
0759f2 move.w     $f50(a2), $3e80(a0)
0759f8 move.w     (a2)+, $1f40(a0)
0759fc move.w     (a1)+, (a0)+
0759fe adda.w     #$c, a0
075a02 move.l     (a5)+, $7d00(a0)
075a06 move.l     (a4)+, $5dc0(a0)
075a0a move.l     $f50(a2), $3e80(a0)
075a10 move.l     (a2)+, $1f40(a0)
075a14 move.l     (a1)+, (a0)+
075a16 move.l     (a5)+, $7d00(a0)
075a1a move.l     (a4)+, $5dc0(a0)
075a1e move.l     $f50(a2), $3e80(a0)
075a24 move.l     (a2)+, $1f40(a0)
075a28 move.l     (a1)+, (a0)+
075a2a move.w     (a5)+, $7d00(a0)
075a2e move.w     (a4)+, $5dc0(a0)
075a32 move.w     $f50(a2), $3e80(a0)
075a38 move.w     (a2)+, $1f40(a0)
075a3c move.w     (a1)+, (a0)+
075a3e adda.w     #$8, a0
075a42 dbra       d7, $759c2
075a46 rts        
075a48 lea.l      $25d46.l, a1
075a4e mulu.w     #$1d0, d0
075a52 adda.l     d0, a1
075a54 movea.l    a1, a2
075a56 movea.l    a1, a4
075a58 movea.l    a1, a5
075a5a adda.w     #$cb0, a2
075a5e adda.w     #$2610, a4
075a62 adda.w     #$32c0, a5
075a66 movea.l    $2fc0(a3), a0
075a6a adda.w     #$106e, a0
075a6e moveq      #$1c, d7
075a70 move.l     (a5)+, $7d00(a0)
075a74 move.l     (a4)+, $5dc0(a0)
075a78 move.l     $cb0(a2), $3e80(a0)
075a7e move.l     (a2)+, $1f40(a0)
075a82 move.l     (a1)+, (a0)+
075a84 move.l     (a5)+, $7d00(a0)
075a88 move.l     (a4)+, $5dc0(a0)
075a8c move.l     $cb0(a2), $3e80(a0)
075a92 move.l     (a2)+, $1f40(a0)
075a96 move.l     (a1)+, (a0)+
075a98 adda.w     #$c, a0
075a9c move.l     (a5)+, $7d00(a0)
075aa0 move.l     (a4)+, $5dc0(a0)
075aa4 move.l     $cb0(a2), $3e80(a0)
075aaa move.l     (a2)+, $1f40(a0)
075aae move.l     (a1)+, (a0)+
075ab0 move.l     (a5)+, $7d00(a0)
075ab4 move.l     (a4)+, $5dc0(a0)
075ab8 move.l     $cb0(a2), $3e80(a0)
075abe move.l     (a2)+, $1f40(a0)
075ac2 move.l     (a1)+, (a0)+
075ac4 adda.w     #$c, a0
075ac8 dbra       d7, $75a70
075acc rts        
075ace cmpi.w     #$113, $2fd0(a3)
075ad4 bne.b      $75ae6
075ad6 bsr.w      $73d9a
075ada lea.l      $27c86.l, a0
075ae0 moveq      #$6, d0
075ae2 bsr.w      $762a8
075ae6 rts        
075ae8 btst.l     d0, d1
075aea andi.b     #$3, d2
075aee btst.l     d1, d3
075af0 btst.l     d1, d3
075af2 btst.l     d1, d3
075af4 btst.l     d1, d3
075af6 btst.l     d1, d3
075af8 btst.l     d1, d3
075afa btst.l     d1, d3
075afc subi.b     #$6, d5
075b00 btst.l     d2, d5
075b02 subi.b     #$3, d4
075b06 btst.l     d1, d3
075b08 subi.b     #$6, d5
075b0c btst.l     d2, d5
075b0e subi.b     #$3, d4
075b12 btst.l     d1, d3
075b14 btst.l     d1, d3
075b16 btst.l     d1, d3
075b18 btst.l     d1, d3
075b1a btst.l     d1, d3
075b1c btst.l     d1, d3
075b1e btst.l     d1, d3
075b20 btst.l     d1, d3
075b22 btst.l     d1, d3
075b24 btst.l     d1, d3
075b26 btst.l     d1, d3
075b28 btst.l     d1, d3
075b2a btst.l     d1, d3
075b2c btst.l     d1, d3
075b2e btst.l     d1, d3
075b30 btst.l     d1, d3
075b32 btst.l     d1, d2
075b34 andi.b     #$0, d1
075b38 tst.w      $2dac(a3)
075b3c bpl.w      $75bd4
075b40 move.w     $2daa(a3), d0
075b44 move.w     d0, d1
075b46 btst.b     #$3, $3072(a3)
075b4c beq.b      $75b5c
075b4e move.w     d0, d2
075b50 andi.w     #$fffc, d2
075b54 subq.w     #$1, d0
075b56 andi.w     #$3, d0
075b5a or.w       d2, d0
075b5c btst.b     #$2, $3072(a3)
075b62 beq.b      $75b72
075b64 move.w     d0, d2
075b66 andi.w     #$fffc, d2
075b6a addq.w     #$1, d0
075b6c andi.w     #$3, d0
075b70 or.w       d2, d0
075b72 btst.b     #$0, $3072(a3)
075b78 beq.b      $75b82
075b7a subq.w     #$4, d0
075b7c bpl.b      $75b82
075b7e addi.w     #$c, d0
075b82 btst.b     #$1, $3072(a3)
075b88 beq.b      $75b96
075b8a addq.w     #$4, d0
075b8c cmp.w      #$c, d0
075b90 bmi.b      $75b96
075b92 subi.w     #$c, d0
075b96 move.w     d0, $2daa(a3)
075b9a cmp.w      d0, d1
075b9c beq.b      $75c0c
075b9e move.w     d1, -(a7)
075ba0 tst.w      d1
075ba2 beq.b      $75bb6
075ba4 cmp.w      #$4, d1
075ba8 beq.b      $75bbc
075baa cmp.w      #$8, d1
075bae bne.b      $75bc0
075bb0 bsr.w      $75ce4
075bb4 bra.b      $75bc0
075bb6 bsr.w      $75cb8
075bba bra.b      $75bc0
075bbc bsr.w      $75cce
075bc0 move.w     (a7)+, d1
075bc2 moveq      #$2, d5
075bc4 move.w     d1, d4
075bc6 bsr.w      $73ac6
075bca move.w     $2daa(a3), $2dac(a3)
075bd0 bra.w      $75c62
075bd4 move.w     $2dac(a3), d4
075bd8 move.w     d4, -(a7)
075bda cmp.w      #$0, d4
075bde beq.b      $75bf8
075be0 cmp.w      #$4, d4
075be4 beq.b      $75bf2
075be6 cmp.w      #$8, d4
075bea bne.b      $75bfc
075bec bsr.w      $75f08
075bf0 bra.b      $75bfc
075bf2 bsr.w      $75ec8
075bf6 bra.b      $75bfc
075bf8 bsr.w      $75ee8
075bfc move.w     (a7)+, d4
075bfe moveq      #$1, d5
075c00 move.w     #$ffff, $2dac(a3)
075c06 bsr.w      $73ac6
075c0a bra.b      $75c62
075c0c cmpi.w     #$0, $2daa(a3)
075c12 beq.b      $75c6a
075c14 cmpi.w     #$4, $2daa(a3)
075c1a beq.b      $75c84
075c1c cmpi.w     #$8, $2daa(a3)
075c22 beq.w      $75c9e
075c26 btst.b     #$4, $3072(a3)
075c2c beq.b      $75c62
075c2e cmpi.w     #$7, $2daa(a3)
075c34 beq.b      $75c64
075c36 move.w     $2daa(a3), d4
075c3a add.w      d4, d4
075c3c lea.l      $75876(pc), a2
075c40 move.w     (a2, d4.w), d0
075c44 beq.b      $75c62
075c46 lea.l      $2b38(a3), a2
075c4a move.w     (a2, d4.w), d5
075c4e addq.w     #$1, d5
075c50 cmp.w      d0, d5
075c52 bne.b      $75c56
075c54 clr.w      d5
075c56 move.w     d5, (a2, d4.w)
075c5a move.w     $2daa(a3), d4
075c5e bsr.w      $73af4
075c62 rts        
075c64 bsr.w      $76278
075c68 rts        
075c6a clr.w      d4
075c6c moveq      #$2, d5
075c6e bsr.w      $73b38
075c72 bsr.w      $75d42
075c76 bsr.w      $75ee8
075c7a clr.w      d4
075c7c moveq      #$1, d5
075c7e bsr.w      $73b38
075c82 rts        
075c84 moveq      #$1, d4
075c86 moveq      #$2, d5
075c88 bsr.w      $73b38
075c8c bsr.w      $75dc2
075c90 bsr.w      $75ec8
075c94 moveq      #$1, d4
075c96 moveq      #$1, d5
075c98 bsr.w      $73b38
075c9c rts        
075c9e moveq      #$2, d4
075ca0 moveq      #$2, d5
075ca2 bsr.w      $73b38
075ca6 bsr.w      $75e42
075caa bsr.w      $75f08
075cae moveq      #$2, d4
075cb0 moveq      #$1, d5
075cb2 bsr.w      $73b38
075cb6 rts        
075cb8 clr.w      d4
075cba moveq      #$2, d5
075cbc bsr.w      $73b38
075cc0 bsr.w      $75ee2
075cc4 clr.w      d4
075cc6 moveq      #$1, d5
075cc8 bsr.w      $73b38
075ccc rts        
075cce moveq      #$1, d4
075cd0 moveq      #$2, d5
075cd2 bsr.w      $73b38
075cd6 bsr.w      $75ec2
075cda moveq      #$1, d4
075cdc moveq      #$1, d5
075cde bsr.w      $73b38
075ce2 rts        
075ce4 moveq      #$2, d4
075ce6 moveq      #$2, d5
075ce8 bsr.w      $73b38
075cec bsr.w      $75f02
075cf0 moveq      #$2, d4
075cf2 moveq      #$1, d5
075cf4 bsr.w      $73b38
075cf8 rts        
075cfa move.l     $33(a1, d3.w), -(a3)
075cfe move.w     $37(a5, d3.w), d2
075d02 move.w     $302d2bff.l, d4
075d08 dc.w       $ff30
075d0a .byte      0x71, 0x77
075d0c bcs.b      $75d80
075d0e moveq      #$79, d2
075d10 .byte      0x75, 0x69
075d12 ble.b      $75d84
075d14 .byte      0xff, 0xff
075d16 dc.w       $ff31
075d18 move.w     ([$64666768, a3], $6a6b6cff), d1
075d24 .byte      0xff, 0xff
075d26 dc.w       $ff34
075d28 move.w     ([$78637662, a6], $6e6d), -(a2)
075d32 move.l     -$1(a6), d6
075d36 dc.w       $ff37
075d38 move.w     $2080ffff.l, d4
075d3e .byte      0xff, 0x81
075d40 .byte      0x80, 0xff
075d42 move.w     $2b2c(a3), d1
075d46 lea.l      $28c8(a3), a1
075d4a move.w     $2fb4(a3), d0
075d4e cmp.w      #$48, d0
075d52 bcc.b      $75dc0
075d54 tst.w      $2b32(a3)
075d58 bne.b      $75d76
075d5a clr.w      d1
075d5c clr.w      $2b2c(a3)
075d60 move.l     #$20202020, d2
075d66 move.l     d2, (a1)
075d68 move.l     d2, $4(a1)
075d6c move.l     d2, $8(a1)
075d70 move.w     #$1, $2b32(a3)
075d76 lea.l      $75cfa(pc), a0
075d7a move.b     (a0, d0.w), d0
075d7e cmp.b      #$80, d0
075d82 beq.b      $75dac
075d84 bcc.b      $75dc0
075d86 cmp.w      #$a, d1
075d8a beq.b      $75dc0
075d8c tst.w      $2dae(a3)
075d90 beq.b      $75da2
075d92 cmp.b      #$61, d0
075d96 bcs.b      $75da2
075d98 cmp.b      #$7b, d0
075d9c bcc.b      $75da2
075d9e subi.w     #$20, d0
075da2 move.b     d0, (a1, d1.w)
075da6 addq.w     #$1, $2b2c(a3)
075daa bra.b      $75dc0
075dac tst.w      d1
075dae beq.b      $75dc0
075db0 move.b     #$20, (a1, d1.w)
075db6 move.b     #$20, -$1(a1, d1.w)
075dbc subq.w     #$1, $2b2c(a3)
075dc0 rts        
075dc2 move.w     $2b2e(a3), d1
075dc6 lea.l      $28b0(a3), a1
075dca move.w     $2fb4(a3), d0
075dce cmp.w      #$48, d0
075dd2 bcc.b      $75e40
075dd4 tst.w      $2b34(a3)
075dd8 bne.b      $75df6
075dda clr.w      d1
075ddc clr.w      $2b2e(a3)
075de0 move.l     #$20202020, d2
075de6 move.l     d2, (a1)
075de8 move.l     d2, $4(a1)
075dec move.l     d2, $8(a1)
075df0 move.w     #$1, $2b34(a3)
075df6 lea.l      $75cfa(pc), a0
075dfa move.b     (a0, d0.w), d0
075dfe cmp.b      #$80, d0
075e02 beq.b      $75e2c
075e04 bcc.b      $75e40
075e06 cmp.w      #$b, d1
075e0a beq.b      $75e40
075e0c tst.w      $2dae(a3)
075e10 beq.b      $75e22
075e12 cmp.b      #$61, d0
075e16 bcs.b      $75e22
075e18 cmp.b      #$7b, d0
075e1c bcc.b      $75e22
075e1e subi.w     #$20, d0
075e22 move.b     d0, (a1, d1.w)
075e26 addq.w     #$1, $2b2e(a3)
075e2a bra.b      $75e40
075e2c tst.w      d1
075e2e beq.b      $75e40
075e30 move.b     #$20, (a1, d1.w)
075e36 move.b     #$20, -$1(a1, d1.w)
075e3c subq.w     #$1, $2b2e(a3)
075e40 rts        
075e42 move.w     $2b30(a3), d1
075e46 lea.l      $28bc(a3), a1
075e4a move.w     $2fb4(a3), d0
075e4e cmp.w      #$48, d0
075e52 bcc.b      $75ec0
075e54 tst.w      $2b36(a3)
075e58 bne.b      $75e76
075e5a clr.w      d1
075e5c clr.w      $2b30(a3)
075e60 move.l     #$20202020, d2
075e66 move.l     d2, (a1)
075e68 move.l     d2, $4(a1)
075e6c move.l     d2, $8(a1)
075e70 move.w     #$1, $2b36(a3)
075e76 lea.l      $75cfa(pc), a0
075e7a move.b     (a0, d0.w), d0
075e7e cmp.b      #$80, d0
075e82 beq.b      $75eac
075e84 bcc.b      $75ec0
075e86 cmp.w      #$a, d1
075e8a beq.b      $75ec0
075e8c tst.w      $2dae(a3)
075e90 beq.b      $75ea2
075e92 cmp.b      #$61, d0
075e96 bcs.b      $75ea2
075e98 cmp.b      #$7b, d0
075e9c bcc.b      $75ea2
075e9e subi.w     #$20, d0
075ea2 move.b     d0, (a1, d1.w)
075ea6 addq.w     #$1, $2b30(a3)
075eaa bra.b      $75ec0
075eac tst.w      d1
075eae beq.b      $75ec0
075eb0 move.b     #$20, (a1, d1.w)
075eb6 move.b     #$20, -$1(a1, d1.w)
075ebc subq.w     #$1, $2b30(a3)
075ec0 rts        
075ec2 move.b     #$20, d0
075ec6 bra.b      $75ed2
075ec8 move.w     $2fd0(a3), d0
075ecc andi.w     #$2, d0
075ed0 asl.w      #$4, d0
075ed2 lea.l      $28b0(a3), a0
075ed6 move.w     $2b2e(a3), d1
075eda move.b     d0, (a0, d1.w)
075ede bsr.b      $75f22
075ee0 rts        
075ee2 move.b     #$20, d0
075ee6 bra.b      $75ef2
075ee8 move.w     $2fd0(a3), d0
075eec andi.w     #$2, d0
075ef0 asl.w      #$4, d0
075ef2 lea.l      $28c7(a3), a0
075ef6 move.w     $2b2c(a3), d1
075efa move.b     d0, $1(a0, d1.w)
075efe bsr.b      $75f22
075f00 rts        
075f02 move.b     #$20, d0
075f06 bra.b      $75f12
075f08 move.w     $2fd0(a3), d0
075f0c andi.w     #$2, d0
075f10 asl.w      #$4, d0
075f12 lea.l      $28bc(a3), a0
075f16 move.w     $2b30(a3), d1
075f1a move.b     d0, (a0, d1.w)
075f1e bsr.b      $75f22
075f20 rts        
075f22 movea.l    #$2f986, a2
075f28 move.l     $4(a2), d3
075f2c adda.w     #$8, a2
075f30 move.l     $98(a2), d0
075f34 adda.l     d0, a2
075f36 move.l     d3, d4
075f38 mulu.w     #$5, d4
075f3c movea.l    a2, a4
075f3e adda.l     d4, a4
075f40 moveq      #$b, d6
075f42 move.b     (a0)+, d0
075f44 andi.w     #$ff, d0
075f48 movea.l    #$3f386, a1
075f4e move.w     d0, d1
075f50 andi.w     #$1f, d1
075f54 adda.w     d1, a1
075f56 andi.w     #$ffe0, d0
075f5a mulu.w     #$9, d0
075f5e adda.w     d0, a1
075f60 moveq      #$8, d7
075f62 move.b     (a1), (a2)
075f64 move.b     $480(a1), (a2, d3.w)
075f6a move.b     $900(a1), (a4)
075f6e adda.w     #$c, a2
075f72 adda.w     #$c, a4
075f76 adda.w     #$20, a1
075f7a dbra       d7, $75f62
075f7e suba.w     #$6b, a2
075f82 suba.w     #$6b, a4
075f86 dbra       d6, $75f42
075f8a rts        
075f8c ori.b      #$32, (a6)+
075f90 .byte      0x00, 0x3e
075f92 .byte      0x00, 0x4a
075f94 ori.w      #$62, (a6)
075f98 ori.w      #$7a, $86(a6)
075f9e ori.l      #$9e7e0a, (a2)
075fa4 lea.l      $2b54(a3), a0
075fa8 lea.l      $75f8c(pc), a1
075fac moveq      #$8, d1
075fae move.w     (a1)+, d2
075fb0 moveq      #$17, d6
075fb2 moveq      #$0, d0
075fb4 move.b     (a0)+, d0
075fb6 movem.l    d0-d7/a0-a5, -(a7)
075fba movea.l    $2fc4(a3), a0
075fbe moveq      #$5, d4
075fc0 bsr.w      $761f8
075fc4 movem.l    (a7)+, d0-d7/a0-a5
075fc8 addq.w     #$1, d1
075fca dbra       d6, $75fb2
075fce dbra       d7, $75fac
075fd2 rts        
075fd4 .byte      0x00, 0x8c
075fd6 ori.l      #$a000aa, (a6)
075fdc ori.l      #$20202020, $2020.w
075fe4 move.l     -(a0), d0
075fe6 move.l     -(a0), d0
075fe8 move.l     -(a0), d0
075fea move.l     -(a0), d0
075fec move.l     -(a0), d0
075fee move.l     -(a0), d0
075ff0 move.l     -(a0), d0
075ff2 move.l     -(a0), d0
075ff4 move.l     -(a0), d0
075ff6 movea.l    ([$73776f72, a0], $64202d2d), a0
076002 move.l     -(a0), -(a6)
076004 moveq      #$77, d2
076006 bvs.b      $76074
076008 bvs.b      $76071
07600a bvc.b      $76080
07600c move.l     -(a0), d0
07600e movea.l    ([$73776f72, a0], $64202d2d), a0
07601a move.l     -(a0), -(a6)
07601c moveq      #$65, d0
07601e bsr.b      $76040
076020 .byte      0x73, 0x6f
076022 .byte      0x75, 0x70
076024 move.l     -(a0), d0
076026 movea.l    ([$73776f72, a0], $64202d2d), a0
076032 move.l     -(a0), -(a6)
076034 moveq      #$68, d2
076036 bcs.b      $76058
076038 .byte      0x73, 0x6b
07603a bvs.b      $760a0
07603c .byte      0x73, 0x20
07603e move.l     -(a0), d0
076040 moveq      #$61, d0
076042 .byte      0x73, 0x73
076044 .byte      0x77, 0x6f
076046 moveq      #$64, d1
076048 move.l     $2d2d(a5), d0
07604c movea.l    ([$6368, a0]), a0
076052 bcs.b      $760c7
076054 move.l     -(a0), d0
076056 movea.l    ([$73776f72, a0], $64202d2d), a0
076062 move.l     -(a0), -(a6)
076064 bge.b      $760cf
076066 moveq      #$65, d3
076068 moveq      #$70, d1
07606a ble.b      $760db
07606c bge.b      $7608e
07606e move.l     -(a0), d0
076070 moveq      #$61, d0
076072 .byte      0x73, 0x73
076074 .byte      0x77, 0x6f
076076 moveq      #$64, d1
076078 move.l     $2d2d(a5), d0
07607c movea.l    -(a2), a0
07607e bsr.b      $760e7
076080 bge.b      $760e7
076082 .byte      0x79, 0x20
076084 move.l     -(a0), d0
076086 move.l     -(a0), d0
076088 movea.l    ([$73776f72, a0], $64202d2d), a0
076094 move.l     -(a0), -(a6)
076096 bcs.b      $760b8
076098 bhi.b      $76109
07609a .byte      0x77, 0x20
07609c move.l     -(a0), d0
07609e move.l     -(a0), d0
0760a0 move.l     -(a0), d0
0760a2 movea.l    -(a6), a0
0760a4 ble.b      $76118
0760a6 bcs.b      $7611b
0760a8 moveq      #$20, d2
0760aa bls.b      $7611b
0760ac .byte      0x75, 0x72
0760ae .byte      0x73, 0x65
0760b0 move.l     -(a0), d0
0760b2 move.l     -(a0), d0
0760b4 move.l     -(a0), d0
0760b6 move.l     -(a0), d0
0760b8 move.l     -(a0), d0
0760ba movea.l    $6967(a6), a0
0760be bvc.b      $76134
0760c0 movea.l    -(a3), a0
0760c2 ble.b      $76139
0760c4 moveq      #$73, d1
0760c6 bcs.b      $760e8
0760c8 move.l     -(a0), d0
0760ca move.l     -(a0), d0
0760cc move.l     -(a0), d0
0760ce move.l     -(a0), d0
0760d0 move.l     -(a0), d0
0760d2 move.l     -(a0), d0
0760d4 movea.l    -(a6), a0
0760d6 ble.b      $7613f
0760d8 movea.l    -(a3), a0
0760da ble.b      $76151
0760dc moveq      #$73, d1
0760de bcs.b      $76100
0760e0 move.l     -(a0), d0
0760e2 move.l     -(a0), d0
0760e4 move.l     -(a0), d0
0760e6 move.l     -(a0), d0
0760e8 move.l     -(a0), d0
0760ea move.l     -(a0), d0
0760ec .byte      0x73, 0x6e
0760ee ble.b      $76167
0760f0 movea.l    -(a3), a0
0760f2 ble.b      $76169
0760f4 moveq      #$73, d1
0760f6 bcs.b      $76118
0760f8 move.l     -(a0), d0
0760fa move.l     -(a0), d0
0760fc move.l     -(a0), d0
0760fe move.l     -(a0), d0
076100 move.l     -(a0), d0
076102 movea.l    -(a4), a0
076104 bcs.b      $76179
076106 bcs.b      $7617a
076108 moveq      #$20, d2
07610a bls.b      $7617b
07610c .byte      0x75, 0x72
07610e .byte      0x73, 0x65
076110 move.l     -(a0), d0
076112 move.l     -(a0), d0
076114 move.l     -(a0), d0
076116 move.l     -(a0), d0
076118 move.l     -(a0), d0
07611a movea.l    $6f74(a5), a0
07611e ble.b      $76192
076120 .byte      0x77, 0x61
076122 .byte      0x79, 0x20
076124 bls.b      $76195
076126 .byte      0x75, 0x72
076128 .byte      0x73, 0x65
07612a move.l     -(a0), d0
07612c move.l     -(a0), d0
07612e move.l     -(a0), d0
076130 move.l     -(a0), d0
076132 movea.l    $6172(a5), a0
076136 .byte      0x73, 0x68
076138 movea.l    -(a3), a0
07613a ble.b      $761b1
07613c moveq      #$73, d1
07613e bcs.b      $76160
076140 move.l     -(a0), d0
076142 move.l     -(a0), d0
076144 move.l     -(a0), d0
076146 move.l     -(a0), d0
076148 move.l     -(a0), d0
07614a movea.l    $6f(a3, d7.w), a0
07614e moveq      #$6d, d1
076150 movea.l    -(a3), a0
076152 ble.b      $761c9
076154 moveq      #$73, d1
076156 bcs.b      $76178
076158 move.l     -(a0), d0
07615a move.l     -(a0), d0
07615c move.l     -(a0), d0
07615e move.l     -(a0), d0
076160 move.l     -(a0), d0
076162 move.l     -(a0), d0
076164 bne.b      $761cf
076166 bgt.b      $761c9
076168 bge.b      $7618a
07616a .byte      0x73, 0x63
07616c ble.b      $761e0
07616e bcs.b      $761e3
076170 move.l     -(a0), d0
076172 move.l     -(a0), d0
076174 move.l     -(a0), d0
076176 lea.l      $7609e(pc), a0
07617a mulu.w     #$18, d0
07617e adda.w     d0, a0
076180 moveq      #$8, d1
076182 moveq      #$8, d2
076184 moveq      #$17, d6
076186 move.b     (a0)+, d0
076188 movem.l    d0-d7/a0-a5, -(a7)
07618c movea.l    $2fc4(a3), a0
076190 moveq      #$6, d4
076192 bsr.b      $761f8
076194 movem.l    (a7)+, d0-d7/a0-a5
076198 addq.w     #$1, d1
07619a dbra       d6, $76186
07619e rts        
0761a0 moveq      #$3, d7
0761a2 bra.b      $761a6
0761a4 moveq      #$4, d7
0761a6 move.w     $2db8(a3), d0
0761aa cmp.w      #$8, d0
0761ae beq.b      $761f2
0761b0 lea.l      $75fde(pc), a0
0761b4 mulu.w     #$18, d0
0761b8 adda.w     d0, a0
0761ba lea.l      $2898(a3), a1
0761be moveq      #$17, d0
0761c0 move.b     (a0)+, (a1)+
0761c2 dbra       d0, $761c0
0761c6 lea.l      $2838(a3), a0
0761ca lea.l      $75fd4(pc), a1
0761ce moveq      #$8, d1
0761d0 move.w     (a1)+, d2
0761d2 moveq      #$17, d6
0761d4 moveq      #$0, d0
0761d6 move.b     (a0)+, d0
0761d8 movem.l    d0-d7/a0-a5, -(a7)
0761dc movea.l    $2fc4(a3), a0
0761e0 moveq      #$6, d4
0761e2 bsr.b      $761f8
0761e4 movem.l    (a7)+, d0-d7/a0-a5
0761e8 addq.w     #$1, d1
0761ea dbra       d6, $761d4
0761ee dbra       d7, $761ce
0761f2 rts        
0761f4 movea.l    $2fc0(a3), a0
0761f8 movea.l    #$3f386, a1
0761fe mulu.w     #$28, d2
076202 adda.w     d2, a0
076204 adda.w     d1, a0
076206 move.w     d0, d1
076208 andi.w     #$1f, d1
07620c adda.w     d1, a1
07620e andi.w     #$ffe0, d0
076212 mulu.w     #$9, d0
076216 adda.w     d0, a1
076218 moveq      #$8, d7
07621a move.b     $900(a1), d0
07621e move.b     $480(a1), d1
076222 move.b     (a1), d2
076224 cmp.w      #$5, d4
076228 beq.b      $76236
07622a adda.w     #$1f40, a0
07622e and.b      d0, $7d00(a0)
076232 suba.w     #$1f40, a0
076236 and.b      d0, $7d00(a0)
07623a and.b      d0, $5dc0(a0)
07623e and.b      d0, $3e80(a0)
076242 and.b      d0, $1f40(a0)
076246 or.b       d1, $1f40(a0)
07624a and.b      d0, (a0)
07624c or.b       d2, (a0)
07624e adda.w     #$28, a0
076252 adda.w     #$20, a1
076256 dbra       d7, $7621a
07625a rts        
07625c move.w     $2fd0(a3), d0
076260 cmp.w      $2fd4(a3), d0
076264 bcc.b      $76274
076266 btst.b     #$4, $2f94(a3)
07626c beq.b      $76274
07626e bsr.b      $76278
076270 moveq      #$ff, d0
076272 rts        
076274 moveq      #$0, d0
076276 rts        
076278 move.w     $2fd4(a3), d0
07627c subq.w     #$1, d0
07627e move.w     d0, $2fd0(a3)
076282 rts        
076284 lea.l      $7ff72.l, a0
07628a lea.l      $5800.l, a1
076290 move.w     $2fea(a3), d0
076294 mulu.w     #$40, d0
076298 adda.w     d0, a1
07629a moveq      #$1f, d7
07629c move.w     (a1)+, $2(a0)
0762a0 addq.w     #$4, a0
0762a2 dbra       d7, $7629c
0762a6 rts        
0762a8 move.w     d0, d1
0762aa asl.w      #$4, d1
0762ac asl.w      #$8, d1
0762ae ori.w      #$200, d1
0762b2 move.w     d1, $7ff20.l
0762b8 lea.l      $7ff42.l, a1
0762be move.l     a0, d1
0762c0 bra.b      $762d6
0762c2 move.w     d1, $6(a1)
0762c6 swap       d1
0762c8 move.w     d1, $2(a1)
0762cc swap       d1
0762ce addq.w     #$8, a1
0762d0 addi.l     #$1f40, d1
0762d6 dbra       d0, $762c2
0762da rts        
0762dc lea.l      $31f6(a3), a0
0762e0 lea.l      $5800.l, a1
0762e6 moveq      #$0, d6
0762e8 movea.l    a0, a2
0762ea moveq      #$1f, d7
0762ec move.w     (a2)+, d0
0762ee move.w     d0, d1
0762f0 move.w     d0, d2
0762f2 andi.w     #$f00, d0
0762f6 mulu.w     d6, d0
0762f8 andi.w     #$f000, d0
0762fc andi.w     #$f0, d1
076300 mulu.w     d6, d1
076302 andi.w     #$f00, d1
076306 andi.w     #$f, d2
07630a mulu.w     d6, d2
07630c andi.w     #$f0, d2
076310 add.w      d1, d0
076312 add.w      d2, d0
076314 lsr.w      #$4, d0
076316 move.w     d0, (a1)+
076318 dbra       d7, $762ec
07631c addq.w     #$2, d6
07631e cmp.w      #$12, d6
076322 bne.b      $762e8
076324 rts        
076326 moveq      #$27, d0
076328 move.l     $7d964.l, d1
07632e move.l     d1, $7d970.l
076334 jsr        $7db4c.l
07633a tst.w      $2fb8(a3)
07633e bne.b      $7636c
076340 moveq      #$25, d0
076342 move.l     #$5a40, d1
076348 move.l     d1, $7d96c.l
07634e jsr        $7db4c.l
076354 tst.w      $2fb8(a3)
076358 bne.b      $7636c
07635a movea.l    $7d96c.l, a0
076360 adda.l     $2cec(a3), a0
076364 moveq      #$1, d0
076366 jsr        $7d978.l
07636c rts        
07636e moveq      #$27, d0
076370 move.l     #$62b40, d1
076376 move.l     d1, $7d970.l
07637c jsr        $7db4c.l
076382 tst.w      $2fb8(a3)
076386 bne.b      $763b4
076388 moveq      #$26, d0
07638a move.l     #$4b5ca, d1
076390 move.l     d1, $7d96c.l
076396 jsr        $7db4c.l
07639c tst.w      $2fb8(a3)
0763a0 bne.b      $763b4
0763a2 movea.l    $7d96c.l, a0
0763a8 adda.l     $2cec(a3), a0
0763ac moveq      #$2, d0
0763ae jsr        $7d978.l
0763b4 rts        
0763b6 moveq      #$27, d0
0763b8 move.l     $7d964.l, d1
0763be move.l     d1, $7d970.l
0763c4 jsr        $7db4c.l
0763ca tst.w      $2fb8(a3)
0763ce bne.b      $76404
0763d0 moveq      #$28, d0
0763d2 add.w      $2db8(a3), d0
0763d6 move.l     #$5a40, d1
0763dc move.l     d1, $7d96c.l
0763e2 jsr        $7db4c.l
0763e8 tst.w      $2fb8(a3)
0763ec bne.b      $76404
0763ee movea.l    $7d96c.l, a0
0763f4 adda.l     $2cec(a3), a0
0763f8 moveq      #$3, d0
0763fa add.w      $2db8(a3), d0
0763fe jsr        $7d978.l
076404 rts        
076406 moveq      #$27, d0
076408 move.l     #$62b40, d1
07640e move.l     d1, $7d970.l
076414 jsr        $7db4c.l
07641a tst.w      $2fb8(a3)
07641e bne.b      $7644c
076420 moveq      #$24, d0
076422 move.l     #$4e5d6, d1
076428 move.l     d1, $7d96c.l
07642e jsr        $7db4c.l
076434 tst.w      $2fb8(a3)
076438 bne.b      $7644c
07643a movea.l    $7d96c.l, a0
076440 adda.l     $2cec(a3), a0
076444 clr.w      d0
076446 jsr        $7d978.l
07644c rts        
07644e moveq      #$21, d0
076450 move.l     #$3f386, d1
076456 jsr        $7db4c.l
07645c move.w     #$fa, d0
076460 move.l     #$33806, d1
076466 jsr        $7db4c.l
07646c bsr.w      $7526e
076470 bsr.w      $75296
076474 move.w     #$ff, d7
076478 bsr.w      $78c18
07647c dbra       d7, $76478
076480 andi.w     #$1f, d0
076484 cmp.w      #$1e, d0
076488 bpl.b      $7646c
07648a move.w     d0, $3030(a3)
07648e movea.l    $2fc4(a3), a0
076492 move.w     #$270f, d7
076496 clr.l      (a0)+
076498 dbra       d7, $76496
07649c moveq      #$4, d7
07649e lea.l      $76524(pc), a0
0764a2 lea.l      $765ec(pc), a1
0764a6 clr.w      d1
0764a8 move.w     (a1)+, d2
0764aa moveq      #$27, d6
0764ac move.b     (a0)+, d0
0764ae movem.l    d0-d7/a0-a5, -(a7)
0764b2 movea.l    $2fc4(a3), a0
0764b6 moveq      #$5, d4
0764b8 bsr.w      $761f8
0764bc movem.l    (a7)+, d0-d7/a0-a5
0764c0 addq.w     #$1, d1
0764c2 dbra       d6, $764ac
0764c6 dbra       d7, $764a6
0764ca movea.l    $2fc4(a3), a1
0764ce adda.w     #$d30, a1
0764d2 moveq      #$60, d7
0764d4 move.l     #$ffffffff, (a1)
0764da move.l     #$ffffffff, $4(a1)
0764e2 adda.w     #$28, a1
0764e6 dbra       d7, $764d4
0764ea move.w     $3030(a3), d0
0764ee ext.l      d0
0764f0 divu.w     #$a, d0
0764f4 move.w     d0, d1
0764f6 mulu.w     #$a00, d1
0764fa swap       d0
0764fc asl.w      #$2, d0
0764fe add.w      d0, d1
076500 movea.l    #$33806, a0
076506 movea.l    $2fc4(a3), a1
07650a adda.l     #$fb2, a1
076510 adda.w     d1, a0
076512 moveq      #$3f, d7
076514 move.l     (a0), (a1)
076516 adda.w     #$28, a0
07651a adda.w     #$28, a1
07651e dbra       d7, $76514
076522 rts        
076524 movea.l    -(a3), a0
076526 moveq      #$61, d1
076528 bls.b      $76595
07652a bcs.b      $76590
07652c movea.l    -(a2), a0
07652e .byte      0x79, 0x20
076530 moveq      #$68, d2
076532 bcs.b      $76554
076534 bls.b      $765a5
076536 blt.b      $765a8
076538 bsr.b      $765a8
07653a .byte      0x79, 0x20
07653c bvs.b      $765ac
07653e move.l     ([$31202020, a1, d3.l]), d0
076546 move.l     -(a0), d0
076548 move.l     -(a0), d0
07654a move.l     -(a0), d0
07654c move.l     -(a0), d0
07654e move.l     -(a0), d0
076550 move.l     -(a0), d0
076552 move.l     -(a0), d0
076554 move.l     -(a0), d0
076556 move.l     -(a0), d0
076558 move.l     -(a0), d0
07655a move.l     -(a0), d0
07655c move.l     -(a0), d0
07655e move.l     -(a0), d0
076560 move.l     -(a0), d0
076562 move.l     -(a0), d0
076564 move.l     -(a0), d0
076566 move.l     -(a0), d0
076568 move.l     -(a0), d0
07656a move.l     -(a0), d0
07656c move.l     -(a0), d0
07656e move.l     -(a0), d0
076570 move.l     -(a0), d0
076572 move.l     -(a0), d0
076574 move.l     -(a0), d0
076576 move.l     -(a0), d0
076578 move.l     -(a0), d0
07657a move.l     -(a0), d0
07657c move.l     -(a0), d0
07657e move.l     -(a0), d0
076580 move.l     -(a0), d0
076582 move.l     -(a0), d0
076584 move.l     -(a0), d0
076586 move.l     -(a0), d0
076588 move.l     -(a0), d0
07658a move.l     -(a0), d0
07658c move.l     -(a0), d0
07658e move.l     -(a0), d0
076590 move.l     -(a0), d0
076592 move.l     -(a0), d0
076594 move.l     -(a0), d0
076596 move.l     -(a0), d0
076598 move.l     -(a0), d0
07659a move.l     -(a0), d0
07659c move.l     -(a0), d0
07659e move.l     -(a0), d0
0765a0 move.l     -(a0), d0
0765a2 move.l     -(a0), d0
0765a4 move.l     -(a0), d0
0765a6 move.l     -(a0), d0
0765a8 move.l     -(a0), d0
0765aa move.l     -(a0), d0
0765ac move.l     -(a0), d0
0765ae move.l     -(a0), d0
0765b0 move.l     -(a0), d0
0765b2 move.l     -(a0), d0
0765b4 move.l     -(a0), d0
0765b6 move.l     -(a0), d0
0765b8 movea.l    $65(a0, d7.w), a0
0765bc .byte      0x73, 0x73
0765be movea.l    -(a6), a0
0765c0 bvs.b      $76634
0765c2 bcs.b      $765e4
0765c4 move.l     -(a0), d0
0765c6 move.l     -(a0), d0
0765c8 move.l     -(a0), d0
0765ca move.l     -(a0), d0
0765cc move.l     -(a0), d0
0765ce move.l     -(a0), d0
0765d0 move.l     -(a0), d0
0765d2 move.l     -(a0), d0
0765d4 move.l     -(a0), d0
0765d6 move.l     -(a0), d0
0765d8 move.l     -(a0), d0
0765da move.l     -(a0), d0
0765dc movea.l    $7820.w, a0
0765e0 move.l     -(a0), d0
0765e2 move.l     -(a0), d0
0765e4 move.l     -(a0), d0
0765e6 move.l     -(a0), d0
0765e8 move.l     -(a0), d0
0765ea move.l     -(a0), d0
0765ec ori.b      #$14, d0
0765f0 ori.b      #$3c, $be(a0)
0765f6 moveq      #$4, d0
0765f8 bra.b      $76652
0765fa move.w     #$fb, d0
0765fe move.l     #$33806, d1
076604 jsr        $7db4c.l
07660a rts        
07660c move.w     $3034(a3), d0
076610 andi.w     #$1, d0
076614 eori.w     #$1, d0
076618 addq.w     #$8, d0
07661a bra.b      $76652
07661c move.l     #$25d46, d1
076622 move.w     $3034(a3), d0
076626 andi.w     #$1, d0
07662a eori.w     #$1, d0
07662e addi.w     #$a, d0
076632 jsr        $7db4c.l
076638 tst.w      $2fb8(a3)
07663c bne.b      $7665c
07663e tst.w      $2fda(a3)
076642 bne.b      $7665c
076644 move.w     $3034(a3), d0
076648 andi.w     #$1, d0
07664c eori.w     #$1, d0
076650 addq.w     #$6, d0
076652 move.l     $2fc4(a3), d1
076656 jsr        $7db4c.l
07665c rts        
07665e moveq      #$5, d0
076660 move.l     $2fc4(a3), d1
076664 jsr        $7db4c.l
07666a tst.w      $2fb8(a3)
07666e bne.b      $76684
076670 tst.w      $2fda(a3)
076674 bne.b      $76684
076676 moveq      #$21, d0
076678 move.l     #$3f386, d1
07667e jsr        $7db4c.l
076684 rts        
076686 moveq      #$20, d0
076688 move.l     #$25d46, d1
07668e jsr        $7db4c.l
076694 tst.w      $2fb8(a3)
076698 bne.b      $766d0
07669a moveq      #$21, d0
07669c move.l     #$3f386, d1
0766a2 jsr        $7db4c.l
0766a8 tst.w      $2fb8(a3)
0766ac bne.b      $766d0
0766ae moveq      #$22, d0
0766b0 move.l     #$2f986, d1
0766b6 jsr        $7db4c.l
0766bc lea.l      $25d46.l, a0
0766c2 movea.l    $2fc4(a3), a1
0766c6 move.w     #$270f, d7
0766ca move.l     (a0)+, (a1)+
0766cc dbra       d7, $766ca
0766d0 rts        
0766d2 moveq      #$10, d0
0766d4 add.w      $2db8(a3), d0
0766d8 move.l     #$33806, d1
0766de jsr        $7db4c.l
0766e4 tst.w      $2fb8(a3)
0766e8 bne.b      $76704
0766ea moveq      #$21, d0
0766ec move.l     #$3f386, d1
0766f2 jsr        $7db4c.l
0766f8 bsr.w      $76788
0766fc move.w     $2db8(a3), d0
076700 bsr.w      $76176
076704 rts        
076706 moveq      #$10, d0
076708 add.w      $2db8(a3), d0
07670c move.l     #$33806, d1
076712 jsr        $7db4c.l
076718 tst.w      $2fb8(a3)
07671c bne.b      $7674c
07671e bsr.b      $76770
076720 moveq      #$c, d0
076722 move.l     #$33806, d1
076728 jsr        $7db4c.l
07672e tst.w      $2fb8(a3)
076732 bne.b      $7674c
076734 bsr.w      $76850
076738 moveq      #$21, d0
07673a move.l     #$3f386, d1
076740 jsr        $7db4c.l
076746 moveq      #$8, d0
076748 bsr.w      $76176
07674c rts        
07674e moveq      #$d, d0
076750 move.l     $2fc4(a3), d1
076754 jsr        $7db4c.l
07675a tst.w      $2fb8(a3)
07675e bne.b      $7676e
076760 moveq      #$21, d0
076762 move.l     #$3f386, d1
076768 jsr        $7db4c.l
07676e rts        
076770 bsr.b      $76790
076772 movea.l    $2fc4(a3), a0
076776 lea.l      $27c86.l, a1
07677c move.w     #$2edf, d7
076780 move.l     (a0)+, (a1)+
076782 dbra       d7, $76780
076786 rts        
076788 bsr.b      $76790
07678a bsr.w      $76810
07678e rts        
076790 lea.l      $33806.l, a0
076796 movea.l    $2fc4(a3), a1
07679a adda.w     #$1f40, a1
07679e moveq      #$63, d7
0767a0 moveq      #$9, d6
0767a2 move.l     #$ffffffff, $7d00(a1)
0767aa move.l     #$ffffffff, $7d28(a1)
0767b2 move.w     $1f40(a0), d0
0767b6 bsr.w      $768a4
0767ba move.l     d0, $5dc0(a1)
0767be move.l     d0, $5de8(a1)
0767c2 move.w     $1770(a0), d0
0767c6 bsr.w      $768a4
0767ca move.l     d0, $3e80(a1)
0767ce move.l     d0, $3ea8(a1)
0767d2 move.w     $fa0(a0), d0
0767d6 bsr.w      $768a4
0767da move.l     d0, $1f40(a1)
0767de move.l     d0, $1f68(a1)
0767e2 move.w     $7d0(a0), d0
0767e6 bsr.w      $768a4
0767ea move.l     d0, (a1)
0767ec move.l     d0, $28(a1)
0767f0 move.w     (a0), d0
0767f2 bsr.w      $768a4
0767f6 move.l     d0, -$1f40(a1)
0767fa move.l     d0, -$1f18(a1)
0767fe addq.w     #$2, a0
076800 addq.w     #$4, a1
076802 dbra       d6, $767a2
076806 adda.w     #$28, a1
07680a dbra       d7, $767a0
07680e rts        
076810 lea.l      $33806.l, a0
076816 movea.l    $2fc4(a3), a1
07681a adda.w     #$230a, a1
07681e moveq      #$63, d7
076820 moveq      #$4, d6
076822 clr.l      $7d00(a1)
076826 move.l     $1f40(a0), $5dc0(a1)
07682c move.l     $1770(a0), $3e80(a1)
076832 move.l     $fa0(a0), $1f40(a1)
076838 move.l     $7d0(a0), (a1)
07683c move.l     (a0)+, -$1f40(a1)
076840 addq.l     #$4, a1
076842 dbra       d6, $76822
076846 adda.w     #$14, a1
07684a dbra       d7, $76820
07684e rts        
076850 lea.l      $33806.l, a0
076856 lea.l      $27c86.l, a1
07685c adda.w     #$1f40, a1
076860 move.w     #$7cf, d7
076864 move.l     (a0), d1
076866 or.l       $1f40(a0), d1
07686a or.l       $3e80(a0), d1
07686e not.l      d1
076870 and.l      d1, -$1f40(a1)
076874 and.l      d1, (a1)
076876 and.l      d1, $1f40(a1)
07687a and.l      d1, $3e80(a1)
07687e and.l      d1, $5dc0(a1)
076882 and.l      d1, $7d00(a1)
076886 move.l     (a0), d0
076888 or.l       d0, -$1f40(a1)
07688c move.l     $1f40(a0), d0
076890 or.l       d0, (a1)
076892 move.l     $3e80(a0), d0
076896 or.l       d0, $1f40(a1)
07689a addq.l     #$4, a0
07689c addq.l     #$4, a1
07689e dbra       d7, $76864
0768a2 rts        
0768a4 moveq      #$0, d1
0768a6 moveq      #$f, d3
0768a8 andi.l     #$ffff, d0
0768ae lsr.l      #$1, d0
0768b0 roxr.l     #$1, d1
0768b2 asr.l      #$1, d1
0768b4 dbra       d3, $768ae
0768b8 move.l     d1, d0
0768ba rts        
0768bc move.w     $2db8(a3), d0
0768c0 andi.w     #$1, d0
0768c4 addi.w     #$7e, d0
0768c8 tst.w      $2de2(a3)
0768cc beq.b      $768d2
0768ce move.w     #$a6, d0
0768d2 tst.w      $2de0(a3)
0768d6 beq.b      $768dc
0768d8 move.w     #$d3, d0
0768dc move.l     $2d06(a3), d1
0768e0 jsr        $7db4c.l
0768e6 tst.w      $2de2(a3)
0768ea bne.b      $768f2
0768ec bsr.w      $769ae
0768f0 bra.b      $768f4
0768f2 bsr.b      $768f6
0768f4 rts        
0768f6 movea.l    $2d06(a3), a0
0768fa movea.l    a0, a1
0768fc adda.l     #$96fc, a1
076902 movea.l    a1, a2
076904 adda.l     #$96fc, a2
07690a move.w     #$4b7d, d1
07690e move.w     (a0), (a1)+
076910 move.w     (a0)+, (a2)+
076912 dbra       d1, $7690e
076916 suba.l     #$94fc, a0
07691c move.l     a0, d6
07691e movea.l    d6, a0
076920 move.l     #$1dcc, d5
076926 move.l     #$ee5, d7
07692c movea.l    a0, a1
07692e adda.w     d5, a1
076930 movea.l    a1, a2
076932 adda.w     d5, a2
076934 movea.l    a2, a4
076936 adda.w     d5, a4
076938 move.w     (a0)+, d0
07693a and.w      (a1), d0
07693c and.w      (a4), d0
07693e eor.w      d0, (a1)+
076940 eor.w      d0, (a4)+
076942 eor.w      d0, (a2)+
076944 dbra       d7, $76938
076948 addi.l     #$96fc, d6
07694e movea.l    d6, a0
076950 move.l     #$1dcc, d5
076956 move.l     #$ee5, d7
07695c movea.l    a0, a1
07695e adda.w     d5, a1
076960 movea.l    a1, a2
076962 adda.w     d5, a2
076964 movea.l    a2, a4
076966 adda.w     d5, a4
076968 move.w     (a0), d0
07696a and.w      (a1)+, d0
07696c and.w      (a4), d0
07696e eor.w      d0, (a0)+
076970 eor.w      d0, (a2)+
076972 eor.w      d0, (a4)+
076974 dbra       d7, $76968
076978 addi.l     #$96fc, d6
07697e movea.l    d6, a0
076980 move.l     #$1dcc, d5
076986 move.l     #$ee5, d7
07698c movea.l    a0, a1
07698e adda.w     d5, a1
076990 movea.l    a1, a2
076992 adda.w     d5, a2
076994 movea.l    a2, a4
076996 adda.w     d5, a4
076998 move.w     (a0)+, d0
07699a and.w      (a1)+, d0
07699c and.w      (a4), d0
07699e eor.w      d0, (a4)+
0769a0 eor.w      d0, (a2)+
0769a2 dbra       d7, $76998
0769a6 move.l     #$1c4f4, d0
0769ac rts        
0769ae move.l     $2d06(a3), d6
0769b2 movea.l    #$7930, a0
0769b8 movea.l    #$b4c8, a1
0769be adda.l     d6, a0
0769c0 adda.l     d6, a1
0769c2 move.w     #$3b97, d7
0769c6 move.w     -(a0), -(a1)
0769c8 dbra       d7, $769c6
0769cc movea.l    #$7930, a0
0769d2 movea.l    #$b4c8, a1
0769d8 adda.l     d6, a0
0769da adda.l     d6, a1
0769dc move.w     #$ee5, d7
0769e0 move.w     (a0)+, (a1)+
0769e2 dbra       d7, $769e0
0769e6 movea.l    #$200, a0
0769ec movea.l    #$3d98, a1
0769f2 movea.l    #$5b64, a2
0769f8 movea.l    #$7930, a4
0769fe adda.l     d6, a0
076a00 adda.l     d6, a1
076a02 adda.l     d6, a2
076a04 adda.l     d6, a4
076a06 move.w     #$ee5, d7
076a0a move.w     (a0), d0
076a0c move.w     (a4), d1
076a0e or.w       d1, (a1)+
076a10 or.w       d1, (a2)+
076a12 not.w      d1
076a14 and.w      d1, (a0)+
076a16 and.w      d0, (a4)+
076a18 dbra       d7, $76a0a
076a1c move.l     #$d294, d0
076a22 rts        
076a24 move.l     $2fee(a3), d6
076a28 movea.l    #$1650, a0
076a2e movea.l    #$20d8, a1
076a34 adda.l     d6, a0
076a36 adda.l     d6, a1
076a38 move.w     #$a87, d7
076a3c move.w     -(a0), -(a1)
076a3e dbra       d7, $76a3c
076a42 movea.l    #$1650, a0
076a48 movea.l    #$20d8, a1
076a4e adda.l     d6, a0
076a50 adda.l     d6, a1
076a52 move.w     #$2a1, d7
076a56 move.w     (a0)+, (a1)+
076a58 dbra       d7, $76a56
076a5c movea.l    #$140, a0
076a62 movea.l    #$bc8, a1
076a68 movea.l    #$110c, a2
076a6e movea.l    #$1650, a4
076a74 adda.l     d6, a0
076a76 adda.l     d6, a1
076a78 adda.l     d6, a2
076a7a adda.l     d6, a4
076a7c move.w     #$2a1, d7
076a80 move.w     (a0), d0
076a82 move.w     (a4), d1
076a84 or.w       d1, (a1)+
076a86 or.w       d1, (a2)+
076a88 not.w      d1
076a8a and.w      d1, (a0)+
076a8c and.w      d0, (a4)+
076a8e dbra       d7, $76a80
076a92 move.l     #$261c, d0
076a98 rts        
076a9a move.w     $2c86(a3), d0
076a9e asl.w      #$2, d0
076aa0 ext.l      d0
076aa2 neg.l      d0
076aa4 subi.l     #$20, d0
076aaa move.l     d0, $2c7a(a3)
076aae addi.l     #$48, d0
076ab4 move.l     d0, $2c7e(a3)
076ab8 lea.l      $4b7e(a3), a0
076abc move.l     #$4f10a, d0
076ac2 move.w     #$4f6, d1
076ac6 move.w     #$f5, d2
076aca clr.w      d7
076acc move.w     d7, d5
076ace mulu.w     d2, d5
076ad0 add.w      d1, d5
076ad2 move.l     d0, d6
076ad4 asl.l      #$4, d6
076ad6 divu.w     d5, d6
076ad8 move.w     d6, (a0)+
076ada addq.w     #$1, d7
076adc cmp.w      #$80, d7
076ae0 bne.b      $76acc
076ae2 lea.l      $4b7e(a3), a0
076ae6 lea.l      $4a7e(a3), a1
076aea moveq      #$7f, d7
076aec move.w     (a0)+, d0
076aee lsr.w      #$4, d0
076af0 subi.w     #$a, d0
076af4 mulu.w     #$3a83, d0
076af8 swap       d0
076afa add.w      $2e94(a3), d0
076afe subi.w     #$38, d0
076b02 move.w     d0, (a1)+
076b04 dbra       d7, $76aec
076b08 lea.l      $4b7e(a3), a0
076b0c lea.l      $4a7e(a3), a1
076b10 move.w     #$fff, (a0)
076b14 move.w     $2e94(a3), (a1)
076b18 subq.w     #$1, (a1)
076b1a lea.l      -$3d6a(a3), a0
076b1e move.w     #$c8, d7
076b22 clr.w      d0
076b24 move.w     d0, (a0)+
076b26 addi.w     #$2a, d0
076b2a dbra       d7, $76b24
076b2e lea.l      -$3bd8(a3), a0
076b32 clr.w      d6
076b34 clr.l      (a0)+
076b36 clr.l      (a0)+
076b38 moveq      #$2, d7
076b3a move.w     d6, d1
076b3c ext.l      d1
076b3e asl.l      #$8, d1
076b40 divu.w     d7, d1
076b42 ext.l      d1
076b44 asl.l      #$8, d1
076b46 asl.l      #$4, d1
076b48 move.l     d1, (a0)+
076b4a addq.w     #$1, d7
076b4c cmp.w      #$10, d7
076b50 bne.b      $76b3a
076b52 addq.w     #$1, d6
076b54 cmp.w      #$40, d6
076b58 bne.b      $76b34
076b5a lea.l      $4b7e(a3), a1
076b5e lea.l      $4c7e(a3), a2
076b62 lea.l      $7cca2(pc), a4
076b66 moveq      #$7f, d7
076b68 move.w     (a1)+, d6
076b6a mulu.w     #$100, d6
076b6e divu.w     #$1000, d6
076b72 move.b     (a4, d6.w), d0
076b76 ext.w      d0
076b78 move.w     d0, (a2)+
076b7a dbra       d7, $76b68
076b7e lea.l      $4b7e(a3), a1
076b82 lea.l      $4d7e(a3), a2
076b86 lea.l      $7cca2(pc), a4
076b8a moveq      #$7f, d7
076b8c move.w     (a1)+, d6
076b8e mulu.w     #$c0, d6
076b92 divu.w     #$1000, d6
076b96 move.b     (a4, d6.w), d0
076b9a ext.w      d0
076b9c move.w     d0, (a2)+
076b9e dbra       d7, $76b8c
076ba2 lea.l      -$4048(a3), a0
076ba6 clr.w      d7
076ba8 move.w     d7, d0
076baa mulu.w     $2c84(a3), d0
076bae lsr.l      #$6, d0
076bb0 move.w     d0, (a0)+
076bb2 addq.w     #$1, d7
076bb4 cmp.w      #$101, d7
076bb8 bne.b      $76ba8
076bba rts        
076bbc movea.l    $2d0a(a3), a0
076bc0 moveq      #$ff, d0
076bc2 move.w     #$1fff, d7
076bc6 move.l     d0, (a0)+
076bc8 dbra       d7, $76bc6
076bcc moveq      #$0, d0
076bce move.w     #$1fff, d7
076bd2 move.l     d0, (a0)+
076bd4 dbra       d7, $76bd2
076bd8 moveq      #$0, d0
076bda lea.l      $4e7e(a3), a4
076bde move.w     #$ff, d7
076be2 move.l     d0, (a4)+
076be4 dbra       d7, $76be2
076be8 movea.l    $2d0a(a3), a0
076bec movea.l    a0, a1
076bee adda.l     #$8000, a1
076bf4 lea.l      $4e7e(a3), a4
076bf8 lea.l      $2478(a3), a2
076bfc move.w     $2c84(a3), $2db0(a3)
076c02 move.w     #$8, $2db2(a3)
076c08 bsr.b      $76c30
076c0a addq.w     #$1, $2db2(a3)
076c0e cmpi.w     #$100, $2db2(a3)
076c14 bne.b      $76c08
076c16 move.l     a0, d0
076c18 sub.l      $2d0a(a3), d0
076c1c move.l     d0, $2d02(a3)
076c20 suba.l     d0, a1
076c22 move.l     d0, d7
076c24 lsr.l      #$1, d7
076c26 subq.l     #$1, d7
076c28 move.w     (a1)+, (a0)+
076c2a dbra       d7, $76c28
076c2e rts        
076c30 move.w     $2db2(a3), d0
076c34 add.w      d0, d0
076c36 add.w      d0, d0
076c38 move.l     a0, d6
076c3a move.l     d6, (a4, d0.w)
076c3e adda.w     #$2a, a0
076c42 adda.w     #$2a, a1
076c46 clr.w      d6
076c48 move.w     $2db2(a3), d7
076c4c mulu.w     $2db0(a3), d7
076c50 divu.w     #$40, d7
076c54 add.w      d7, d7
076c56 clr.l      d0
076c58 move.w     $2db0(a3), d0
076c5c asl.l      #$8, d0
076c5e asl.l      #$4, d0
076c60 divu.w     d7, d0
076c62 andi.l     #$ffff, d0
076c68 asl.l      #$4, d0
076c6a move.w     #$80, d3
076c6e sub.w      $2c84(a3), d3
076c72 lsr.w      #$1, d3
076c74 swap       d3
076c76 clr.w      d3
076c78 swap       d3
076c7a move.w     d6, d4
076c7c move.w     d6, d5
076c7e asr.w      #$3, d4
076c80 andi.w     #$7, d5
076c84 eori.w     #$7, d5
076c88 move.w     d3, d1
076c8a lsr.w      #$1, d1
076c8c bcc.b      $76c94
076c8e move.b     (a2, d1.w), d1
076c92 bra.b      $76c9a
076c94 move.b     (a2, d1.w), d1
076c98 lsr.w      #$4, d1
076c9a andi.w     #$f, d1
076c9e btst.b     #$0, d1
076ca2 beq.b      $76caa
076ca4 bset.b     d5, (a0, d4.w)
076ca8 bra.b      $76cae
076caa bclr.b     d5, (a0, d4.w)
076cae btst.b     #$1, d1
076cb2 beq.b      $76cba
076cb4 bset.b     d5, (a1, d4.w)
076cb8 bra.b      $76cbe
076cba bclr.b     d5, (a1, d4.w)
076cbe swap       d3
076cc0 add.l      d0, d3
076cc2 swap       d3
076cc4 addq.l     #$1, d6
076cc6 cmp.w      d7, d6
076cc8 bne.b      $76c7a
076cca addi.w     #$f, d6
076cce lsr.w      #$4, d6
076cd0 add.w      d6, d6
076cd2 ext.l      d6
076cd4 adda.l     d6, a0
076cd6 adda.l     d6, a1
076cd8 rts        
076cda move.w     $3038(a3), d0
076cde tst.w      $303a(a3)
076ce2 beq.b      $76cea
076ce4 add.w      $2dbc(a3), d0
076ce8 addq.w     #$1, d0
076cea add.w      d0, d0
076cec lea.l      $76cf8(pc), a1
076cf0 move.w     (a1, d0.w), $2f6e(a3)
076cf6 rts        
076cf8 ori.b      #$5, d0
076cfc .byte      0x00, 0x09
076cfe .byte      0x00, 0x0d
076d00 move.w     $2db8(a3), d0
076d04 asl.w      #$4, d0
076d06 addi.w     #$80, d0
076d0a move.l     $2d12(a3), d1
076d0e jsr        $7db4c.l
076d14 rts        
076d16 move.w     $2c78(a3), d0
076d1a move.w     d0, d6
076d1c mulu.w     #$140, d0
076d20 movea.l    $2d12(a3), a1
076d24 adda.l     d0, a1
076d26 movea.l    a1, a0
076d28 lsr.l      #$1, d0
076d2a adda.l     d0, a0
076d2c asl.w      #$2, d6
076d2e subq.w     #$1, d6
076d30 suba.w     #$28, a1
076d34 move.l     -(a1), -(a0)
076d36 move.l     -(a1), -(a0)
076d38 move.l     -(a1), -(a0)
076d3a move.l     -(a1), -(a0)
076d3c move.l     -(a1), -(a0)
076d3e move.l     -(a1), -(a0)
076d40 move.l     -(a1), -(a0)
076d42 move.l     -(a1), -(a0)
076d44 move.l     -(a1), -(a0)
076d46 move.l     -(a1), -(a0)
076d48 adda.w     #$50, a1
076d4c move.l     -(a1), -(a0)
076d4e move.l     -(a1), -(a0)
076d50 move.l     -(a1), -(a0)
076d52 move.l     -(a1), -(a0)
076d54 move.l     -(a1), -(a0)
076d56 move.l     -(a1), -(a0)
076d58 move.l     -(a1), -(a0)
076d5a move.l     -(a1), -(a0)
076d5c move.l     -(a1), -(a0)
076d5e move.l     -(a1), -(a0)
076d60 move.l     -(a1), -(a0)
076d62 move.l     -(a1), -(a0)
076d64 move.l     -(a1), -(a0)
076d66 move.l     -(a1), -(a0)
076d68 move.l     -(a1), -(a0)
076d6a move.l     -(a1), -(a0)
076d6c move.l     -(a1), -(a0)
076d6e move.l     -(a1), -(a0)
076d70 move.l     -(a1), -(a0)
076d72 move.l     -(a1), -(a0)
076d74 dbra       d6, $76d30
076d78 rts        
076d7a lea.l      $2578(a3), a0
076d7e move.w     #$af, d7
076d82 clr.l      (a0)+
076d84 dbra       d7, $76d82
076d88 bsr.w      $76e68
076d8c clr.w      $2fec(a3)
076d90 move.l     $2d16(a3), $2fee(a3)
076d96 lea.l      $23c8(a3), a0
076d9a move.w     $2fec(a3), d3
076d9e move.b     (a0, d3.w), d0
076da2 andi.w     #$ff, d0
076da6 beq.w      $76e4c
076daa tst.w      $2f42(a3)
076dae beq.b      $76dcc
076db0 cmp.w      #$70, d0
076db4 bmi.w      $76e4c
076db8 lea.l      $28ec(a3), a1
076dbc move.w     d0, d1
076dbe subi.w     #$70, d1
076dc2 asl.w      #$2, d1
076dc4 tst.b      $2(a1, d1.w)
076dc8 bne.w      $76e4c
076dcc lea.l      $2438(a3), a1
076dd0 move.w     d0, d1
076dd2 asl.w      #$2, d1
076dd4 move.l     $2fee(a3), (a1, d1.w)
076dda cmp.w      #$b1, d0
076dde bne.b      $76de6
076de0 bsr.w      $7a618
076de4 bra.b      $76e4c
076de6 cmp.w      #$f1, d0
076dea bne.b      $76df2
076dec bsr.w      $7a85e
076df0 bra.b      $76e4c
076df2 move.w     d0, -(a7)
076df4 move.l     $2fee(a3), d1
076df8 jsr        $7db4c.l
076dfe move.l     $2cec(a3), d7
076e02 move.w     (a7)+, d0
076e04 tst.w      $2fb8(a3)
076e08 bne.b      $76e66
076e0a tst.w      $2fda(a3)
076e0e bne.b      $76e66
076e10 cmp.w      #$d9, d0
076e14 bne.b      $76e20
076e16 move.w     d0, -(a7)
076e18 bsr.w      $76a24
076e1c move.l     d0, d7
076e1e move.w     (a7)+, d0
076e20 movea.l    $2fee(a3), a0
076e24 move.w     $c(a0), d1
076e28 move.w     $e(a0), d2
076e2c lea.l      $28ec(a3), a0
076e30 subi.w     #$70, d0
076e34 bmi.b      $76e40
076e36 asl.w      #$2, d0
076e38 move.b     d1, (a0, d0.w)
076e3c move.b     d2, $1(a0, d0.w)
076e40 addq.l     #$1, d7
076e42 andi.l     #$fffffffe, d7
076e48 add.l      d7, $2fee(a3)
076e4c tst.w      $2fb8(a3)
076e50 bne.b      $76e66
076e52 tst.w      $2fda(a3)
076e56 bne.b      $76e66
076e58 addq.w     #$1, $2fec(a3)
076e5c cmpi.w     #$30, $2fec(a3)
076e62 bne.w      $76d96
076e66 rts        
076e68 lea.l      $7e3e8.l, a0
076e6e lea.l      $7e3fa.l, a1
076e74 lea.l      $2438(a3), a2
076e78 move.w     (a0)+, d0
076e7a beq.b      $76e84
076e7c asl.w      #$2, d0
076e7e move.l     (a1)+, (a2, d0.w)
076e82 bra.b      $76e78
076e84 rts        
076e86 move.w     $2db8(a3), d0
076e8a addi.w     #$18, d0
076e8e lea.l      -$1e78(a3), a0
076e92 move.l     a0, d1
076e94 jsr        $7db4c.l
076e9a tst.w      $2fb8(a3)
076e9e bne.b      $76ec6
076ea0 tst.w      $2fda(a3)
076ea4 bne.b      $76ec6
076ea6 lea.l      -$1e78(a3), a0
076eaa clr.w      d7
076eac cmpi.w     #$7900, $2(a0)
076eb2 beq.b      $76ec0
076eb4 addq.w     #$1, d7
076eb6 adda.w     #$c, a0
076eba cmp.w      #$3f8, d7
076ebe bne.b      $76eac
076ec0 addq.w     #$8, d7
076ec2 move.w     d7, $2f98(a3)
076ec6 rts        
076ec8 moveq      #$23, d0
076eca lea.l      -$8000(a3), a0
076ece move.l     a0, d1
076ed0 jsr        $7db4c.l
076ed6 rts        
076ed8 move.w     $3038(a3), $2dc6(a3)
076ede move.w     $2dbc(a3), $2dc8(a3)
076ee4 cmpi.w     #$2, $303a(a3)
076eea bne.b      $76efa
076eec move.w     $2dc6(a3), d0
076ef0 move.w     $2dc8(a3), $2dc6(a3)
076ef6 move.w     d0, $2dc8(a3)
076efa moveq      #$0, d1
076efc moveq      #$0, d2
076efe moveq      #$0, d3
076f00 moveq      #$0, d4
076f02 move.w     $303a(a3), d0
076f06 bne.b      $76f0c
076f08 moveq      #$ff, d3
076f0a moveq      #$ff, d4
076f0c tst.w      $2dc6(a3)
076f10 bne.b      $76f14
076f12 moveq      #$ff, d2
076f14 tst.w      $2dc8(a3)
076f18 bne.b      $76f1c
076f1a moveq      #$ff, d4
076f1c moveq      #$a, d0
076f1e tst.l      d1
076f20 bmi.b      $76f26
076f22 move.l     d0, d1
076f24 addq.l     #$1, d0
076f26 tst.l      d2
076f28 bmi.b      $76f2e
076f2a move.l     d0, d2
076f2c addq.l     #$1, d0
076f2e tst.l      d3
076f30 bmi.b      $76f36
076f32 move.l     d0, d3
076f34 addq.l     #$1, d0
076f36 tst.l      d4
076f38 bmi.b      $76f3e
076f3a move.l     d0, d4
076f3c addq.l     #$1, d0
076f3e move.w     d0, $2fa4(a3)
076f42 movem.l    d1-d4, -(a7)
076f46 movea.l    a7, a0
076f48 moveq      #$9, d7
076f4a bsr.w      $78c18
076f4e andi.w     #$c, d0
076f52 move.w     d0, d1
076f54 swap       d0
076f56 andi.w     #$c, d0
076f5a move.w     d0, d2
076f5c bsr.w      $78c18
076f60 bpl.b      $76f7c
076f62 tst.l      (a0, d1.w)
076f66 bmi.b      $76f7c
076f68 tst.l      (a0, d2.w)
076f6c bmi.b      $76f7c
076f6e move.l     (a0, d1.w), d0
076f72 move.l     (a0, d2.w), (a0, d1.w)
076f78 move.l     d0, (a0, d2.w)
076f7c dbra       d7, $76f4a
076f80 movem.l    (a7)+, d1-d4
076f84 cmpi.w     #$2, $303a(a3)
076f8a bne.b      $76f90
076f8c exg.l      d1, d3
076f8e exg.l      d2, d4
076f90 move.w     #$3, $2ed6(a3)
076f96 move.w     #$1, $2ed8(a3)
076f9c move.w     #$3, $2eda(a3)
076fa2 move.w     #$1, $2edc(a3)
076fa8 tst.w      $3038(a3)
076fac bne.b      $76fce
076fae tst.w      $2dbc(a3)
076fb2 bne.b      $76fce
076fb4 move.w     $303a(a3), d0
076fb8 beq.b      $76fce
076fba cmp.w      #$1, d0
076fbe beq.b      $76fc8
076fc0 move.w     #$1, $2ed6(a3)
076fc6 bra.b      $76fce
076fc8 move.w     #$1, $2eda(a3)
076fce moveq      #$0, d0
076fd0 move.l     d0, $303e(a3)
076fd4 move.l     d0, $3112(a3)
076fd8 move.l     d0, $2e3a(a3)
076fdc move.l     d0, $2e42(a3)
076fe0 moveq      #$0, d7
076fe2 lea.l      $24e0(a3), a1
076fe6 lea.l      $7cca2(pc), a2
076fea lea.l      -$3e46(a3), a0
076fee cmp.w      d3, d7
076ff0 beq.b      $77042
076ff2 cmp.w      d4, d7
076ff4 beq.b      $77042
076ff6 cmp.w      d1, d7
076ff8 beq.b      $7702a
076ffa cmp.w      d2, d7
076ffc beq.b      $77036
076ffe move.l     -(a2), d0
077000 move.l     d0, (a0)+
077002 move.w     -(a1), (a0)+
077004 clr.w      (a0)+
077006 bsr.w      $78c18
07700a andi.w     #$7ff, d0
07700e subi.w     #$400, d0
077012 move.w     d0, (a0)+
077014 bsr.w      $78c18
077018 andi.w     #$7, d0
07701c cmp.w      #$5, d0
077020 bcc.b      $77014
077022 subq.w     #$2, d0
077024 beq.b      $77014
077026 move.w     d0, (a0)+
077028 bra.b      $77046
07702a move.l     -(a2), d0
07702c move.l     d0, $303e(a3)
077030 move.w     -(a1), $3042(a3)
077034 bra.b      $77046
077036 move.l     -(a2), d0
077038 move.l     d0, $3112(a3)
07703c move.w     -(a1), $3116(a3)
077040 bra.b      $77046
077042 move.l     -(a2), d0
077044 move.w     -(a1), d0
077046 addq.w     #$1, d7
077048 cmp.w      $2fa4(a3), d7
07704c bne.b      $76fee
07704e move.l     $303e(a3), d0
077052 ori.l      #$3fff, d0
077058 move.l     d0, $3084(a3)
07705c move.l     $3112(a3), d0
077060 ori.l      #$3fff, d0
077066 move.l     d0, $3158(a3)
07706a move.l     $303e(a3), $3046(a3)
077070 move.l     $3112(a3), $311a(a3)
077076 move.w     $3042(a3), $304a(a3)
07707c move.w     $3116(a3), $311e(a3)
077082 move.w     $2c82(a3), d1
077086 tst.w      $303a(a3)
07708a bne.b      $7709c
07708c tst.w      $3038(a3)
077090 bne.b      $7709c
077092 tst.w      $2de2(a3)
077096 bne.b      $7709c
077098 ori.w      #$2, d1
07709c lea.l      -$4098(a3), a0
0770a0 move.w     #$9, d7
0770a4 bsr.w      $78c18
0770a8 andi.w     #$7, d0
0770ac btst.l     d0, d1
0770ae beq.b      $770a4
0770b0 move.w     d0, $6(a0)
0770b4 addq.w     #$8, a0
0770b6 dbra       d7, $770a4
0770ba lea.l      -$3dce(a3), a0
0770be lea.l      $770e0(pc), a1
0770c2 move.w     #$7, d7
0770c6 move.l     (a1)+, (a0)+
0770c8 bsr.w      $78c18
0770cc andi.w     #$ff, d0
0770d0 addi.w     #$40, d0
0770d4 move.w     d0, (a0)+
0770d6 move.w     #$1, (a0)+
0770da dbra       d7, $770c6
0770de bra.b      $77100
0770e0 ori.b      #$0, d0
0770e4 ori.b      #$0, d6
0770e8 ori.b      #$0, (a2)
0770ec ori.b      #$0, (a2)+
0770f0 ori.b      #$0, (a6)+
0770f4 ori.b      #$0, -(a4)
0770f8 ori.b      #$0, $36(a6)
0770fe ori.b      #$75, d0
077102 moveq      #$0, d0
077104 lea.l      $1800.l, a0
07710a move.w     #$c4e2, d7
07710e move.w     d0, (a0)+
077110 dbra       d7, $7710e
077114 rts        
077116 move.w     #$3ff, d7
07711a lea.l      $1188(a3), a0
07711e lea.l      $2188(a3), a1
077122 clr.l      -(a1)
077124 move.w     -(a0), -(a1)
077126 move.w     -(a0), -(a1)
077128 move.w     -(a0), -(a1)
07712a move.w     -(a0), -(a1)
07712c move.w     -(a0), -(a1)
07712e move.w     -(a0), -(a1)
077130 dbra       d7, $77122
077134 rts        
077136 bsr.w      $771f8
07713a bsr.w      $7724c
07713e rts        
077140 tst.w      $3038(a3)
077144 beq.b      $7718c
077146 lea.l      -$1e78(a3), a0
07714a move.w     #$3ff, d7
07714e move.w     $302e(a3), d4
077152 move.w     d4, d5
077154 neg.w      d5
077156 addq.w     #$1, d4
077158 clr.w      $2dca(a3)
07715c move.w     $2(a0), d0
077160 bsr.b      $7718e
077162 move.w     d0, $2(a0)
077166 move.w     $4(a0), d0
07716a bsr.b      $7718e
07716c move.w     d0, $4(a0)
077170 move.w     $6(a0), d0
077174 bsr.b      $7718e
077176 move.w     d0, $6(a0)
07717a move.w     $8(a0), d0
07717e bsr.b      $7718e
077180 move.w     d0, $8(a0)
077184 adda.w     #$10, a0
077188 dbra       d7, $77158
07718c rts        
07718e move.w     d0, d1
077190 move.w     d1, d2
077192 lsr.w      #$8, d2
077194 cmp.b      #$0, d2
077198 beq.b      $771f6
07719a cmp.b      #$70, d2
07719e beq.b      $771f0
0771a0 cmp.b      #$71, d2
0771a4 beq.b      $771f0
0771a6 cmp.b      #$72, d2
0771aa beq.b      $771f0
0771ac cmp.b      #$78, d2
0771b0 beq.b      $771f0
0771b2 cmp.b      #$79, d2
0771b6 beq.b      $771f0
0771b8 cmp.b      #$9a, d2
0771bc beq.b      $771f0
0771be cmp.b      #$7a, d2
0771c2 beq.b      $771f0
0771c4 cmp.b      #$a3, d2
0771c8 beq.b      $771f0
0771ca cmp.b      #$a4, d2
0771ce beq.b      $771f0
0771d0 cmp.b      #$d1, d2
0771d4 beq.b      $771f0
0771d6 cmp.b      #$d2, d2
0771da beq.b      $771f0
0771dc ext.w      d1
0771de cmp.w      d5, d1
0771e0 bmi.b      $771e6
0771e2 cmp.w      d4, d1
0771e4 bmi.b      $771f0
0771e6 tst.w      $2dca(a3)
0771ea beq.b      $771f0
0771ec moveq      #$0, d0
0771ee rts        
0771f0 move.w     #$1, $2dca(a3)
0771f6 rts        
0771f8 lea.l      -$1e78(a3), a0
0771fc move.w     #$3ff, d7
077200 move.b     #$0, d0
077204 move.b     #$0, d1
077208 moveq      #$0, d4
07720a move.b     d0, d2
07720c ext.w      d2
07720e move.b     d2, $c(a0)
077212 move.b     d1, d2
077214 ext.w      d2
077216 move.b     d2, $d(a0)
07721a add.b      (a0), d0
07721c add.b      $1(a0), d1
077220 cmpi.b     #$fc, $2(a0)
077226 bne.b      $7722c
077228 move.w     #$8000, d4
07722c cmpi.b     #$fd, $2(a0)
077232 bne.b      $77238
077234 move.w     #$0, d4
077238 andi.w     #$7777, $a(a0)
07723e or.w       d4, $a(a0)
077242 adda.w     #$10, a0
077246 dbra       d7, $7720a
07724a rts        
07724c lea.l      -$1e78(a3), a0
077250 move.w     #$3ff, d7
077254 move.w     $302e(a3), d5
077258 move.w     d5, d4
07725a neg.w      d4
07725c tst.w      $2de8(a3)
077260 beq.b      $77266
077262 move.w     #$fe, d5
077266 moveq      #$6, d6
077268 tst.b      $2(a0, d6.w)
07726c beq.w      $77302
077270 cmpi.b     #$78, $2(a0, d6.w)
077276 beq.w      $77302
07727a cmpi.b     #$79, $2(a0, d6.w)
077280 beq.w      $77302
077284 cmpi.b     #$7a, $2(a0, d6.w)
07728a beq.b      $77302
07728c cmpi.b     #$85, $2(a0, d6.w)
077292 beq.b      $77302
077294 cmpi.b     #$72, $2(a0, d6.w)
07729a beq.b      $77302
07729c cmpi.b     #$c4, $2(a0, d6.w)
0772a2 beq.b      $77302
0772a4 cmpi.b     #$fc, $2(a0, d6.w)
0772aa beq.b      $77302
0772ac cmpi.b     #$fd, $2(a0, d6.w)
0772b2 beq.b      $77302
0772b4 cmpi.b     #$76, $2(a0, d6.w)
0772ba beq.b      $77302
0772bc cmpi.b     #$77, $2(a0, d6.w)
0772c2 beq.b      $77302
0772c4 cmpi.b     #$a7, $2(a0, d6.w)
0772ca beq.b      $77302
0772cc cmpi.b     #$b5, $2(a0, d6.w)
0772d2 beq.b      $77302
0772d4 cmpi.b     #$9a, $2(a0, d6.w)
0772da beq.b      $77302
0772dc cmpi.b     #$e5, $2(a0, d6.w)
0772e2 beq.b      $77302
0772e4 cmpi.b     #$9a, $2(a0, d6.w)
0772ea beq.b      $77302
0772ec move.b     $3(a0, d6.w), d0
0772f0 tst.b      d0
0772f2 bpl.b      $772fc
0772f4 cmp.b      d4, d0
0772f6 bcs.b      $77302
0772f8 move.b     d0, d4
0772fa bra.b      $77302
0772fc cmp.b      d5, d0
0772fe bcc.b      $77302
077300 move.b     d0, d5
077302 subq.w     #$2, d6
077304 bpl.w      $77268
077308 addq.b     #$8, d4
07730a subq.b     #$8, d5
07730c move.b     d4, $e(a0)
077310 move.b     d5, $f(a0)
077314 adda.w     #$10, a0
077318 dbra       d7, $77254
07731c move.l     #$400000, d5
077322 swap       d5
077324 asl.w      #$4, d5
077326 lea.l      $2188(a3), a2
07732a lea.l      -$1e78(a3), a0
07732e move.w     #$3ff, d6
077332 movea.l    a0, a1
077334 adda.w     d5, a1
077336 moveq      #$3, d7
077338 cmpa.l     a2, a1
07733a bpl.b      $77362
07733c move.b     $e(a0), d0
077340 move.b     $e(a1), d1
077344 cmp.b      d0, d1
077346 bmi.b      $7734c
077348 move.b     d1, $e(a0)
07734c move.b     $f(a0), d0
077350 move.b     $f(a1), d1
077354 cmp.b      d0, d1
077356 bpl.b      $7735c
077358 move.b     d1, $f(a0)
07735c adda.w     d5, a1
07735e dbra       d7, $77338
077362 adda.w     #$10, a0
077366 dbra       d6, $77332
07736a lea.l      -$1e78(a3), a0
07736e move.w     #$3ff, d7
077372 subq.w     #$1, d7
077374 move.w     d7, d0
077376 asl.w      #$4, d0
077378 adda.w     d0, a0
07737a move.b     #$f6, d4
07737e move.b     #$a, d5
077382 move.b     $e(a0), d0
077386 cmp.b      d4, d0
077388 beq.b      $77392
07738a bpl.b      $77390
07738c subq.b     #$1, d4
07738e bra.b      $77392
077390 move.b     d0, d4
077392 move.b     d4, $e(a0)
077396 move.b     $f(a0), d0
07739a cmp.b      d5, d0
07739c beq.b      $773a6
07739e bmi.b      $773a4
0773a0 addq.b     #$1, d5
0773a2 bra.b      $773a6
0773a4 move.b     d0, d5
0773a6 move.b     d5, $f(a0)
0773aa suba.w     #$10, a0
0773ae dbra       d7, $77382
0773b2 rts        
0773b4 lea.l      -$7e60(a3), a0
0773b8 move.w     $2db8(a3), d0
0773bc mulu.w     #$20, d0
0773c0 adda.w     d0, a0
0773c2 move.l     a0, -(a7)
0773c4 lea.l      $7e4aa.l, a1
0773ca lea.l      $7ed8e.l, a2
0773d0 lea.l      $7f672.l, a4
0773d6 move.w     (a0), $2(a1)
0773da move.w     (a0), $2(a2)
0773de move.w     (a0)+, $2(a4)
0773e2 move.w     (a0), $6(a1)
0773e6 move.w     (a0), $6(a2)
0773ea move.w     (a0)+, $6(a4)
0773ee move.w     (a0), $a(a1)
0773f2 move.w     (a0), $a(a2)
0773f6 move.w     (a0)+, $a(a4)
0773fa move.w     (a0), $e(a1)
0773fe move.w     (a0), $e(a2)
077402 move.w     (a0)+, $e(a4)
077406 move.w     (a0), $12(a1)
07740a move.w     (a0), $12(a2)
07740e move.w     (a0)+, $12(a4)
077412 move.w     (a0), $16(a1)
077416 move.w     (a0), $16(a2)
07741a move.w     (a0)+, $16(a4)
07741e move.w     (a0), $1a(a1)
077422 move.w     (a0), $1a(a2)
077426 move.w     (a0)+, $1a(a4)
07742a move.w     (a0), $1e(a1)
07742e move.w     (a0), $1e(a2)
077432 move.w     (a0)+, $1e(a4)
077436 move.w     (a0), $22(a1)
07743a move.w     (a0), $22(a2)
07743e move.w     (a0)+, $22(a4)
077442 move.w     (a0), $26(a1)
077446 move.w     (a0), $26(a2)
07744a move.w     (a0)+, $26(a4)
07744e move.w     (a0), $2a(a1)
077452 move.w     (a0), $2a(a2)
077456 move.w     (a0)+, $2a(a4)
07745a move.w     (a0), $2e(a1)
07745e move.w     (a0), $2e(a2)
077462 move.w     (a0)+, $2e(a4)
077466 move.w     (a0), $32(a1)
07746a move.w     (a0), $32(a2)
07746e move.w     (a0)+, $32(a4)
077472 move.w     (a0), $36(a1)
077476 move.w     (a0), $36(a2)
07747a move.w     (a0)+, $36(a4)
07747e move.w     (a0), $3a(a1)
077482 move.w     (a0), $3a(a2)
077486 move.w     (a0)+, $3a(a4)
07748a move.w     (a0), $3e(a1)
07748e move.w     (a0), $3e(a2)
077492 move.w     (a0)+, $3e(a4)
077496 movea.l    (a7)+, a0
077498 lea.l      $7e4ea.l, a1
07749e lea.l      $7edce.l, a2
0774a4 lea.l      $7f6b2.l, a4
0774aa move.w     $8(a0), $2(a1)
0774b0 move.w     $8(a0), $2(a2)
0774b6 move.w     $8(a0), $2(a4)
0774bc move.w     $10(a0), $6(a1)
0774c2 move.w     $10(a0), $6(a2)
0774c8 move.w     $10(a0), $6(a4)
0774ce lea.l      $7e8fe.l, a1
0774d4 lea.l      $7f1e2.l, a2
0774da lea.l      $7fac6.l, a4
0774e0 move.w     $8(a0), $2(a1)
0774e6 move.w     $8(a0), $2(a2)
0774ec move.w     $8(a0), $2(a4)
0774f2 move.w     $10(a0), $6(a1)
0774f8 move.w     $10(a0), $6(a2)
0774fe move.w     $10(a0), $6(a4)
077504 rts        
077506 move.w     #$ffff, $2e5e(a3)
07750c move.w     #$ffff, $2e64(a3)
077512 move.w     #$ffff, $2e60(a3)
077518 move.w     #$ffff, $2e62(a3)
07751e move.l     #$ffffffff, $2e66(a3)
077526 move.w     #$ffff, $2e6a(a3)
07752c move.w     #$ffff, $2e6c(a3)
077532 move.w     #$ffff, $2e6e(a3)
077538 move.l     #$ffffffff, $2e74(a3)
077540 move.l     #$ffffffff, $2e70(a3)
077548 move.w     #$ffff, $2e78(a3)
07754e move.w     #$ffff, $2e7e(a3)
077554 move.w     #$ffff, $2e7a(a3)
07755a move.w     #$ffff, $2e7c(a3)
077560 move.l     #$ffffffff, $2e80(a3)
077568 move.w     #$ffff, $2e84(a3)
07756e move.w     #$ffff, $2e86(a3)
077574 move.w     #$ffff, $2e88(a3)
07757a move.l     #$ffffffff, $2e8e(a3)
077582 move.l     #$ffffffff, $2e8a(a3)
07758a bsr.w      $78f60
07758e bsr.w      $79058
077592 rts        
077594 moveq      #$0, d0
077596 lea.l      -$1e78(a3), a4
07759a move.w     $2(a4), d1
07759e andi.w     #$ff, d1
0775a2 cmpi.w     #$2, $3022(a3)
0775a8 bne.b      $775ac
0775aa moveq      #$a, d1
0775ac swap       d1
0775ae clr.w      d1
0775b0 lea.l      $303e(a3), a4
0775b4 move.w     d0, $a8(a4)
0775b8 move.w     d0, $bc(a4)
0775bc move.w     d0, $c6(a4)
0775c0 move.w     d0, $be(a4)
0775c4 move.w     d0, $3c(a4)
0775c8 move.w     d0, $3e(a4)
0775cc move.w     d0, $40(a4)
0775d0 move.w     d0, $28(a4)
0775d4 move.w     d0, $e(a4)
0775d8 move.w     d0, $14(a4)
0775dc move.w     d0, $12(a4)
0775e0 move.w     d0, $10(a4)
0775e4 move.w     d0, $16(a4)
0775e8 move.w     d0, $c4(a4)
0775ec move.w     d0, $ce(a4)
0775f0 move.w     d0, $1c(a4)
0775f4 move.w     d0, $1e(a4)
0775f8 move.w     d0, $26(a4)
0775fc move.w     d0, $2c(a4)
077600 move.w     d0, $24(a4)
077604 move.w     d0, $1a(a4)
077608 move.l     d1, $20(a4)
07760c lea.l      $3112(a3), a4
077610 move.w     d0, $a8(a4)
077614 move.w     d0, $c6(a4)
077618 move.w     d0, $bc(a4)
07761c move.w     d0, $be(a4)
077620 move.w     d0, $3c(a4)
077624 move.w     d0, $3e(a4)
077628 move.w     d0, $40(a4)
07762c move.w     d0, $28(a4)
077630 move.w     d0, $e(a4)
077634 move.w     d0, $14(a4)
077638 move.w     d0, $12(a4)
07763c move.w     d0, $10(a4)
077640 move.w     d0, $16(a4)
077644 move.w     d0, $c4(a4)
077648 move.w     d0, $ce(a4)
07764c move.w     d0, $1c(a4)
077650 move.w     d0, $1e(a4)
077654 move.w     d0, $26(a4)
077658 move.w     d0, $2c(a4)
07765c move.w     d0, $24(a4)
077660 move.w     d0, $1a(a4)
077664 move.l     d0, $20(a4)
077668 tst.w      $3038(a3)
07766c beq.b      $77672
07766e move.l     d1, $20(a4)
077672 clr.w      $2f2a(a3)
077676 lea.l      -$8000(a3), a0
07767a clr.l      (a0)+
07767c clr.l      (a0)+
07767e clr.l      (a0)+
077680 clr.l      (a0)+
077682 clr.l      (a0)+
077684 clr.l      (a0)+
077686 clr.l      (a0)+
077688 clr.l      (a0)+
07768a lea.l      -$60c0(a3), a0
07768e clr.l      (a0)+
077690 clr.l      (a0)+
077692 clr.l      (a0)+
077694 clr.l      (a0)+
077696 clr.l      (a0)+
077698 clr.l      (a0)+
07769a clr.l      (a0)+
07769c clr.l      (a0)+
07769e move.b     #$ff, -$4180(a3)
0776a4 clr.w      $2e9a(a3)
0776a8 move.b     #$ff, -$4130(a3)
0776ae clr.w      $2e9c(a3)
0776b2 move.w     #$2, $2f4a(a3)
0776b8 bsr.w      $79708
0776bc bsr.w      $79776
0776c0 move.w     #$1, $2f4a(a3)
0776c6 bsr.w      $79708
0776ca bsr.w      $79776
0776ce clr.w      $2f4a(a3)
0776d2 bsr.w      $79708
0776d6 bsr.w      $79776
0776da lea.l      -$8000(a3), a0
0776de move.l     a0, $2f30(a3)
0776e2 lea.l      -$60c0(a3), a0
0776e6 move.l     a0, $2f2c(a3)
0776ea move.w     #$2, $2f4a(a3)
0776f0 clr.w      $2f8c(a3)
0776f4 clr.w      $2f8e(a3)
0776f8 move.w     #$fffe, $2f92(a3)
0776fe lea.l      $300e(a3), a0
077702 clr.w      (a0)+
077704 move.w     #$2, (a0)+
077708 move.w     #$4, (a0)+
07770c clr.w      $301e(a3)
077710 move.w     #$3, $3020(a3)
077716 move.w     $2f98(a3), d0
07771a subq.w     #$8, d0
07771c swap       d0
07771e clr.w      d0
077720 move.l     d0, $2fa0(a3)
077724 clr.w      $2dd2(a3)
077728 clr.w      $2dcc(a3)
07772c clr.w      $2dd0(a3)
077730 clr.w      $2fce(a3)
077734 clr.w      $2fb8(a3)
077738 move.w     #$ffff, $2f86(a3)
07773e move.w     #$ff06, $2f8a(a3)
077744 tst.w      $2f42(a3)
077748 beq.b      $77750
07774a move.w     #$64, $2f8a(a3)
077750 clr.w      $2dce(a3)
077754 clr.w      $2f88(a3)
077758 clr.w      $2cf6(a3)
07775c clr.w      $2cf8(a3)
077760 lea.l      $2cd1(a3), a0
077764 lea.l      $2cdd(a3), a1
077768 moveq      #$a, d7
07776a clr.b      (a0)+
07776c clr.b      (a1)+
07776e dbra       d7, $7776a
077772 rts        
077774 movem.l    d0-d7/a0-a4/a6, -(a7)
077778 bsr.w      $77864
07777c movem.l    (a7)+, d0-d7/a0-a4/a6
077780 rte        
077782 move.w     $c(a6), d0
077786 clr.w      d1
077788 btst.b     #$1, d0
07778c beq.b      $77792
07778e bset.b     #$1, d1
077792 btst.b     #$9, d0
077796 beq.b      $7779c
077798 bset.b     #$0, d1
07779c move.w     d0, d2
07779e asl.w      #$1, d2
0777a0 eor.w      d2, d0
0777a2 btst.b     #$1, d0
0777a6 beq.b      $777ac
0777a8 bset.b     #$2, d1
0777ac btst.b     #$9, d0
0777b0 beq.b      $777b6
0777b2 bset.b     #$3, d1
0777b6 btst.b     #$7, $bfe001.l
0777be bne.b      $777c4
0777c0 bset.b     #$4, d1
0777c4 move.w     d1, d5
0777c6 move.b     d5, $3074(a3)
0777ca move.b     $3070(a3), d0
0777ce move.b     $3074(a3), d1
0777d2 move.b     d0, d2
0777d4 eor.b      d1, d2
0777d6 and.b      d1, d2
0777d8 move.b     d1, $3070(a3)
0777dc move.b     d2, $3072(a3)
0777e0 tst.w      $2f48(a3)
0777e4 beq.b      $777ec
0777e6 move.b     $2f46(a3), d5
0777ea bra.b      $77830
0777ec move.w     $a(a6), d0
0777f0 clr.w      d1
0777f2 btst.b     #$1, d0
0777f6 beq.b      $777fc
0777f8 bset.b     #$1, d1
0777fc btst.b     #$9, d0
077800 beq.b      $77806
077802 bset.b     #$0, d1
077806 move.w     d0, d2
077808 asl.w      #$1, d2
07780a eor.w      d2, d0
07780c btst.b     #$1, d0
077810 beq.b      $77816
077812 bset.b     #$2, d1
077816 btst.b     #$9, d0
07781a beq.b      $77820
07781c bset.b     #$3, d1
077820 btst.b     #$6, $bfe001.l
077828 bne.b      $7782e
07782a bset.b     #$4, d1
07782e move.w     d1, d5
077830 move.b     d5, $3148(a3)
077834 move.b     $3144(a3), d0
077838 move.b     $3148(a3), d1
07783c move.b     d0, d2
07783e eor.b      d1, d2
077840 and.b      d1, d2
077842 move.b     d1, $3144(a3)
077846 move.b     d2, $3146(a3)
07784a move.b     $3072(a3), d0
07784e or.b       $3146(a3), d0
077852 move.b     d0, $2f94(a3)
077856 move.b     $3074(a3), d0
07785a or.b       $3148(a3), d0
07785e move.b     d0, $2f96(a3)
077862 rts        
077864 lea.l      $dff000.l, a6
07786a move.w     #$2, $9c(a6)
077870 bsr.w      $77f72
077874 addq.w     #$1, $2cf6(a3)
077878 addq.w     #$1, $2f44(a3)
07787c bsr.w      $77782
077880 bsr.w      $7569c
077884 tst.w      $2f40(a3)
077888 beq.b      $7789e
07788a tst.w      $2da8(a3)
07788e beq.b      $7789e
077890 btst.b     #$4, $2f94(a3)
077896 beq.b      $7789e
077898 move.w     #$1, $2fda(a3)
07789e bsr.w      $77d4a
0778a2 tst.w      $2f88(a3)
0778a6 beq.b      $778d0
0778a8 move.w     $30f0(a3), d0
0778ac bmi.b      $778bc
0778ae asl.w      #$4, d0
0778b0 lea.l      $dff000.l, a0
0778b6 adda.w     d0, a0
0778b8 clr.w      $a8(a0)
0778bc move.w     $31c4(a3), d0
0778c0 bmi.b      $778d0
0778c2 asl.w      #$4, d0
0778c4 lea.l      $dff000.l, a0
0778ca adda.w     d0, a0
0778cc clr.w      $a8(a0)
0778d0 tst.w      $2f88(a3)
0778d4 beq.b      $778fe
0778d6 bsr.w      $77c14
0778da bsr.w      $77de6
0778de lea.l      $303e(a3), a4
0778e2 bsr.w      $78bb6
0778e6 tst.w      $3038(a3)
0778ea beq.w      $779c8
0778ee lea.l      $3112(a3), a4
0778f2 bsr.w      $78bb6
0778f6 tst.w      $2f88(a3)
0778fa bne.w      $779c8
0778fe tst.w      $2de6(a3)
077902 beq.b      $77908
077904 bsr.w      $77a96
077908 addq.w     #$1, $2cf8(a3)
07790c lea.l      -$3dce(a3), a0
077910 move.l     #$400, d0
077916 sub.l      d0, $38(a0)
07791a sub.l      d0, $30(a0)
07791e sub.l      d0, $28(a0)
077922 sub.l      d0, $20(a0)
077926 sub.l      d0, $18(a0)
07792a sub.l      d0, $10(a0)
07792e sub.l      d0, $8(a0)
077932 sub.l      d0, (a0)
077934 tst.w      $3104(a3)
077938 beq.b      $7793e
07793a subq.w     #$1, $3104(a3)
07793e tst.w      $31d8(a3)
077942 beq.b      $77948
077944 subq.w     #$1, $31d8(a3)
077948 tst.w      $2f86(a3)
07794c bpl.b      $77956
07794e bsr.w      $77eac
077952 bsr.w      $77f3c
077956 bsr.w      $77c14
07795a bsr.w      $77de6
07795e move.w     $3110(a3), $3042(a3)
077964 move.w     $31e4(a3), $3116(a3)
07796a tst.w      $2f86(a3)
07796e bpl.b      $779c8
077970 cmpi.w     #$2, $2dcc(a3)
077976 beq.b      $7799c
077978 bsr.w      $77e6a
07797c tst.w      $2f8a(a3)
077980 bmi.b      $77984
077982 bra.b      $779ae
077984 lea.l      $303e(a3), a4
077988 bsr.w      $78bb6
07798c tst.w      $3038(a3)
077990 beq.b      $7799a
077992 lea.l      $3112(a3), a4
077996 bsr.w      $78bb6
07799a bra.b      $779c8
07799c bsr.w      $77b16
0779a0 bne.b      $779a8
0779a2 ori.w      #$1, $2dcc(a3)
0779a8 bsr.w      $7afb6
0779ac bra.b      $779c8
0779ae bsr.w      $7afb6
0779b2 tst.w      $2dcc(a3)
0779b6 bne.b      $779c8
0779b8 bsr.w      $77e86
0779bc bsr.w      $77edc
0779c0 bsr.w      $77b9e
0779c4 bsr.w      $77c60
0779c8 tst.w      $2f86(a3)
0779cc bmi.b      $779d4
0779ce beq.b      $779d4
0779d0 subq.w     #$1, $2f86(a3)
0779d4 tst.w      $2f86(a3)
0779d8 bpl.w      $77a70
0779dc move.w     $2dcc(a3), d0
0779e0 andi.w     #$1, d0
0779e4 beq.b      $77a08
0779e6 tst.w      $303a(a3)
0779ea beq.b      $779f6
0779ec move.w     $2dd2(a3), d0
0779f0 andi.w     #$1, d0
0779f4 beq.b      $77a08
0779f6 move.w     #$32, $2f86(a3)
0779fc cmpi.w     #$1, $303a(a3)
077a02 bne.b      $77a08
077a04 addq.w     #$3, $2f86(a3)
077a08 tst.w      $2f40(a3)
077a0c bne.b      $77a6c
077a0e cmpi.w     #$2, $303a(a3)
077a14 beq.b      $77a34
077a16 cmpi.w     #$ff, $2dd2(a3)
077a1c beq.b      $77a26
077a1e cmpi.w     #$45, $2fb4(a3)
077a24 bne.b      $77a32
077a26 move.w     #$ff, $2dcc(a3)
077a2c move.w     #$6, $2f86(a3)
077a32 bra.b      $77a50
077a34 cmpi.w     #$ff, $2dd2(a3)
077a3a beq.b      $77a44
077a3c cmpi.w     #$45, $2fb4(a3)
077a42 bne.b      $77a50
077a44 move.w     #$ff, $2dcc(a3)
077a4a move.w     #$3, $2f86(a3)
077a50 cmpi.w     #$59, $2fb4(a3)
077a56 bne.b      $77a5e
077a58 eori.w     #$1, $2dce(a3)
077a5e move.w     $2dd0(a3), d3
077a62 move.w     $2dce(a3), d2
077a66 eor.w      d3, d2
077a68 move.w     d2, $2f88(a3)
077a6c bsr.w      $77caa
077a70 tst.w      $2f40(a3)
077a74 beq.b      $77a88
077a76 move.w     #$4000, $9a(a6)
077a7c bsr.w      $73d82
077a80 move.w     #$c000, $9a(a6)
077a86 bra.b      $77a94
077a88 bsr.w      $737b2
077a8c bsr.w      $73276
077a90 bsr.w      $73400
077a94 rts        
077a96 move.w     $303e(a3), d0
077a9a bsr.b      $77aa4
077a9c move.w     $3112(a3), d0
077aa0 bsr.b      $77aa4
077aa2 rts        
077aa4 lea.l      -$1e76(a3), a0
077aa8 addq.w     #$1, d0
077aaa cmp.w      #$8, d0
077aae bpl.b      $77ab2
077ab0 moveq      #$8, d0
077ab2 asl.w      #$4, d0
077ab4 adda.w     d0, a0
077ab6 moveq      #$7, d7
077ab8 move.w     #$c4, d6
077abc moveq      #$40, d5
077abe moveq      #$10, d4
077ac0 tst.b      (a0)
077ac2 beq.b      $77ad2
077ac4 cmpi.b     #$60, (a0)
077ac8 bcc.b      $77ad2
077aca addq.b     #$1, (a0)
077acc cmp.b      (a0), d5
077ace bne.b      $77ad2
077ad0 move.b     d6, (a0)
077ad2 tst.b      $2(a0)
077ad6 ble.b      $77ae6
077ad8 addq.b     #$1, $2(a0)
077adc cmp.b      $2(a0), d5
077ae0 bne.b      $77ae6
077ae2 move.b     d6, $2(a0)
077ae6 tst.b      $4(a0)
077aea ble.b      $77afa
077aec addq.b     #$1, $4(a0)
077af0 cmp.b      $4(a0), d5
077af4 bne.b      $77afa
077af6 move.b     d6, $4(a0)
077afa tst.b      $6(a0)
077afe ble.b      $77b0e
077b00 addq.b     #$1, $6(a0)
077b04 cmp.b      $6(a0), d5
077b08 bne.b      $77b0e
077b0a move.b     d6, $6(a0)
077b0e suba.w     d4, a0
077b10 dbra       d7, $77ac0
077b14 rts        
077b16 move.w     $2cf8(a3), d0
077b1a andi.w     #$7, d0
077b1e bne.b      $77b6c
077b20 clr.w      $3060(a3)
077b24 tst.w      $305e(a3)
077b28 beq.b      $77b46
077b2a subq.w     #$1, $305e(a3)
077b2e lea.l      $77b7e(pc), a0
077b32 move.w     $2db8(a3), d0
077b36 asl.w      #$2, d0
077b38 move.l     (a0, d0.w), d0
077b3c add.l      d0, $306c(a3)
077b40 moveq      #$6f, d0
077b42 bsr.w      $73740
077b46 clr.w      $3134(a3)
077b4a tst.w      $3132(a3)
077b4e beq.b      $77b6c
077b50 subq.w     #$1, $3132(a3)
077b54 lea.l      $77b7e(pc), a0
077b58 move.w     $2db8(a3), d0
077b5c asl.w      #$2, d0
077b5e move.l     (a0, d0.w), d0
077b62 add.l      d0, $3140(a3)
077b66 moveq      #$6f, d0
077b68 bsr.w      $73740
077b6c move.l     $305e(a3), d0
077b70 tst.w      $3038(a3)
077b74 beq.b      $77b7a
077b76 or.l       $3132(a3), d0
077b7a tst.l      d0
077b7c rts        
077b7e ori.b      #$a0, d1
077b82 ori.b      #$40, d3
077b86 ori.b      #$e0, d4
077b8a ori.b      #$80, d6
077b8e ori.b      #$20, d7
077b92 .byte      0x00, 0x09
077b94 .byte      0x27, 0xc0
077b96 .byte      0x00, 0x0c
077b98 move.w     d0, -(a2)
077b9a .byte      0x00, 0x0f
077b9c clr.w      d0
077b9e move.l     $2fa0(a3), d0
077ba2 lea.l      $303e(a3), a2
077ba6 cmp.l      $0(a2), d0
077baa bmi.b      $77bba
077bac tst.l      $20(a2)
077bb0 bne.b      $77bd8
077bb2 move.w     #$1, $1a(a2)
077bb8 bra.b      $77bd8
077bba move.w     #$2, $1a(a2)
077bc0 tst.w      $2cf2(a3)
077bc4 beq.b      $77bd8
077bc6 tst.w      $be(a2)
077bca bne.b      $77bd8
077bcc moveq      #$5f, d0
077bce bsr.w      $73740
077bd2 move.w     #$1, $be(a2)
077bd8 move.l     $2fa0(a3), d0
077bdc lea.l      $3112(a3), a2
077be0 cmp.l      $0(a2), d0
077be4 bmi.b      $77bf4
077be6 tst.l      $20(a2)
077bea bne.b      $77c12
077bec move.w     #$1, $1a(a2)
077bf2 bra.b      $77c12
077bf4 move.w     #$2, $1a(a2)
077bfa tst.w      $2cf2(a3)
077bfe beq.b      $77c12
077c00 tst.w      $be(a2)
077c04 bne.b      $77c12
077c06 moveq      #$5f, d0
077c08 bsr.w      $73740
077c0c move.w     #$1, $be(a2)
077c12 rts        
077c14 lea.l      $303e(a3), a2
077c18 tst.w      $2f8a(a3)
077c1c bmi.b      $77c3c
077c1e move.w     $1a(a2), d0
077c22 beq.b      $77c30
077c24 cmp.w      #$2, d0
077c28 beq.b      $77c3c
077c2a tst.l      $20(a2)
077c2e bne.b      $77c3c
077c30 move.l     $0(a2), $8(a2)
077c36 move.w     $4(a2), $c(a2)
077c3c lea.l      $3112(a3), a2
077c40 tst.w      $2f8a(a3)
077c44 bmi.b      $77c5e
077c46 move.w     $1a(a2), d0
077c4a beq.b      $77c52
077c4c cmp.w      #$2, d0
077c50 beq.b      $77c5e
077c52 move.l     $0(a2), $8(a2)
077c58 move.w     $4(a2), $c(a2)
077c5e rts        
077c60 tst.w      $3058(a3)
077c64 beq.b      $77ca4
077c66 tst.w      $304c(a3)
077c6a bne.b      $77ca4
077c6c tst.w      $3038(a3)
077c70 beq.b      $77c7e
077c72 tst.w      $312c(a3)
077c76 beq.b      $77ca4
077c78 tst.w      $3120(a3)
077c7c bne.b      $77ca4
077c7e cmpi.w     #$2, $3058(a3)
077c84 beq.b      $77c9c
077c86 tst.w      $3038(a3)
077c8a beq.b      $77c94
077c8c cmpi.w     #$2, $312c(a3)
077c92 beq.b      $77c9c
077c94 move.w     #$1, $2dcc(a3)
077c9a rts        
077c9c move.w     #$2, $2dcc(a3)
077ca2 rts        
077ca4 clr.w      $2dcc(a3)
077ca8 rts        
077caa lea.l      $2cdd(a3), a0
077cae move.b     $2dcf(a3), d0
077cb2 asl.b      #$4, d0
077cb4 move.b     $2dcd(a3), d1
077cb8 andi.b     #$f, d1
077cbc add.b      d0, d1
077cbe move.b     d1, (a0)+
077cc0 move.w     $3042(a3), d0
077cc4 swap       d0
077cc6 move.w     $304e(a3), d0
077cca move.w     $307a(a3), d2
077cce andi.w     #$fc, d0
077cd2 andi.w     #$ff00, d2
077cd6 or.w       d2, d0
077cd8 or.w       $2ed6(a3), d0
077cdc move.l     d0, $30ec(a3)
077ce0 move.w     $3116(a3), d1
077ce4 swap       d1
077ce6 move.w     $3122(a3), d1
077cea move.w     $314e(a3), d2
077cee andi.w     #$fc, d1
077cf2 andi.w     #$ff00, d2
077cf6 or.w       d2, d1
077cf8 or.w       $2ed8(a3), d1
077cfc move.l     d1, $31c0(a3)
077d00 move.w     d0, d4
077d02 lsr.w      #$8, d4
077d04 lsr.w      #$2, d4
077d06 swap       d0
077d08 move.w     d0, d3
077d0a asl.w      #$6, d3
077d0c or.w       d3, d4
077d0e swap       d0
077d10 move.w     d1, d5
077d12 lsr.w      #$8, d5
077d14 lsr.w      #$2, d5
077d16 swap       d1
077d18 move.w     d1, d3
077d1a asl.w      #$6, d3
077d1c or.w       d3, d5
077d1e swap       d1
077d20 asl.b      #$1, d0
077d22 lsr.b      #$4, d0
077d24 asl.b      #$1, d1
077d26 lsr.b      #$4, d1
077d28 move.l     $303e(a3), d2
077d2c lsr.l      #$4, d2
077d2e andi.w     #$fff0, d2
077d32 or.b       d0, d2
077d34 move.w     d2, (a0)+
077d36 move.w     d4, (a0)+
077d38 move.l     $3112(a3), d2
077d3c lsr.l      #$4, d2
077d3e andi.w     #$fff0, d2
077d42 or.b       d1, d2
077d44 move.w     d2, (a0)+
077d46 move.w     d5, (a0)+
077d48 rts        
077d4a lea.l      $2cd1(a3), a0
077d4e move.b     (a0)+, d0
077d50 move.b     d0, d1
077d52 andi.b     #$f0, d1
077d56 lsr.b      #$4, d1
077d58 move.b     d1, $2dd1(a3)
077d5c andi.b     #$f, d0
077d60 asl.b      #$4, d0
077d62 asr.b      #$4, d0
077d64 move.b     d0, $2dd3(a3)
077d68 move.l     $2e3a(a3), d2
077d6c lsr.l      #$4, d2
077d6e move.w     (a0)+, d0
077d70 bmi.b      $77d7c
077d72 tst.w      d2
077d74 bpl.b      $77d7c
077d76 addi.l     #$10000, d2
077d7c move.w     d0, d2
077d7e move.w     d2, d6
077d80 andi.w     #$fff0, d2
077d84 sub.w      d2, d6
077d86 asl.l      #$4, d2
077d88 move.l     d2, $2e3a(a3)
077d8c move.w     (a0)+, d4
077d8e move.l     $2e42(a3), d2
077d92 lsr.l      #$4, d2
077d94 move.w     (a0)+, d0
077d96 bmi.b      $77da2
077d98 tst.w      d2
077d9a bpl.b      $77da2
077d9c addi.l     #$10000, d2
077da2 move.w     d0, d2
077da4 move.w     d2, d7
077da6 andi.w     #$fff0, d2
077daa sub.w      d2, d7
077dac asl.l      #$4, d2
077dae move.l     d2, $2e42(a3)
077db2 move.w     (a0)+, d5
077db4 move.w     d4, d2
077db6 swap       d2
077db8 asr.l      #$6, d2
077dba move.b     d6, d2
077dbc asl.b      #$4, d2
077dbe asr.b      #$1, d2
077dc0 andi.w     #$fcf8, d2
077dc4 or.w       $2eda(a3), d2
077dc8 move.l     d2, $2e3e(a3)
077dcc move.w     d5, d2
077dce swap       d2
077dd0 asr.l      #$6, d2
077dd2 move.b     d7, d2
077dd4 asl.b      #$4, d2
077dd6 asr.b      #$1, d2
077dd8 andi.w     #$fcf8, d2
077ddc or.w       $2edc(a3), d2
077de0 move.l     d2, $2e46(a3)
077de4 rts        
077de6 move.l     $303e(a3), $308c(a3)
077dec move.l     $30ec(a3), $3090(a3)
077df2 move.l     $3046(a3), $3094(a3)
077df8 move.w     $304a(a3), $3098(a3)
077dfe move.w     $3062(a3), $309e(a3)
077e04 move.w     $3052(a3), $309a(a3)
077e0a move.w     $3054(a3), $309c(a3)
077e10 move.l     $3112(a3), $3160(a3)
077e16 move.l     $31c0(a3), $3164(a3)
077e1c move.l     $311a(a3), $3168(a3)
077e22 move.w     $311e(a3), $316c(a3)
077e28 move.w     $3136(a3), $3172(a3)
077e2e move.w     $3126(a3), $316e(a3)
077e34 move.w     $3128(a3), $3170(a3)
077e3a move.l     $2e3a(a3), $2e2a(a3)
077e40 move.l     $2e3e(a3), $2e2e(a3)
077e46 move.l     $2e42(a3), $2e32(a3)
077e4c move.l     $2e46(a3), $2e36(a3)
077e52 lea.l      -$3e46(a3), a0
077e56 lea.l      $2dee(a3), a1
077e5a move.w     #$9, d7
077e5e move.l     (a0)+, (a1)+
077e60 move.w     (a0)+, (a1)+
077e62 addq.w     #$6, a0
077e64 dbra       d7, $77e5e
077e68 rts        
077e6a cmpi.w     #$7fff, $2f8a(a3)
077e70 beq.b      $77e84
077e72 addq.w     #$1, $2f8a(a3)
077e76 cmpi.w     #$200, $2f8a(a3)
077e7c bne.b      $77e84
077e7e move.w     #$100, $2f8a(a3)
077e84 rts        
077e86 lea.l      $303e(a3), a4
077e8a bsr.w      $78a04
077e8e bsr.w      $78692
077e92 bsr.w      $7864e
077e96 bsr.w      $78674
077e9a bsr.w      $78bb6
077e9e tst.w      $2f40(a3)
077ea2 beq.b      $77ea6
077ea4 bsr.b      $77f08
077ea6 bsr.w      $7871c
077eaa rts        
077eac lea.l      $303e(a3), a4
077eb0 move.w     $3042(a3), $3110(a3)
077eb6 bsr.w      $77fd4
077eba move.w     $3042(a3), d0
077ebe move.w     $3110(a3), $3042(a3)
077ec4 move.w     d0, $3110(a3)
077ec8 bsr.w      $78442
077ecc tst.w      $2de8(a3)
077ed0 beq.b      $77ed6
077ed2 bsr.w      $78514
077ed6 bsr.w      $785c0
077eda rts        
077edc tst.w      $3038(a3)
077ee0 beq.b      $77f06
077ee2 lea.l      $3112(a3), a4
077ee6 bsr.w      $78a04
077eea bsr.w      $78692
077eee bsr.w      $7864e
077ef2 bsr.w      $78674
077ef6 bsr.w      $78bb6
077efa tst.w      $2f40(a3)
077efe beq.b      $77f02
077f00 bsr.b      $77f08
077f02 bsr.w      $7871c
077f06 rts        
077f08 move.w     $0(a4), d0
077f0c asl.w      #$4, d0
077f0e lea.l      -$1e78(a3), a0
077f12 move.b     $e(a0), d0
077f16 add.b      $f(a0), d0
077f1a asr.b      #$1, d0
077f1c ext.w      d0
077f1e move.w     $4(a4), d1
077f22 asr.w      #$4, d1
077f24 moveq      #$0, d2
077f26 cmp.w      d1, d0
077f28 beq.b      $77f32
077f2a bpl.b      $77f30
077f2c moveq      #$1, d2
077f2e bra.b      $77f32
077f30 moveq      #$2, d2
077f32 ori.w      #$10, d2
077f36 move.b     d2, $36(a4)
077f3a rts        
077f3c lea.l      $3112(a3), a4
077f40 tst.w      $3038(a3)
077f44 beq.b      $77f70
077f46 move.w     $3116(a3), $31e4(a3)
077f4c bsr.w      $77fd4
077f50 move.w     $3116(a3), d0
077f54 move.w     $31e4(a3), $3116(a3)
077f5a move.w     d0, $31e4(a3)
077f5e bsr.w      $78442
077f62 tst.w      $2de8(a3)
077f66 beq.b      $77f6c
077f68 bsr.w      $78514
077f6c bsr.w      $785e0
077f70 rts        
077f72 addq.w     #$1, $2f8e(a3)
077f76 move.w     $2f8c(a3), d0
077f7a tst.w      d0
077f7c beq.b      $77f8c
077f7e cmp.w      #$1, d0
077f82 beq.b      $77f94
077f84 lea.l      $7f5ee.l, a0
077f8a bra.b      $77f9a
077f8c lea.l      $7e426.l, a0
077f92 bra.b      $77f9a
077f94 lea.l      $7ed0a.l, a0
077f9a lea.l      $300e(a3), a1
077f9e move.w     $301e(a3), d0
077fa2 add.w      d0, d0
077fa4 move.w     (a1, d0.w), d0
077fa8 move.w     d0, $2f70(a3)
077fac cmp.w      $2f8e(a3), d0
077fb0 bmi.b      $77fd2
077fb2 move.l     a0, $80(a6)
077fb6 addq.w     #$1, $301e(a3)
077fba andi.w     #$7, $301e(a3)
077fc0 move.w     $2f8c(a3), d0
077fc4 addq.w     #$1, d0
077fc6 cmp.w      #$3, d0
077fca bne.b      $77fce
077fcc moveq      #$0, d0
077fce move.w     d0, $2f8c(a3)
077fd2 rts        
077fd4 tst.w      $ac(a4)
077fd8 beq.b      $77fe4
077fda addq.w     #$1, $ac(a4)
077fde andi.w     #$f, $ac(a4)
077fe4 tst.w      $c0(a4)
077fe8 beq.b      $77ffe
077fea addq.w     #$1, $c0(a4)
077fee cmpi.w     #$14, $c0(a4)
077ff4 bne.b      $77ffe
077ff6 clr.w      $c2(a4)
077ffa clr.w      $c0(a4)
077ffe tst.w      $24(a4)
078002 beq.b      $78068
078004 move.l     $4(a4), d4
078008 swap       d4
07800a move.l     $2c7e(a3), d0
07800e cmp.w      d0, d4
078010 bpl.b      $78016
078012 move.l     d0, d4
078014 bra.b      $7802a
078016 neg.l      d0
078018 cmp.w      d0, d4
07801a beq.b      $78022
07801c bmi.b      $78022
07801e move.l     d0, d4
078020 bra.b      $7802a
078022 swap       d4
078024 move.l     d4, $4(a4)
078028 bra.b      $78068
07802a move.w     d4, $aa(a4)
07802e move.w     #$1, $ac(a4)
078034 swap       d4
078036 move.l     d4, $4(a4)
07803a moveq      #$68, d0
07803c bsr.w      $73740
078040 move.w     $e(a4), d1
078044 move.w     d1, d0
078046 mulu.w     #$f800, d0
07804a swap       d0
07804c move.w     d0, $e(a4)
078050 move.w     d1, d0
078052 lsr.w      #$8, d0
078054 addi.w     #$a, d0
078058 move.w     $4(a4), d2
07805c tst.w      d2
07805e bmi.b      $78062
078060 neg.w      d0
078062 move.w     d0, $1c(a4)
078066 rts        
078068 move.w     $0(a4), d0
07806c asl.w      #$4, d0
07806e lea.l      -$1e78(a3), a1
078072 move.w     $a(a1, d0.w), d1
078076 move.w     $2(a4), d0
07807a lsr.w      #$8, d0
07807c lsr.w      #$6, d0
07807e eori.w     #$3, d0
078082 asl.w      #$2, d0
078084 lsr.w      d0, d1
078086 andi.w     #$f, d1
07808a tst.w      $2dd4(a3)
07808e beq.b      $780a2
078090 cmp.b      #$1, d1
078094 bne.b      $780a2
078096 clr.w      $c2(a4)
07809a move.w     #$85, d1
07809e bra.w      $78148
0780a2 move.l     $0(a4), d6
0780a6 addi.l     #$2000, d6
0780ac btst.b     #$d, d6
0780b0 bne.w      $783e4
0780b4 move.l     d6, d7
0780b6 swap       d7
0780b8 asl.w      #$4, d7
0780ba rol.w      #$2, d6
0780bc andi.w     #$3, d6
0780c0 add.w      d6, d6
0780c2 add.w      d6, d7
0780c4 lea.l      -$1e78(a3), a0
0780c8 move.b     $2(a0, d7.w), d3
0780cc beq.w      $783e4
0780d0 andi.w     #$ff, d3
0780d4 cmp.w      #$f8, d3
0780d8 bcc.w      $783e4
0780dc move.w     d3, d1
0780de subi.w     #$70, d3
0780e2 add.w      d3, d3
0780e4 add.w      d3, d3
0780e6 lea.l      $28ec(a3), a1
0780ea move.w     $2(a1, d3.w), d0
0780ee andi.w     #$ff, d0
0780f2 move.w     (a1, d3.w), d3
0780f6 lsr.w      #$8, d3
0780f8 addi.w     #$40, d3
0780fc lsr.w      #$1, d3
0780fe move.w     d3, d4
078100 neg.w      d4
078102 cmp.w      #$9a, d1
078106 beq.w      $782aa
07810a cmp.w      #$d4, d1
07810e beq.b      $78120
078110 cmp.w      #$da, d1
078114 bne.b      $7812a
078116 move.b     $3(a0, d7.w), d2
07811a ext.w      d2
07811c subq.w     #$3, d2
07811e bra.b      $78130
078120 move.b     $3(a0, d7.w), d2
078124 ext.w      d2
078126 addq.w     #$3, d2
078128 bra.b      $78130
07812a move.b     $3(a0, d7.w), d2
07812e ext.w      d2
078130 asl.w      #$4, d2
078132 sub.w      $4(a4), d2
078136 cmp.w      d4, d2
078138 bcc.b      $78140
07813a cmp.w      d3, d2
07813c bcc.w      $783e4
078140 move.w     d2, $c2(a4)
078144 move.w     #$d800, d2
078148 cmp.w      #$85, d1
07814c bne.b      $78166
07814e move.w     $3c(a4), d0
078152 beq.b      $78158
078154 bpl.w      $783e4
078158 move.w     $e(a4), d0
07815c mulu.w     #$fd00, d0
078160 swap       d0
078162 move.w     d0, $e(a4)
078166 tst.w      $a4(a4)
07816a bne.w      $783dc
07816e move.w     d1, d3
078170 cmp.w      #$78, d3
078174 beq.w      $783dc
078178 cmp.w      #$79, d3
07817c beq.w      $783dc
078180 cmp.w      #$7a, d3
078184 beq.w      $783dc
078188 cmp.w      #$76, d3
07818c beq.w      $78240
078190 cmp.w      #$77, d3
078194 beq.w      $78258
078198 cmp.w      #$c4, d3
07819c beq.w      $78222
0781a0 cmp.w      #$40, d3
0781a4 bmi.w      $783dc
0781a8 cmp.w      #$e2, d3
0781ac beq.w      $783dc
0781b0 cmp.w      #$e3, d3
0781b4 beq.w      $783dc
0781b8 cmp.w      #$b6, d3
0781bc beq.w      $782fa
0781c0 cmp.w      #$c6, d3
0781c4 beq.w      $782fa
0781c8 cmp.w      #$b7, d3
0781cc beq.w      $782fc
0781d0 cmp.w      #$c7, d3
0781d4 beq.w      $782fc
0781d8 cmp.w      #$83, d3
0781dc beq.w      $78326
0781e0 cmp.w      #$a1, d3
0781e4 beq.w      $78326
0781e8 cmp.w      #$c5, d3
0781ec beq.w      $78326
0781f0 cmp.w      #$e6, d3
0781f4 beq.w      $78326
0781f8 cmp.w      #$72, d3
0781fc beq.w      $783e4
078200 cmp.w      #$e5, d3
078204 beq.w      $78370
078208 cmp.w      #$b5, d3
07820c beq.w      $78370
078210 cmp.w      #$a7, d3
078214 beq.w      $78370
078218 cmp.w      #$85, d3
07821c beq.b      $78290
07821e bra.w      $783b4
078222 move.b     #$1, $2(a0, d7.w)
078228 moveq      #$69, d0
07822a bsr.w      $73740
07822e move.w     $e(a4), d1
078232 mulu.w     #$f000, d1
078236 swap       d1
078238 move.w     d1, $e(a4)
07823c bra.w      $783dc
078240 addi.w     #$1f4, $bc(a4)
078246 moveq      #$53, d0
078248 tst.w      $2cf2(a3)
07824c beq.b      $78250
07824e moveq      #$5d, d0
078250 bsr.w      $73740
078254 bra.w      $783dc
078258 addi.w     #$64, $c6(a4)
07825e cmpi.w     #$2, $3022(a3)
078264 beq.b      $7826a
078266 addq.w     #$3, $20(a4)
07826a clr.w      $1a(a4)
07826e cmpi.w     #$63, $20(a4)
078274 bmi.b      $7827e
078276 move.l     #$630031, $20(a4)
07827e moveq      #$53, d0
078280 tst.w      $2cf2(a3)
078284 beq.b      $78288
078286 moveq      #$5e, d0
078288 bsr.w      $73740
07828c bra.w      $783dc
078290 move.w     $3c(a4), d0
078294 beq.b      $7829a
078296 bpl.w      $783e4
07829a moveq      #$64, d0
07829c bsr.w      $73740
0782a0 move.w     #$1, $c0(a4)
0782a6 bra.w      $783dc
0782aa move.b     $3(a0, d7.w), d2
0782ae ext.w      d2
0782b0 asl.w      #$4, d2
0782b2 sub.w      $2cf8(a3), d2
0782b6 asl.w      #$4, d2
0782b8 andi.w     #$1fff, d2
0782bc subi.w     #$1000, d2
0782c0 sub.w      $4(a4), d2
0782c4 neg.w      d2
0782c6 cmp.w      #$fec5, d2
0782ca bmi.w      $783e4
0782ce cmp.w      #$ffab, d2
0782d2 bmi.b      $782ee
0782d4 cmp.w      #$55, d2
0782d8 bmi.b      $782e4
0782da cmp.w      #$a0, d2
0782de bmi.b      $782ee
0782e0 bra.w      $783e4
0782e4 move.w     #$1, $ba(a4)
0782ea bra.w      $783e4
0782ee clr.w      $ba(a4)
0782f2 move.w     #$c000, d2
0782f6 bra.w      $78148
0782fa neg.w      d2
0782fc bsr.w      $73740
078300 move.w     $c2(a4), d2
078304 addi.w     #$70, d2
078308 lsr.w      #$3, d2
07830a lea.l      $78408(pc), a0
07830e add.w      d2, d2
078310 move.w     (a0, d2.w), d2
078314 move.w     $e(a4), d1
078318 move.w     d1, d0
07831a mulu.w     d2, d0
07831c swap       d0
07831e move.w     d0, $e(a4)
078322 bra.w      $783dc
078326 move.w     $3c(a4), d1
07832a cmp.w      #$2000, d1
07832e bcc.w      $783e4
078332 cmpi.w     #$fff1, $10(a4)
078338 bmi.b      $783b4
07833a cmpi.w     #$10, $10(a4)
078340 bpl.b      $783b4
078342 clr.w      $10(a4)
078346 move.w     $e(a4), d1
07834a cmp.w      #$800, d1
07834e bmi.b      $783b4
078350 lsr.w      #$4, d1
078352 addi.w     #$600, d1
078356 move.w     d1, $3e(a4)
07835a moveq      #$52, d0
07835c bsr.w      $73740
078360 addi.l     #$186a0, $2e(a4)
078368 move.w     #$1, $40(a4)
07836e bra.b      $783dc
078370 move.w     $3c(a4), d0
078374 bne.b      $783e4
078376 moveq      #$6b, d0
078378 bsr.w      $73740
07837c move.w     $e(a4), d1
078380 move.w     d1, d0
078382 lsr.w      #$8, d0
078384 addi.w     #$10, d0
078388 moveq      #$f8, d1
07838a tst.w      $10(a4)
07838e beq.b      $783a6
078390 bmi.b      $78396
078392 neg.w      d0
078394 neg.w      d1
078396 tst.w      $1e(a4)
07839a bne.b      $783a4
07839c move.w     d1, $1e(a4)
0783a0 move.w     d0, $1c(a4)
0783a4 bra.b      $783dc
0783a6 move.w     d0, d2
0783a8 bsr.w      $78c64
0783ac move.w     d2, d0
0783ae tst.w      $2f5c(a3)
0783b2 bra.b      $78390
0783b4 bsr.w      $73740
0783b8 move.w     $e(a4), d1
0783bc move.w     d1, d0
0783be mulu.w     d2, d0
0783c0 swap       d0
0783c2 move.w     d0, $e(a4)
0783c6 move.w     d1, d0
0783c8 lsr.w      #$8, d0
0783ca addi.w     #$10, d0
0783ce move.w     $4(a4), d2
0783d2 tst.w      d2
0783d4 bmi.b      $783d8
0783d6 neg.w      d0
0783d8 move.w     d0, $1c(a4)
0783dc move.w     #$1, $a4(a4)
0783e2 rts        
0783e4 clr.w      $a4(a4)
0783e8 tst.w      $ba(a4)
0783ec beq.b      $78406
0783ee clr.w      $ba(a4)
0783f2 addi.l     #$7a120, $2e(a4)
0783fa tst.w      $2cf2(a3)
0783fe beq.b      $78406
078400 moveq      #$5c, d0
078402 bsr.w      $73740
078406 rts        
078408 .byte      0xff, 0xff
07840a dc.w       $fe00
07840c dc.w       $fc00
07840e dc.w       $fa00
078410 dc.w       $f800
078412 dc.w       $f600
078418 dc.w       $f000
07841a asr.b      #$7, d0
07841c asr.b      #$6, d0
07841e asr.b      #$5, d0
078420 asr.b      #$4, d0
078422 asr.b      #$3, d0
078424 asr.b      #$2, d0
078426 asr.b      #$1, d0
078428 asr.b      #$8, d0
07842a add.b      d0, d7
07842c add.b      d0, d6
07842e add.b      d0, d6
078430 asr.b      #$8, d0
078432 asr.b      #$2, d0
078434 asr.b      #$4, d0
078436 asr.b      #$6, d0
078438 dc.w       $f000
07843a dc.w       $f400
07843c dc.w       $f800
07843e dc.w       $fc00
078440 .byte      0xff, 0xff
078442 lea.l      -$3e46(a3), a0
078446 move.l     $0(a4), d5
07844a move.w     #$9, d7
07844e move.l     (a0)+, d1
078450 move.l     (a0)+, d4
078452 addq.w     #$4, a0
078454 sub.l      d5, d1
078456 cmp.l      #$80000, d1
07845c bpl.b      $78474
07845e andi.l     #$3fffff, d1
078464 cmp.l      #$2000, d1
07846a bmi.b      $7847c
07846c cmp.l      #$3fe000, d1
078472 bpl.b      $7849a
078474 dbra       d7, $7844e
078478 bra.w      $7850e
07847c move.l     d4, d2
07847e swap       d2
078480 sub.w      $4(a4), d2
078484 cmp.w      #$ffc0, d2
078488 bmi.w      $7850e
07848c cmp.w      #$40, d2
078490 bpl.b      $7850e
078492 cmp.w      $e(a4), d4
078496 bcs.b      $784d6
078498 bra.b      $784ae
07849a move.l     d4, d2
07849c swap       d2
07849e sub.w      $4(a4), d2
0784a2 cmp.w      #$ffc0, d2
0784a6 bmi.b      $7850e
0784a8 cmp.w      #$40, d2
0784ac bpl.b      $7850e
0784ae tst.w      d2
0784b0 bpl.b      $784c0
0784b2 moveq      #$c0, d2
0784b4 tst.w      -$2(a0)
0784b8 bmi.b      $784be
0784ba neg.w      -$2(a0)
0784be bra.b      $784cc
0784c0 moveq      #$40, d2
0784c2 tst.w      -$2(a0)
0784c6 bpl.b      $784cc
0784c8 neg.w      -$2(a0)
0784cc add.w      $4(a4), d2
0784d0 move.w     d2, -$8(a0)
0784d4 bra.b      $7850e
0784d6 tst.w      $b8(a4)
0784da bne.b      $78512
0784dc move.w     #$1, $b8(a4)
0784e2 moveq      #$62, d0
0784e4 bsr.w      $73740
0784e8 move.w     $e(a4), d0
0784ec move.w     d0, d1
0784ee mulu.w     #$e000, d0
0784f2 swap       d0
0784f4 move.w     d0, $e(a4)
0784f8 lsr.w      #$8, d1
0784fa lsr.w      #$3, d1
0784fc move.w     d1, d0
0784fe addi.w     #$18, d0
078502 tst.w      d2
078504 bmi.b      $78508
078506 neg.w      d0
078508 move.w     d0, $1c(a4)
07850c bra.b      $78512
07850e clr.w      $b8(a4)
078512 rts        
078514 lea.l      -$3dce(a3), a0
078518 move.l     $0(a4), d5
07851c move.w     #$7, d7
078520 move.l     (a0)+, d1
078522 move.l     (a0)+, d4
078524 sub.l      d5, d1
078526 cmp.l      #$80000, d1
07852c bpl.b      $7854c
07852e andi.l     #$3fffff, d1
078534 cmp.l      #$2000, d1
07853a bmi.b      $7856e
07853c cmp.l      #$30000, d1
078542 bmi.b      $7854c
078544 cmp.l      #$40000, d1
07854a bmi.b      $78552
07854c dbra       d7, $78520
078550 bra.b      $785ba
078552 move.l     d4, d2
078554 swap       d2
078556 sub.w      $4(a4), d2
07855a cmp.w      #$ffc0, d2
07855e bmi.b      $7854c
078560 cmp.w      #$40, d2
078564 bpl.b      $7854c
078566 moveq      #$6e, d0
078568 bsr.w      $73740
07856c bra.b      $7854c
07856e move.l     d4, d2
078570 swap       d2
078572 sub.w      $4(a4), d2
078576 cmp.w      #$ffc0, d2
07857a bmi.b      $785ba
07857c cmp.w      #$40, d2
078580 bpl.b      $785ba
078582 tst.w      $b8(a4)
078586 bne.b      $785be
078588 move.w     #$1, $b8(a4)
07858e moveq      #$62, d0
078590 bsr.w      $73740
078594 move.w     $e(a4), d0
078598 move.w     d0, d1
07859a mulu.w     #$d000, d0
07859e swap       d0
0785a0 move.w     d0, $e(a4)
0785a4 lsr.w      #$8, d1
0785a6 lsr.w      #$3, d1
0785a8 move.w     d1, d0
0785aa addi.w     #$18, d0
0785ae tst.w      d2
0785b0 bmi.b      $785b4
0785b2 neg.w      d0
0785b4 move.w     d0, $1c(a4)
0785b8 bra.b      $785be
0785ba clr.w      $b8(a4)
0785be rts        
0785c0 move.l     $3112(a3), d1
0785c4 move.w     $3116(a3), d2
0785c8 bsr.b      $78600
0785ca move.l     $2e3a(a3), d1
0785ce move.w     $2e3e(a3), d2
0785d2 bsr.b      $78600
0785d4 move.l     $2e42(a3), d1
0785d8 move.w     $2e46(a3), d2
0785dc bsr.b      $78600
0785de rts        
0785e0 move.l     $303e(a3), d1
0785e4 move.w     $3042(a3), d2
0785e8 bsr.b      $78600
0785ea move.l     $2e3a(a3), d1
0785ee move.w     $2e3e(a3), d2
0785f2 bsr.b      $78600
0785f4 move.l     $2e42(a3), d1
0785f8 move.w     $2e46(a3), d2
0785fc bsr.b      $78600
0785fe rts        
078600 sub.w      $4(a4), d2
078604 cmp.w      #$ffc0, d2
078608 bmi.b      $7864c
07860a cmp.w      #$40, d2
07860e bpl.b      $7864c
078610 sub.l      $0(a4), d1
078614 cmp.l      #$2000, d1
07861a bcc.b      $7864c
07861c moveq      #$62, d0
07861e bsr.w      $73740
078622 subi.l     #$2000, d1
078628 add.l      d1, $0(a4)
07862c move.w     $e(a4), d0
078630 mulu.w     #$e000, d0
078634 swap       d0
078636 move.w     d0, $e(a4)
07863a lsr.w      #$8, d0
07863c lsr.w      #$2, d0
07863e addi.w     #$10, d0
078642 tst.w      d2
078644 bmi.b      $78648
078646 neg.w      d0
078648 move.w     d0, $1c(a4)
07864c rts        
07864e cmpi.w     #$2, $3022(a3)
078654 beq.b      $78672
078656 tst.l      $20(a4)
07865a beq.b      $78672
07865c tst.w      $1a(a4)
078660 bne.b      $78672
078662 subq.w     #$1, $22(a4)
078666 bpl.b      $78672
078668 move.w     #$31, $22(a4)
07866e subq.w     #$1, $20(a4)
078672 rts        
078674 move.w     $e(a4), d0
078678 mulu.w     $e(a4), d0
07867c clr.w      d0
07867e swap       d0
078680 andi.l     #$fffffff8, d0
078686 move.l     d0, d1
078688 lsr.l      #$2, d1
07868a add.l      d1, d0
07868c add.l      d0, $2e(a4)
078690 rts        
078692 move.l     $8(a4), d7
078696 swap       d7
078698 asl.w      #$4, d7
07869a lea.l      -$1e78(a3), a0
07869e move.w     $2(a0, d7.w), d0
0786a2 move.w     d0, d1
0786a4 andi.w     #$ff00, d1
0786a8 sub.w      d1, d0
0786aa cmp.w      #$7a00, d1
0786ae bne.b      $786f4
0786b0 tst.w      $18(a4)
0786b4 bne.b      $786f2
0786b6 addi.l     #$30d40, $2e(a4)
0786be move.w     #$80, $a8(a4)
0786c4 cmpi.w     #$2, $3022(a3)
0786ca bne.b      $786ce
0786cc moveq      #$0, d0
0786ce swap       d0
0786d0 clr.w      d0
0786d2 add.l      $20(a4), d0
0786d6 cmp.l      #$640000, d0
0786dc bcs.b      $786e4
0786de move.l     #$630031, d0
0786e4 move.l     d0, $20(a4)
0786e8 move.w     #$1, $18(a4)
0786ee clr.w      $1a(a4)
0786f2 bra.b      $786f8
0786f4 clr.w      $18(a4)
0786f8 move.w     $a(a0, d7.w), d0
0786fc andi.w     #$8000, d0
078700 rol.w      #$1, d0
078702 move.w     d0, $24(a4)
078706 move.b     $72(a0, d7.w), d0
07870a cmp.b      #$fc, d0
07870e bne.b      $7871a
078710 move.b     $73(a0, d7.w), d0
078714 ext.w      d0
078716 move.w     d0, $b6(a4)
07871a rts        
07871c tst.w      $e(a4)
078720 bne.b      $78728
078722 move.b     #$0, $36(a4)
078728 tst.w      $1a(a4)
07872c beq.b      $78746
07872e move.w     $e(a4), -(a7)
078732 bsr.b      $78746
078734 move.w     (a7)+, $e(a4)
078738 subi.w     #$18, $e(a4)
07873e bpl.b      $78744
078740 clr.w      $e(a4)
078744 rts        
078746 tst.w      $40(a4)
07874a beq.b      $7879a
07874c move.w     $c8(a4), d1
078750 neg.w      d1
078752 subi.w     #$50, $3e(a4)
078758 move.w     $3e(a4), d0
07875c add.w      $3c(a4), d0
078760 cmp.w      d1, d0
078762 bpl.b      $78794
078764 tst.w      d1
078766 beq.b      $7877a
078768 clr.w      $c2(a4)
07876c move.w     #$1, $c0(a4)
078772 moveq      #$64, d0
078774 bsr.w      $73740
078778 bra.b      $7878a
07877a neg.w      $3e(a4)
07877e lsr.w      $3e(a4)
078782 cmpi.w     #$100, $3e(a4)
078788 bpl.b      $78792
07878a clr.w      $40(a4)
07878e clr.w      $3e(a4)
078792 clr.w      d0
078794 move.w     d0, $3c(a4)
078798 bra.b      $787a4
07879a move.w     $c8(a4), d0
07879e neg.w      d0
0787a0 move.w     d0, $3c(a4)
0787a4 move.w     $10(a4), d6
0787a8 move.w     $e(a4), d7
0787ac move.l     $4(a4), d4
0787b0 move.w     $28(a4), d3
0787b4 clr.w      $26(a4)
0787b8 tst.w      $40(a4)
0787bc bne.w      $78878
0787c0 btst.b     #$0, $36(a4)
0787c6 beq.b      $787cc
0787c8 sub.w      $2f80(a3), d6
0787cc btst.b     #$1, $36(a4)
0787d2 beq.b      $787d8
0787d4 add.w      $2f80(a3), d6
0787d8 move.w     d7, d0
0787da ext.l      d0
0787dc swap       d0
0787de move.w     d3, d2
0787e0 movea.l    $2ffa(a3), a0
0787e4 add.w      d2, d2
0787e6 move.w     (a0, d2.w), d2
0787ea divu.w     d2, d0
0787ec cmp.w      #$1f40, d0
0787f0 bcs.b      $787f6
0787f2 move.w     #$1f3f, d0
0787f6 tst.w      $bc(a4)
0787fa beq.b      $78806
0787fc subq.w     #$1, $bc(a4)
078800 lea.l      $74ef6(pc), a0
078804 bra.b      $78824
078806 movea.l    $2ff6(a3), a0
07880a tst.w      $38(a4)
07880e bne.b      $78818
078810 btst.b     #$3, $36(a4)
078816 bra.b      $7881e
078818 btst.b     #$4, $36(a4)
07881e beq.b      $7882a
078820 movea.l    $2ff2(a3), a0
078824 move.w     #$ffff, $26(a4)
07882a lsr.w      #$7, d0
07882c add.w      d0, d0
07882e move.w     (a0, d0.w), d0
078832 ext.l      d0
078834 move.l     d0, d1
078836 add.l      d1, d0
078838 add.l      d1, d0
07883a asl.l      #$8, d0
07883c asl.l      #$2, d0
07883e lsr.w      #$1, d2
078840 divs.w     d2, d0
078842 add.w      d0, d7
078844 clr.w      $c4(a4)
078848 move.w     d7, d1
07884a sub.w      $ce(a4), d1
07884e cmp.w      $2f82(a3), d1
078852 bpl.b      $7885a
078854 move.w     d7, $ce(a4)
078858 bra.b      $78878
07885a move.w     #$1, $c4(a4)
078860 asr.w      #$5, d1
078862 add.w      d1, $ce(a4)
078866 cmpi.w     #$1aa, $ce(a4)
07886c bpl.b      $78878
07886e move.w     #$1aa, $ce(a4)
078874 clr.w      $c4(a4)
078878 add.w      $1e(a4), d6
07887c tst.w      d6
07887e beq.b      $78888
078880 bmi.b      $78886
078882 subq.w     #$1, d6
078884 bra.b      $78888
078886 addq.w     #$1, d6
078888 cmp.w      #$20, d6
07888c bmi.b      $78890
07888e moveq      #$20, d6
078890 cmp.w      #$ffe0, d6
078894 bpl.b      $78898
078896 moveq      #$e0, d6
078898 tst.w      $1e(a4)
07889c beq.b      $788aa
07889e bpl.b      $788a6
0788a0 addq.w     #$1, $1e(a4)
0788a4 bra.b      $788aa
0788a6 subq.w     #$1, $1e(a4)
0788aa tst.w      $1c(a4)
0788ae beq.b      $788bc
0788b0 bpl.b      $788b8
0788b2 addq.w     #$1, $1c(a4)
0788b6 bra.b      $788bc
0788b8 subq.w     #$1, $1c(a4)
0788bc tst.w      $3c(a4)
0788c0 beq.b      $788c4
0788c2 bpl.b      $788f4
0788c4 move.l     d4, d0
0788c6 swap       d0
0788c8 addi.w     #$200, d0
0788cc lsr.w      #$4, d0
0788ce lea.l      $23f8(a3), a0
0788d2 move.b     (a0, d0.w), d0
0788d6 beq.b      $788e0
0788d8 ext.w      d0
0788da asl.w      #$6, d0
0788dc mulu.w     d0, d7
0788de swap       d7
0788e0 move.w     $16(a4), d0
0788e4 asr.w      #$6, d0
0788e6 add.w      d0, d7
0788e8 btst.b     #$2, $36(a4)
0788ee beq.b      $788f4
0788f0 subi.w     #$30, d7
0788f4 cmp.w      #$1aa, d7
0788f8 bpl.b      $788fe
0788fa move.w     #$1aa, d7
0788fe move.w     d7, d0
078900 ext.l      d0
078902 swap       d0
078904 move.w     d3, d2
078906 movea.l    $2ffa(a3), a0
07890a add.w      d2, d2
07890c move.w     (a0, d2.w), d2
078910 divu.w     d2, d0
078912 cmp.w      #$3e8, d0
078916 bpl.b      $7891c
078918 move.w     #$3e8, d0
07891c cmp.w      #$1f3f, d0
078920 bmi.b      $78926
078922 move.w     #$1f3f, d0
078926 move.w     d0, $2f9c(a3)
07892a mulu.w     d2, d0
07892c swap       d0
07892e move.w     d0, d7
078930 move.w     d3, d1
078932 tst.w      $1a(a4)
078936 bne.b      $78998
078938 tst.w      $bc(a4)
07893c bne.b      $78998
07893e tst.w      $3a(a4)
078942 bne.b      $78998
078944 tst.w      $38(a4)
078948 bne.b      $7895c
07894a btst.b     #$3, $36(a4)
078950 beq.b      $7896e
078952 btst.b     #$4, $34(a4)
078958 beq.b      $7896e
07895a bra.b      $78964
07895c btst.b     #$3, $34(a4)
078962 beq.b      $7896e
078964 cmp.w      #$4, d3
078968 beq.b      $7896e
07896a addq.w     #$1, d1
07896c bra.b      $789c0
07896e tst.w      $38(a4)
078972 bne.b      $78986
078974 btst.b     #$2, $36(a4)
07897a beq.b      $78996
07897c btst.b     #$4, $34(a4)
078982 beq.b      $78996
078984 bra.b      $7898e
078986 btst.b     #$2, $34(a4)
07898c beq.b      $78996
07898e tst.w      d3
078990 beq.b      $78996
078992 subq.w     #$1, d1
078994 bra.b      $789c0
078996 bra.b      $789f0
078998 move.w     $2f9c(a3), d0
07899c cmp.w      $2c(a4), d0
0789a0 beq.b      $789a4
0789a2 bcc.b      $789b2
0789a4 cmp.w      #$dac, d0
0789a8 bcc.b      $789f0
0789aa tst.w      d1
0789ac beq.b      $789f0
0789ae subq.w     #$1, d1
0789b0 bra.b      $789c0
0789b2 cmp.w      #$1388, d0
0789b6 bcs.b      $789f0
0789b8 cmp.w      #$4, d1
0789bc beq.b      $789f0
0789be addq.w     #$1, d1
0789c0 move.w     d7, d0
0789c2 ext.l      d0
0789c4 swap       d0
0789c6 move.w     d1, d2
0789c8 movea.l    $2ffa(a3), a0
0789cc add.w      d2, d2
0789ce move.w     (a0, d2.w), d2
0789d2 divu.w     d2, d0
0789d4 cmp.w      #$3e8, d0
0789d8 bcs.b      $789f0
0789da cmp.w      #$1f3f, d0
0789de bcc.b      $789f0
0789e0 move.w     d0, $2f9c(a3)
0789e4 mulu.w     d2, d0
0789e6 swap       d0
0789e8 move.w     d0, d7
0789ea move.w     d1, d3
0789ec move.w     d7, $ce(a4)
0789f0 move.w     d3, $28(a4)
0789f4 move.w     d6, $10(a4)
0789f8 move.w     d7, $e(a4)
0789fc move.w     $2f9c(a3), $2c(a4)
078a02 rts        
078a04 move.l     $4(a4), d4
078a08 move.l     $0(a4), d7
078a0c move.w     $ce(a4), d0
078a10 ext.l      d0
078a12 bmi.b      $78a16
078a14 add.l      d0, d7
078a16 move.l     d7, $0(a4)
078a1a tst.w      $26(a4)
078a1e beq.b      $78a2c
078a20 cmp.w      $2f7c(a3), d0
078a24 bcs.b      $78a2c
078a26 add.w      $2f7c(a3), d0
078a2a lsr.w      #$1, d0
078a2c cmp.w      $2f7e(a3), d0
078a30 bcc.b      $78a38
078a32 add.w      $2f7e(a3), d0
078a36 lsr.w      #$1, d0
078a38 move.w     d0, d1
078a3a muls.w     $10(a4), d1
078a3e add.l      d1, d4
078a40 asl.l      #$2, d1
078a42 add.l      d1, d4
078a44 tst.w      $2dd6(a3)
078a48 bne.w      $78af6
078a4c tst.w      $1a(a4)
078a50 bne.b      $78aba
078a52 tst.w      $e(a4)
078a56 beq.b      $78a62
078a58 tst.w      $c4(a4)
078a5c beq.b      $78a62
078a5e moveq      #$ff, d1
078a60 bra.b      $78a78
078a62 move.w     $e(a4), d1
078a66 sub.w      d0, d1
078a68 muls.w     $10(a4), d1
078a6c bpl.b      $78a70
078a6e neg.l      d1
078a70 subi.l     #$8000, d1
078a76 bmi.b      $78aba
078a78 tst.w      $b2(a4)
078a7c bpl.b      $78a90
078a7e cmpi.w     #$32, $2f8a(a3)
078a84 bmi.b      $78aba
078a86 moveq      #$6c, d0
078a88 bsr.w      $73740
078a8c move.w     d0, $b2(a4)
078a90 move.w     $b2(a4), d0
078a94 asl.w      #$4, d0
078a96 lea.l      $dff000.l, a0
078a9c adda.w     d0, a0
078a9e lsr.w      #$8, d1
078aa0 cmp.w      #$40, d1
078aa4 bmi.b      $78aa8
078aa6 moveq      #$40, d1
078aa8 move.w     d1, d0
078aaa move.w     d0, $b4(a4)
078aae tst.w      $2f40(a3)
078ab2 bne.b      $78af6
078ab4 move.w     d0, $a8(a0)
078ab8 bra.b      $78af6
078aba move.w     $b2(a4), d0
078abe bmi.b      $78a90
078ac0 move.w     d0, d1
078ac2 asl.w      #$4, d1
078ac4 lea.l      $dff000.l, a0
078aca adda.w     d1, a0
078acc tst.w      $2f40(a3)
078ad0 bne.b      $78ad6
078ad2 clr.w      $a8(a0)
078ad6 move.w     #$ffff, $b2(a4)
078adc clr.w      $b4(a4)
078ae0 move.w     d0, d1
078ae2 add.w      d0, d0
078ae4 lea.l      $2c8c(a3), a0
078ae8 move.w     #$fffe, (a0, d0.w)
078aee moveq      #$0, d0
078af0 bset.b     d1, d0
078af2 move.w     d0, $96(a6)
078af6 move.w     $12(a4), d0
078afa move.w     d0, d1
078afc add.w      d1, d0
078afe add.w      d1, d0
078b00 add.w      d0, d0
078b02 add.w      d0, d0
078b04 muls.w     $e(a4), d0
078b08 add.l      d0, d4
078b0a move.w     $1c(a4), d0
078b0e swap       d0
078b10 clr.w      d0
078b12 asr.l      #$1, d0
078b14 add.l      d0, d4
078b16 swap       d4
078b18 move.l     $2c7a(a3), d0
078b1c cmp.w      d0, d4
078b1e bpl.b      $78b22
078b20 move.l     d0, d4
078b22 neg.l      d0
078b24 cmp.w      d0, d4
078b26 bmi.b      $78b2a
078b28 move.l     d0, d4
078b2a swap       d4
078b2c move.l     d4, $4(a4)
078b30 moveq      #$0, d3
078b32 move.w     $0(a4), d0
078b36 asl.w      #$4, d0
078b38 lea.l      -$1e78(a3), a0
078b3c move.w     $a(a0, d0.w), d4
078b40 move.w     $2(a4), d0
078b44 lsr.w      #$8, d0
078b46 lsr.w      #$6, d0
078b48 eori.w     #$3, d0
078b4c asl.w      #$2, d0
078b4e lsr.w      d0, d4
078b50 andi.w     #$f, d4
078b54 cmp.w      #$2, d4
078b58 beq.b      $78b6a
078b5a tst.w      $2dd4(a3)
078b5e beq.b      $78b8c
078b60 cmp.w      #$1, d4
078b64 bne.b      $78b8c
078b66 move.w     #$400, d3
078b6a tst.w      $2dea(a3)
078b6e beq.b      $78b8c
078b70 move.w     $4(a4), d0
078b74 addi.w     #$200, d0
078b78 lsr.w      #$4, d0
078b7a lea.l      $2438(a3), a0
078b7e move.b     (a0, d0.w), d1
078b82 add.w      d1, d1
078b84 asl.w      #$8, d1
078b86 cmp.w      d3, d1
078b88 bmi.b      $78b8c
078b8a move.w     d1, d3
078b8c move.w     d3, $ca(a4)
078b90 move.w     $c8(a4), d0
078b94 cmp.w      d3, d0
078b96 beq.b      $78bb0
078b98 bpl.b      $78ba6
078b9a addi.w     #$200, d0
078b9e cmp.w      d3, d0
078ba0 bmi.b      $78bb0
078ba2 move.w     d3, d0
078ba4 bra.b      $78bb0
078ba6 subi.w     #$200, d0
078baa cmp.w      d3, d0
078bac bpl.b      $78bb0
078bae move.w     d3, d0
078bb0 move.w     d0, $c8(a4)
078bb4 rts        
078bb6 move.l     $8(a4), d0
078bba bsr.b      $78bca
078bbc move.w     d4, $12(a4)
078bc0 move.w     d5, $16(a4)
078bc4 move.w     d6, $14(a4)
078bc8 rts        
078bca move.l     d0, d7
078bcc swap       d7
078bce asl.w      #$4, d7
078bd0 move.w     d0, d3
078bd2 lsr.w      #$4, d3
078bd4 lea.l      -$1e78(a3), a0
078bd8 move.b     $1(a0, d7.w), d2
078bdc add.b      d2, d2
078bde ext.w      d2
078be0 muls.w     d3, d2
078be2 asr.l      #$8, d2
078be4 move.b     $d(a0, d7.w), d1
078be8 ext.w      d1
078bea asl.w      #$5, d1
078bec add.w      d1, d2
078bee neg.w      d2
078bf0 move.w     d2, d5
078bf2 move.b     (a0, d7.w), d2
078bf6 ext.w      d2
078bf8 add.w      d2, d2
078bfa move.w     d2, d4
078bfc muls.w     d3, d2
078bfe asr.l      #$8, d2
078c00 move.b     $c(a0, d7.w), d1
078c04 ext.w      d1
078c06 asl.w      #$5, d1
078c08 add.w      d1, d2
078c0a neg.w      d2
078c0c move.w     d2, d6
078c0e lsr.w      #$6, d0
078c10 lsr.w      #$8, d0
078c12 add.w      d0, d0
078c14 add.w      d0, d7
078c16 rts        
078c18 movem.l    d1/a0, -(a7)
078c1c moveq      #$0, d0
078c1e move.w     #$0, ccr
078c22 lea.l      $2f4c(a3), a0
078c26 move.l     (a0), d1
078c28 addx.l     d1, d0
078c2a move.l     #$7362541f, d1
078c30 addx.l     d1, d0
078c32 move.l     d0, (a0)+
078c34 move.l     (a0), d1
078c36 addx.l     d1, d0
078c38 move.l     #$7fbe6475, d1
078c3e addx.l     d1, d0
078c40 move.l     d0, (a0)+
078c42 move.l     (a0), d1
078c44 addx.l     d1, d0
078c46 move.l     #$83265984, d1
078c4c addx.l     d1, d0
078c4e move.l     d0, (a0)+
078c50 move.l     (a0), d1
078c52 addx.l     d1, d0
078c54 move.l     #$f0293747, d1
078c5a addx.l     d1, d0
078c5c move.l     d0, (a0)+
078c5e movem.l    (a7)+, d1/a0
078c62 rts        
078c64 movem.l    d1/a0, -(a7)
078c68 moveq      #$0, d0
078c6a move.w     #$0, ccr
078c6e lea.l      $2f5c(a3), a0
078c72 move.l     (a0), d1
078c74 addx.l     d1, d0
078c76 move.l     #$7362541f, d1
078c7c addx.l     d1, d0
078c7e move.l     d0, (a0)+
078c80 move.l     (a0), d1
078c82 addx.l     d1, d0
078c84 move.l     #$7fbe6475, d1
078c8a addx.l     d1, d0
078c8c move.l     d0, (a0)+
078c8e move.l     (a0), d1
078c90 addx.l     d1, d0
078c92 move.l     #$83265984, d1
078c98 addx.l     d1, d0
078c9a move.l     d0, (a0)+
078c9c move.l     (a0), d1
078c9e addx.l     d1, d0
078ca0 move.l     #$f0293747, d1
078ca6 addx.l     d1, d0
078ca8 move.l     d0, (a0)+
078caa movem.l    (a7)+, d1/a0
078cae rts        
078cb0 nop        
078cb2 nop        
078cb4 nop        
078cb6 nop        
078cb8 nop        
078cba nop        
078cbc nop        
078cbe nop        
078cc0 nop        
078cc2 nop        
078cc4 move.w     #$2, $9a(a6)
078cca move.w     $2f8e(a3), d0
078cce sub.w      $2f92(a3), d0
078cd2 cmp.w      #$2, d0
078cd6 bcc.b      $78ce0
078cd8 move.w     #$8002, $9a(a6)
078cde bra.b      $78cb0
078ce0 tst.w      $2f40(a3)
078ce4 beq.b      $78cf4
078ce6 tst.w      $2fda(a3)
078cea bne.b      $78cfa
078cec cmpi.w     #$2ee, $2f44(a3)
078cf2 bpl.b      $78cfa
078cf4 tst.w      $2f86(a3)
078cf8 bne.b      $78cfc
078cfa rts        
078cfc move.w     #$40, $9a(a6)
078d02 move.w     $2f8e(a3), $2f92(a3)
078d08 move.w     $2f4a(a3), d1
078d0c addq.w     #$1, d1
078d0e cmp.w      #$3, d1
078d12 bne.b      $78d16
078d14 moveq      #$0, d1
078d16 move.w     d1, $2f4a(a3)
078d1a tst.w      d1
078d1c beq.b      $78d36
078d1e cmp.w      #$1, d1
078d22 beq.b      $78d48
078d24 move.l     #$9b42, $2f78(a3)
078d2c move.l     #$11e84, $2f74(a3)
078d34 bra.b      $78d58
078d36 move.l     #$11e84, $2f78(a3)
078d3e move.l     #$1800, $2f74(a3)
078d46 bra.b      $78d58
078d48 move.l     #$1800, $2f78(a3)
078d50 move.l     #$9b42, $2f74(a3)
078d58 lea.l      $300e(a3), a1
078d5c move.w     $3020(a3), d1
078d60 subq.w     #$1, d1
078d62 andi.w     #$7, d1
078d66 add.w      d1, d1
078d68 add.w      (a1, d1.w), d0
078d6c move.w     $3020(a3), d1
078d70 add.w      d1, d1
078d72 move.w     d0, (a1, d1.w)
078d76 addq.w     #$1, $3020(a3)
078d7a andi.w     #$7, $3020(a3)
078d80 clr.w      $2f90(a3)
078d84 move.l     $2f30(a3), d0
078d88 move.l     $2f2c(a3), $2f30(a3)
078d8e move.l     d0, $2f2c(a3)
078d92 lea.l      $303e(a3), a4
078d96 move.l     $56(a4), $62(a4)
078d9c move.w     $5a(a4), $66(a4)
078da2 move.l     $4e(a4), $7c(a4)
078da8 move.l     $52(a4), $80(a4)
078dae move.w     $60(a4), $78(a4)
078db4 move.w     $5c(a4), $8e(a4)
078dba move.w     $5e(a4), $8c(a4)
078dc0 lea.l      $3112(a3), a4
078dc4 move.l     $56(a4), $62(a4)
078dca move.w     $5a(a4), $66(a4)
078dd0 move.l     $4e(a4), $7c(a4)
078dd6 move.l     $52(a4), $80(a4)
078ddc move.w     $60(a4), $78(a4)
078de2 move.w     $5c(a4), $8e(a4)
078de8 move.w     $5e(a4), $8c(a4)
078dee move.l     $2e2a(a3), $2e4a(a3)
078df4 move.l     $2e2e(a3), $2e4e(a3)
078dfa move.l     $2e32(a3), $2e52(a3)
078e00 move.l     $2e36(a3), $2e56(a3)
078e06 lea.l      $2dee(a3), a0
078e0a lea.l      -$4098(a3), a1
078e0e move.l     (a0)+, (a1)+
078e10 move.w     (a0)+, (a1)+
078e12 addq.w     #$2, a1
078e14 move.l     (a0)+, (a1)+
078e16 move.w     (a0)+, (a1)+
078e18 addq.w     #$2, a1
078e1a move.l     (a0)+, (a1)+
078e1c move.w     (a0)+, (a1)+
078e1e addq.w     #$2, a1
078e20 move.l     (a0)+, (a1)+
078e22 move.w     (a0)+, (a1)+
078e24 addq.w     #$2, a1
078e26 move.l     (a0)+, (a1)+
078e28 move.w     (a0)+, (a1)+
078e2a addq.w     #$2, a1
078e2c move.l     (a0)+, (a1)+
078e2e move.w     (a0)+, (a1)+
078e30 addq.w     #$2, a1
078e32 move.l     (a0)+, (a1)+
078e34 move.w     (a0)+, (a1)+
078e36 addq.w     #$2, a1
078e38 move.l     (a0)+, (a1)+
078e3a move.w     (a0)+, (a1)+
078e3c addq.w     #$2, a1
078e3e move.l     (a0)+, (a1)+
078e40 move.w     (a0)+, (a1)+
078e42 addq.w     #$2, a1
078e44 move.l     (a0)+, (a1)+
078e46 move.w     (a0)+, (a1)+
078e48 move.w     #$8002, $9a(a6)
078e4e tst.w      $2f2a(a3)
078e52 beq.b      $78e6a
078e54 move.l     #$ffffffff, $44(a6)
078e5c bsr.w      $793b0
078e60 tst.w      $3038(a3)
078e64 beq.b      $78e6a
078e66 bsr.w      $793fa
078e6a lea.l      $303e(a3), a4
078e6e move.l     $62(a4), $84(a4)
078e74 move.w     $66(a4), $88(a4)
078e7a lea.l      $3112(a3), a4
078e7e move.l     $62(a4), $84(a4)
078e84 move.w     $66(a4), $88(a4)
078e8a move.w     #$1, $2f2a(a3)
078e90 movea.l    $2f30(a3), a5
078e94 move.w     $3038(a3), $2ef6(a3)
078e9a lea.l      $7cfe4(pc), a0
078e9e move.l     a0, $6c.w
078ea2 move.w     #$40, $9c(a6)
078ea8 move.w     #$8040, $9a(a6)
078eae move.w     #$8040, $9c(a6)
078eb4 addq.w     #$1, $2f3e(a3)
078eb8 tst.w      $3038(a3)
078ebc beq.b      $78f24
078ebe bsr.w      $79708
078ec2 bsr.w      $79ec6
078ec6 bsr.w      $7a27a
078eca bsr.w      $7a356
078ece bsr.w      $7938e
078ed2 movea.l    $2f2c(a3), a4
078ed6 bsr.w      $7a3d4
078eda bsr.w      $7b09c
078ede bsr.w      $7b9fe
078ee2 clr.w      (a4)+
078ee4 bsr.w      $7aa10
078ee8 bsr.w      $7af10
078eec move.l     a4, -(a7)
078eee bsr.w      $78f60
078ef2 bsr.w      $79776
078ef6 bsr.w      $79eda
078efa bsr.w      $7a28c
078efe bsr.w      $7a35e
078f02 bsr.w      $793da
078f06 movea.l    (a7)+, a4
078f08 bsr.w      $7a4f4
078f0c bsr.w      $7b4d8
078f10 bsr.w      $7b9fe
078f14 clr.w      (a4)+
078f16 bsr.w      $7aaa4
078f1a bsr.w      $7af1c
078f1e bsr.w      $79058
078f22 bra.b      $78f56
078f24 bsr.w      $79708
078f28 bsr.w      $79ec6
078f2c bsr.w      $7a27a
078f30 bsr.w      $7a356
078f34 bsr.w      $7938e
078f38 movea.l    $2f2c(a3), a4
078f3c bsr.w      $7a3d4
078f40 bsr.w      $7b09c
078f44 bsr.w      $7b9fe
078f48 clr.w      (a4)+
078f4a bsr.w      $7aa10
078f4e bsr.w      $7af10
078f52 bsr.w      $78f60
078f56 tst.w      $2f90(a3)
078f5a beq.b      $78f56
078f5c bra.w      $78cb0
078f60 moveq      #$0, d3
078f62 move.w     $3066(a3), d0
078f66 cmp.w      $2e5e(a3), d0
078f6a beq.b      $78f74
078f6c move.w     d0, $2e5e(a3)
078f70 bsr.w      $79314
078f74 move.w     $305e(a3), d0
078f78 cmp.w      $2e60(a3), d0
078f7c beq.b      $78f86
078f7e move.w     d0, $2e60(a3)
078f82 bsr.w      $79152
078f86 move.w     $304c(a3), d0
078f8a move.w     d0, d1
078f8c add.w      d1, d0
078f8e add.w      d1, d0
078f90 lsr.w      #$7, d0
078f92 cmp.w      $2e64(a3), d0
078f96 beq.b      $78fa0
078f98 move.w     d0, $2e64(a3)
078f9c bsr.w      $791c2
078fa0 move.w     $306a(a3), d0
078fa4 lsr.w      #$7, d0
078fa6 cmp.w      #$2e, d0
078faa bcs.b      $78fae
078fac moveq      #$2e, d0
078fae cmp.w      $2e62(a3), d0
078fb2 beq.b      $78fbc
078fb4 move.w     d0, $2e62(a3)
078fb8 bsr.w      $79342
078fbc move.l     $306c(a3), d0
078fc0 cmp.l      $2e66(a3), d0
078fc4 beq.b      $78fd2
078fc6 move.l     d0, $2e66(a3)
078fca lea.l      $2e70(a3), a4
078fce bsr.w      $7919c
078fd2 lea.l      $64a84.l, a2
078fd8 tst.w      $3038(a3)
078fdc beq.b      $79002
078fde move.l     $3112(a3), d0
078fe2 sub.l      $303e(a3), d0
078fe6 bsr.w      $792a4
078fea cmp.w      $2e6a(a3), d0
078fee beq.b      $78ffe
078ff0 move.w     d0, $2e6a(a3)
078ff4 move.w     $2ed8(a3), d1
078ff8 movea.l    a2, a0
078ffa bsr.w      $792c4
078ffe adda.w     #$18, a2
079002 tst.w      $303a(a3)
079006 beq.b      $79056
079008 move.l     $2e3a(a3), d0
07900c sub.l      $303e(a3), d0
079010 bsr.w      $792a4
079014 cmp.w      $2e6c(a3), d0
079018 beq.b      $79028
07901a move.w     d0, $2e6c(a3)
07901e move.w     $2eda(a3), d1
079022 movea.l    a2, a0
079024 bsr.w      $792c4
079028 adda.w     #$18, a2
07902c tst.w      $2dbc(a3)
079030 beq.b      $79056
079032 move.l     $2e42(a3), d0
079036 sub.l      $303e(a3), d0
07903a bsr.w      $792a4
07903e cmp.w      $2e6e(a3), d0
079042 beq.b      $79052
079044 move.w     d0, $2e6e(a3)
079048 move.w     $2edc(a3), d1
07904c movea.l    a2, a0
07904e bsr.w      $792c4
079052 adda.w     #$18, a2
079056 rts        
079058 move.w     #$f990, d3
07905c move.w     $313a(a3), d0
079060 cmp.w      $2e78(a3), d0
079064 beq.b      $7906e
079066 move.w     d0, $2e78(a3)
07906a bsr.w      $79314
07906e move.w     $3132(a3), d0
079072 cmp.w      $2e7a(a3), d0
079076 beq.b      $79080
079078 move.w     d0, $2e7a(a3)
07907c bsr.w      $79152
079080 move.w     $3120(a3), d0
079084 move.w     d0, d1
079086 add.w      d1, d0
079088 add.w      d1, d0
07908a lsr.w      #$7, d0
07908c cmp.w      $2e7e(a3), d0
079090 beq.b      $7909a
079092 move.w     d0, $2e7e(a3)
079096 bsr.w      $791c2
07909a move.w     $313e(a3), d0
07909e lsr.w      #$7, d0
0790a0 cmp.w      #$2e, d0
0790a4 bcs.b      $790a8
0790a6 moveq      #$2e, d0
0790a8 cmp.w      $2e7c(a3), d0
0790ac beq.b      $790b6
0790ae move.w     d0, $2e7c(a3)
0790b2 bsr.w      $79342
0790b6 move.l     $3140(a3), d0
0790ba cmp.l      $2e80(a3), d0
0790be beq.b      $790cc
0790c0 move.l     d0, $2e80(a3)
0790c4 lea.l      $2e8a(a3), a4
0790c8 bsr.w      $7919c
0790cc lea.l      $64a84.l, a2
0790d2 tst.w      $3038(a3)
0790d6 beq.b      $790fc
0790d8 move.l     $303e(a3), d0
0790dc sub.l      $3112(a3), d0
0790e0 bsr.w      $792a4
0790e4 cmp.w      $2e84(a3), d0
0790e8 beq.b      $790f8
0790ea move.w     d0, $2e84(a3)
0790ee move.w     $2ed6(a3), d1
0790f2 movea.l    a2, a0
0790f4 bsr.w      $792c4
0790f8 adda.w     #$18, a2
0790fc tst.w      $303a(a3)
079100 beq.b      $79150
079102 move.l     $2e3a(a3), d0
079106 sub.l      $3112(a3), d0
07910a bsr.w      $792a4
07910e cmp.w      $2e86(a3), d0
079112 beq.b      $79122
079114 move.w     d0, $2e86(a3)
079118 move.w     $2eda(a3), d1
07911c movea.l    a2, a0
07911e bsr.w      $792c4
079122 adda.w     #$18, a2
079126 tst.w      $2dbc(a3)
07912a beq.b      $79150
07912c move.l     $2e42(a3), d0
079130 sub.l      $3112(a3), d0
079134 bsr.w      $792a4
079138 cmp.w      $2e88(a3), d0
07913c beq.b      $7914c
07913e move.w     d0, $2e88(a3)
079142 move.w     $2edc(a3), d1
079146 movea.l    a2, a0
079148 bsr.w      $792c4
07914c adda.w     #$18, a2
079150 rts        
079152 lea.l      $64cb6.l, a0
079158 adda.w     d3, a0
07915a ext.l      d0
07915c divu.w     #$a, d0
079160 asl.w      #$5, d0
079162 lea.l      $3376(a3), a1
079166 adda.w     d0, a1
079168 bsr.b      $7917a
07916a addq.w     #$2, a0
07916c swap       d0
07916e asl.w      #$5, d0
079170 lea.l      $3376(a3), a1
079174 adda.w     d0, a1
079176 bsr.b      $7917a
079178 rts        
07917a moveq      #$f, d7
07917c move.w     $3c0(a1), $c0(a0)
079182 move.w     $280(a1), $80(a0)
079188 move.w     $140(a1), $40(a0)
07918e move.w     (a1)+, (a0)
079190 addq.w     #$4, a0
079192 dbra       d7, $7917c
079196 suba.w     #$40, a0
07919a rts        
07919c bsr.w      $7542a
0791a0 lea.l      $64846.l, a0
0791a6 adda.w     d3, a0
0791a8 lea.l      $2d1e(a3), a2
0791ac moveq      #$0, d0
0791ae moveq      #$7, d5
0791b0 move.b     (a2)+, d0
0791b2 cmp.b      (a4), d0
0791b4 beq.b      $791b8
0791b6 bsr.b      $791ea
0791b8 move.b     d0, (a4)+
0791ba addq.w     #$1, a0
0791bc dbra       d5, $791b0
0791c0 rts        
0791c2 ext.l      d0
0791c4 lea.l      $64748.l, a0
0791ca adda.w     d3, a0
0791cc divu.w     #$a, d0
0791d0 swap       d0
0791d2 bsr.b      $791ea
0791d4 subq.w     #$1, a0
0791d6 swap       d0
0791d8 ext.l      d0
0791da divu.w     #$a, d0
0791de swap       d0
0791e0 bsr.b      $791ea
0791e2 subq.w     #$1, a0
0791e4 swap       d0
0791e6 bsr.b      $791ea
0791e8 rts        
0791ea move.w     d0, d1
0791ec asl.w      #$3, d1
0791ee lea.l      $3236(a3), a1
0791f2 adda.w     d1, a1
0791f4 move.b     $f0(a1), $c0(a0)
0791fa move.b     $a0(a1), $80(a0)
079200 move.b     $50(a1), $40(a0)
079206 move.b     (a1)+, (a0)
079208 move.b     $f0(a1), $c8(a0)
07920e move.b     $a0(a1), $88(a0)
079214 move.b     $50(a1), $48(a0)
07921a move.b     (a1)+, $8(a0)
07921e move.b     $f0(a1), $d0(a0)
079224 move.b     $a0(a1), $90(a0)
07922a move.b     $50(a1), $50(a0)
079230 move.b     (a1)+, $10(a0)
079234 move.b     $f0(a1), $d8(a0)
07923a move.b     $a0(a1), $98(a0)
079240 move.b     $50(a1), $58(a0)
079246 move.b     (a1)+, $18(a0)
07924a move.b     $f0(a1), $e0(a0)
079250 move.b     $a0(a1), $a0(a0)
079256 move.b     $50(a1), $60(a0)
07925c move.b     (a1)+, $20(a0)
079260 move.b     $f0(a1), $e8(a0)
079266 move.b     $a0(a1), $a8(a0)
07926c move.b     $50(a1), $68(a0)
079272 move.b     (a1)+, $28(a0)
079276 move.b     $f0(a1), $f0(a0)
07927c move.b     $a0(a1), $b0(a0)
079282 move.b     $50(a1), $70(a0)
079288 move.b     (a1)+, $30(a0)
07928c move.b     $f0(a1), $f8(a0)
079292 move.b     $a0(a1), $b8(a0)
079298 move.b     $50(a1), $78(a0)
07929e move.b     (a1)+, $38(a0)
0792a2 rts        
0792a4 tst.l      d0
0792a6 beq.b      $792b2
0792a8 swap       d0
0792aa asr.w      #$1, d0
0792ac tst.w      d0
0792ae bmi.b      $792b2
0792b0 addq.w     #$1, d0
0792b2 addi.w     #$17, d0
0792b6 bpl.b      $792ba
0792b8 moveq      #$0, d0
0792ba cmp.w      #$2d, d0
0792be bmi.b      $792c2
0792c0 moveq      #$2d, d0
0792c2 rts        
0792c4 lea.l      $3e90(a3), a1
0792c8 andi.w     #$2, d1
0792cc bne.b      $792d2
0792ce adda.w     #$114, a1
0792d2 move.w     d0, d1
0792d4 add.w      d1, d0
0792d6 add.w      d1, d0
0792d8 add.w      d0, d0
0792da adda.w     d0, a1
0792dc adda.w     d3, a0
0792de moveq      #$2, d7
0792e0 move.l     (a1), (a0)
0792e2 move.w     $4(a1), $4(a0)
0792e8 move.l     $342(a1), $4e(a0)
0792ee move.w     $346(a1), $52(a0)
0792f4 move.l     $684(a1), $9c(a0)
0792fa move.w     $688(a1), $a0(a0)
079300 move.l     $9c6(a1), $ea(a0)
079306 move.w     $9ca(a1), $ee(a0)
07930c addq.w     #$6, a0
07930e dbra       d7, $792e0
079312 rts        
079314 lea.l      $64bb6.l, a0
07931a adda.w     d3, a0
07931c asl.w      #$6, d0
07931e lea.l      $3876(a3), a1
079322 adda.w     d0, a1
079324 moveq      #$f, d7
079326 move.l     $3c0(a1), $c0(a0)
07932c move.l     $280(a1), $80(a0)
079332 move.l     $140(a1), $40(a0)
079338 move.l     (a1)+, (a0)
07933a addq.w     #$4, a0
07933c dbra       d7, $79326
079340 rts        
079342 lea.l      $6494c.l, a0
079348 move.w     d0, d1
07934a add.w      d1, d0
07934c add.w      d1, d0
07934e add.w      d0, d0
079350 lea.l      $3d76(a3), a1
079354 adda.w     d0, a1
079356 adda.w     d3, a0
079358 moveq      #$a, d7
07935a move.l     (a1), (a0)
07935c move.w     $4(a1), $4(a0)
079362 move.l     $342(a1), $4e(a0)
079368 move.w     $346(a1), $52(a0)
07936e move.l     $684(a1), $9c(a0)
079374 move.w     $688(a1), $a0(a0)
07937a move.l     $9c6(a1), $ea(a0)
079380 move.w     $9ca(a1), $ee(a0)
079386 addq.w     #$6, a0
079388 dbra       d7, $7935a
07938c rts        
07938e lea.l      -$2bd8(a3), a4
079392 move.w     $30c6(a3), d4
079396 move.w     $30ce(a3), d1
07939a move.w     $30f4(a3), d0
07939e bsr.w      $79428
0793a2 addi.w     #$a0, d3
0793a6 move.w     d3, $2e9e(a3)
0793aa move.w     d2, $2ea2(a3)
0793ae rts        
0793b0 movea.l    $2f78(a3), a0
0793b4 lea.l      -$2bd8(a3), a4
0793b8 lea.l      -$4180(a3), a2
0793bc move.w     $30c6(a3), d4
0793c0 move.l     $30c2(a3), d5
0793c4 move.w     $30ce(a3), d1
0793c8 move.w     $30d6(a3), d2
0793cc move.w     #$2c, d6
0793d0 bsr.w      $79546
0793d4 move.w     d0, $2e9a(a3)
0793d8 rts        
0793da lea.l      -$2728(a3), a4
0793de move.w     $319a(a3), d4
0793e2 move.w     $31a2(a3), d1
0793e6 move.w     $31c8(a3), d0
0793ea bsr.b      $79428
0793ec addi.w     #$a0, d3
0793f0 move.w     d3, $2ea0(a3)
0793f4 move.w     d2, $2ea4(a3)
0793f8 rts        
0793fa movea.l    $2f78(a3), a0
0793fe adda.w     #$fc0, a0
079402 lea.l      -$2728(a3), a4
079406 lea.l      -$4130(a3), a2
07940a move.w     $319a(a3), d4
07940e move.l     $3196(a3), d5
079412 move.w     $31a2(a3), d1
079416 move.w     $31aa(a3), d2
07941a move.w     #$94, d6
07941e bsr.w      $79546
079422 move.w     d0, $2e9c(a3)
079426 rts        
079428 lea.l      -$4048(a3), a1
07942c move.w     d1, d7
07942e add.w      d1, d1
079430 adda.w     d1, a4
079432 adda.w     d1, a4
079434 adda.w     d1, a4
079436 move.w     #$7fff, d2
07943a asl.w      #$3, d4
07943c tst.w      $2dd8(a3)
079440 beq.w      $79514
079444 cmp.w      #$2, d0
079448 beq.w      $794d0
07944c tst.w      d0
07944e beq.w      $79514
079452 bpl.b      $79494
079454 move.w     #$1000, d3
079458 move.w     (a4)+, d0
07945a move.w     (a4)+, d1
07945c addq.w     #$2, a4
07945e move.w     d1, d5
079460 lsr.w      #$4, d5
079462 move.w     d5, -$4(a4)
079466 add.w      d1, d1
079468 add.w      d4, d0
07946a neg.w      d0
07946c muls.w     d0, d1
07946e swap       d1
079470 add.w      d5, d5
079472 move.w     (a1, d5.w), d5
079476 add.w      d5, d1
079478 cmp.w      d3, d1
07947a bpl.b      $79482
07947c move.w     d1, d3
07947e move.w     -$2(a4), d2
079482 sub.w      d5, d1
079484 sub.w      d5, d1
079486 move.w     d1, -$6(a4)
07948a addq.w     #$1, d7
07948c cmp.w      $2e94(a3), d7
079490 bne.b      $79458
079492 rts        
079494 move.w     #$f000, d3
079498 move.w     (a4)+, d0
07949a move.w     (a4)+, d1
07949c addq.w     #$2, a4
07949e move.w     d1, d5
0794a0 lsr.w      #$4, d5
0794a2 move.w     d5, -$4(a4)
0794a6 add.w      d1, d1
0794a8 add.w      d4, d0
0794aa neg.w      d0
0794ac muls.w     d0, d1
0794ae swap       d1
0794b0 add.w      d5, d5
0794b2 move.w     (a1, d5.w), d5
0794b6 sub.w      d5, d1
0794b8 cmp.w      d3, d1
0794ba bmi.b      $794c2
0794bc move.w     d1, d3
0794be move.w     -$2(a4), d2
0794c2 move.w     d1, -$6(a4)
0794c6 addq.w     #$1, d7
0794c8 cmp.w      $2e94(a3), d7
0794cc bne.b      $79498
0794ce rts        
0794d0 moveq      #$0, d3
0794d2 move.w     (a4)+, d0
0794d4 move.w     (a4)+, d1
0794d6 addq.w     #$2, a4
0794d8 move.w     d1, d5
0794da lsr.w      #$4, d5
0794dc move.w     d5, -$4(a4)
0794e0 add.w      d1, d1
0794e2 add.w      d4, d0
0794e4 neg.w      d0
0794e6 muls.w     d0, d1
0794e8 swap       d1
0794ea add.w      d5, d5
0794ec move.w     (a1, d5.w), d5
0794f0 move.w     -$4(a4), d0
0794f4 lsr.w      #$1, d0
0794f6 neg.w      d0
0794f8 add.w      d7, d0
0794fa cmp.w      d3, d0
0794fc bmi.b      $79504
0794fe move.w     d0, d3
079500 move.w     -$2(a4), d2
079504 sub.w      d5, d1
079506 move.w     d1, -$6(a4)
07950a addq.w     #$1, d7
07950c cmp.w      $2e94(a3), d7
079510 bne.b      $794d2
079512 rts        
079514 move.w     (a4)+, d0
079516 move.w     (a4)+, d1
079518 addq.w     #$2, a4
07951a move.w     d1, d5
07951c lsr.w      #$4, d5
07951e move.w     d5, -$4(a4)
079522 add.w      d1, d1
079524 add.w      d4, d0
079526 neg.w      d0
079528 muls.w     d0, d1
07952a swap       d1
07952c add.w      d5, d5
07952e move.w     (a1, d5.w), d5
079532 sub.w      d5, d1
079534 move.w     d1, -$6(a4)
079538 addq.w     #$1, d7
07953a cmp.w      $2e94(a3), d7
07953e bne.b      $79514
079540 move.w     #$ff, d2
079544 rts        
079546 move.l     a2, -(a7)
079548 move.l     d5, d0
07954a asl.l      #$2, d0
07954c swap       d0
07954e move.w     d0, $2e92(a3)
079552 adda.l     #$41a0, a0
079558 ror.w      #$4, d5
07955a andi.w     #$3ff, d5
07955e move.w     d5, d3
079560 moveq      #$40, d5
079562 tst.w      $2dda(a3)
079566 bne.b      $7956a
079568 moveq      #$0, d5
07956a add.w      d6, d2
07956c move.b     d2, (a2)+
07956e move.b     d5, (a2)+
079570 move.w     #$0, $42(a6)
079576 move.w     #$20a6, $66(a6)
07957c move.l     $2d02(a3), d0
079580 subi.w     #$2a, d0
079584 move.w     d0, $64(a6)
079588 lea.l      $4e7e(a3), a5
07958c move.w     d1, d7
07958e add.w      d1, d1
079590 adda.w     d1, a4
079592 adda.w     d1, a4
079594 adda.w     d1, a4
079596 mulu.w     #$15, d1
07959a adda.w     d1, a0
07959c asl.w      #$3, d4
07959e move.l     a0, -(a7)
0795a0 lea.l      -$3d8e(a3), a0
0795a4 lea.l      -$1e6e(a3), a1
0795a8 move.w     $2e92(a3), d2
0795ac asl.w      #$2, d2
0795ae andi.w     #$fff0, d2
0795b2 adda.w     d2, a1
0795b4 moveq      #$8, d0
0795b6 move.b     (a1)+, d2
0795b8 add.b      d2, d2
0795ba addq.b     #$1, d2
0795bc move.b     d2, d1
0795be lsr.b      #$4, d1
0795c0 move.b     d1, (a0)+
0795c2 move.b     d2, (a0)+
0795c4 move.b     (a1), d2
0795c6 add.b      d2, d2
0795c8 addq.b     #$1, d2
0795ca move.b     d2, d1
0795cc lsr.b      #$4, d1
0795ce move.b     d1, (a0)+
0795d0 move.b     d2, (a0)+
0795d2 adda.w     #$f, a1
0795d6 dbra       d0, $795b6
0795da move.w     $2e92(a3), d0
0795de andi.w     #$3, d0
0795e2 move.w     d0, $2e92(a3)
0795e6 movea.l    (a7)+, a0
0795e8 tst.w      $2dda(a3)
0795ec bne.w      $79672
0795f0 move.w     (a4)+, d1
0795f2 neg.w      d1
0795f4 addi.w     #$b1, d1
0795f8 move.w     (a4)+, d0
0795fa move.w     (a4)+, d2
0795fc add.w      d3, d2
0795fe bpl.b      $79604
079600 move.w     #$7fff, d2
079604 asr.w      #$8, d2
079606 asr.w      #$2, d2
079608 add.w      $2e92(a3), d2
07960c lea.l      -$3d8e(a3), a1
079610 move.b     (a1, d2.w), d2
079614 andi.b     #$f, d2
079618 cmp.b      d2, d5
07961a beq.b      $79626
07961c move.b     d2, d5
07961e move.b     d7, (a2)+
079620 add.b      d6, -$1(a2)
079624 move.b     d2, (a2)+
079626 asl.w      #$2, d0
079628 movea.l    (a5, d0.w), a1
07962c move.w     d1, d0
07962e add.w      d0, d0
079630 andi.w     #$1e, d0
079634 asr.w      #$3, d1
079636 adda.w     d1, a1
079638 btst.b     #$e, $2(a6)
07963e bne.b      $79638
079640 move.l     a0, $54(a6)
079644 move.l     a1, $50(a6)
079648 lea.l      $7cfc4(pc), a1
07964c move.w     (a1, d0.w), $40(a6)
079652 move.w     #$95, $58(a6)
079658 adda.w     #$2a, a0
07965c addq.w     #$1, d7
07965e cmp.w      $2e94(a3), d7
079662 bne.b      $795f0
079664 suba.l     (a7)+, a2
079666 move.l     a2, d0
079668 btst.b     #$e, $2(a6)
07966e bne.b      $79668
079670 rts        
079672 move.w     (a4)+, d1
079674 neg.w      d1
079676 addi.w     #$b1, d1
07967a move.w     (a4)+, d0
07967c move.w     (a4)+, d2
07967e add.w      d3, d2
079680 bpl.b      $79686
079682 move.w     #$7fff, d2
079686 move.w     d2, d4
079688 lsr.w      #$7, d4
07968a andi.w     #$fff8, d4
07968e cmp.w      #$40, d4
079692 bmi.b      $79696
079694 moveq      #$40, d4
079696 asr.w      #$8, d2
079698 asr.w      #$2, d2
07969a add.w      $2e92(a3), d2
07969e lea.l      -$3d8e(a3), a1
0796a2 move.b     (a1, d2.w), d2
0796a6 andi.b     #$f, d2
0796aa add.b      d4, d2
0796ac cmp.b      d2, d5
0796ae beq.b      $796ba
0796b0 move.b     d2, d5
0796b2 move.b     d7, (a2)+
0796b4 add.b      d6, -$1(a2)
0796b8 move.b     d2, (a2)+
0796ba asl.w      #$2, d0
0796bc movea.l    (a5, d0.w), a1
0796c0 move.w     d1, d0
0796c2 add.w      d0, d0
0796c4 andi.w     #$1e, d0
0796c8 asr.w      #$3, d1
0796ca adda.w     d1, a1
0796cc btst.b     #$e, $2(a6)
0796d2 bne.b      $796cc
0796d4 move.l     a0, $54(a6)
0796d8 move.l     a1, $50(a6)
0796dc lea.l      $7cfc4(pc), a1
0796e0 move.w     (a1, d0.w), $40(a6)
0796e6 move.w     #$95, $58(a6)
0796ec adda.w     #$2a, a0
0796f0 addq.w     #$1, d7
0796f2 cmp.w      $2e94(a3), d7
0796f6 bne.w      $79672
0796fa suba.l     (a7)+, a2
0796fc move.l     a2, d0
0796fe btst.b     #$e, $2(a6)
079704 bne.b      $796fe
079706 rts        
079708 move.w     $2f4a(a3), d0
07970c beq.b      $7972e
07970e cmp.w      #$1, d0
079712 beq.b      $79748
079714 lea.l      $7edf2.l, a0
07971a lea.l      $7ef8e.l, a1
079720 lea.l      $7ede2.l, a2
079726 move.l     #$7ef82, d0
07972c bra.b      $79760
07972e lea.l      $7f6d6.l, a0
079734 lea.l      $7f872.l, a1
07973a lea.l      $7f6c6.l, a2
079740 move.l     #$7f866, d0
079746 bra.b      $79760
079748 lea.l      $7e50e.l, a0
07974e lea.l      $7e6aa.l, a1
079754 lea.l      $7e4fe.l, a2
07975a move.l     #$7e69e, d0
079760 lea.l      -$4180(a3), a4
079764 move.w     $2e9a(a3), d4
079768 move.w     $30e4(a3), d5
07976c move.w     $30d6(a3), d6
079770 move.w     #$2c, d7
079774 bra.b      $797e2
079776 move.w     $2f4a(a3), d0
07977a beq.b      $7979c
07977c cmp.w      #$1, d0
079780 beq.b      $797b6
079782 lea.l      $7f206.l, a0
079788 lea.l      $7f3a2.l, a1
07978e lea.l      $7f1f2.l, a2
079794 move.l     #$7f396, d0
07979a bra.b      $797ce
07979c lea.l      $7faea.l, a0
0797a2 lea.l      $7fc86.l, a1
0797a8 lea.l      $7fad6.l, a2
0797ae move.l     #$7fc7a, d0
0797b4 bra.b      $797ce
0797b6 lea.l      $7e922.l, a0
0797bc lea.l      $7eabe.l, a1
0797c2 lea.l      $7e90e.l, a2
0797c8 move.l     #$7eab2, d0
0797ce lea.l      -$4130(a3), a4
0797d2 move.w     $2e9c(a3), d4
0797d6 move.w     $31b8(a3), d5
0797da move.w     $31aa(a3), d6
0797de move.w     #$94, d7
0797e2 move.l     d0, -(a7)
0797e4 tst.w      d6
0797e6 bne.b      $797f6
0797e8 move.w     d0, $6(a2)
0797ec swap       d0
0797ee move.w     d0, $2(a2)
0797f2 bra.w      $79a54
0797f6 move.l     a4, -(a7)
0797f8 move.w     d4, -(a7)
0797fa move.w     d5, d0
0797fc asr.w      #$1, d0
0797fe neg.w      d0
079800 add.w      $2e94(a3), d0
079804 subi.w     #$38, d0
079808 move.w     d0, d1
07980a andi.w     #$3, d1
07980e beq.b      $79812
079810 subq.w     #$4, d1
079812 move.w     d6, d2
079814 sub.w      d1, d2
079816 addq.w     #$3, d2
079818 lsr.w      #$2, d2
07981a moveq      #$32, d3
07981c sub.w      d2, d3
07981e asl.w      #$3, d3
079820 adda.w     d3, a0
079822 move.l     a0, d3
079824 move.w     d3, $6(a2)
079828 swap       d3
07982a move.w     d3, $2(a2)
07982e addq.w     #$3, d0
079830 lsr.w      #$2, d0
079832 neg.w      d0
079834 addi.w     #$4a, d0
079838 bpl.b      $7983c
07983a moveq      #$0, d0
07983c movea.l    $2c74(a3), a4
079840 adda.w     d0, a4
079842 adda.w     d0, a4
079844 add.w      d7, d1
079846 moveq      #$32, d3
079848 sub.w      d2, d3
07984a move.w     d3, d0
07984c add.w      d0, d0
07984e add.w      d0, d0
079850 add.w      d3, d0
079852 add.w      d0, d0
079854 lea.l      $7985c(pc), a2
079858 adda.w     d0, a2
07985a jmp        (a2)
07985c move.b     d1, (a0)
07985e move.w     (a4)+, $6(a0)
079862 addq.w     #$8, a0
079864 addq.w     #$4, d1
079866 move.b     d1, (a0)
079868 move.w     (a4)+, $6(a0)
07986c addq.w     #$8, a0
07986e addq.w     #$4, d1
079870 move.b     d1, (a0)
079872 move.w     (a4)+, $6(a0)
079876 addq.w     #$8, a0
079878 addq.w     #$4, d1
07987a move.b     d1, (a0)
07987c move.w     (a4)+, $6(a0)
079880 addq.w     #$8, a0
079882 addq.w     #$4, d1
079884 move.b     d1, (a0)
079886 move.w     (a4)+, $6(a0)
07988a addq.w     #$8, a0
07988c addq.w     #$4, d1
07988e move.b     d1, (a0)
079890 move.w     (a4)+, $6(a0)
079894 addq.w     #$8, a0
079896 addq.w     #$4, d1
079898 move.b     d1, (a0)
07989a move.w     (a4)+, $6(a0)
07989e addq.w     #$8, a0
0798a0 addq.w     #$4, d1
0798a2 move.b     d1, (a0)
0798a4 move.w     (a4)+, $6(a0)
0798a8 addq.w     #$8, a0
0798aa addq.w     #$4, d1
0798ac move.b     d1, (a0)
0798ae move.w     (a4)+, $6(a0)
0798b2 addq.w     #$8, a0
0798b4 addq.w     #$4, d1
0798b6 move.b     d1, (a0)
0798b8 move.w     (a4)+, $6(a0)
0798bc addq.w     #$8, a0
0798be addq.w     #$4, d1
0798c0 move.b     d1, (a0)
0798c2 move.w     (a4)+, $6(a0)
0798c6 addq.w     #$8, a0
0798c8 addq.w     #$4, d1
0798ca move.b     d1, (a0)
0798cc move.w     (a4)+, $6(a0)
0798d0 addq.w     #$8, a0
0798d2 addq.w     #$4, d1
0798d4 move.b     d1, (a0)
0798d6 move.w     (a4)+, $6(a0)
0798da addq.w     #$8, a0
0798dc addq.w     #$4, d1
0798de move.b     d1, (a0)
0798e0 move.w     (a4)+, $6(a0)
0798e4 addq.w     #$8, a0
0798e6 addq.w     #$4, d1
0798e8 move.b     d1, (a0)
0798ea move.w     (a4)+, $6(a0)
0798ee addq.w     #$8, a0
0798f0 addq.w     #$4, d1
0798f2 move.b     d1, (a0)
0798f4 move.w     (a4)+, $6(a0)
0798f8 addq.w     #$8, a0
0798fa addq.w     #$4, d1
0798fc move.b     d1, (a0)
0798fe move.w     (a4)+, $6(a0)
079902 addq.w     #$8, a0
079904 addq.w     #$4, d1
079906 move.b     d1, (a0)
079908 move.w     (a4)+, $6(a0)
07990c addq.w     #$8, a0
07990e addq.w     #$4, d1
079910 move.b     d1, (a0)
079912 move.w     (a4)+, $6(a0)
079916 addq.w     #$8, a0
079918 addq.w     #$4, d1
07991a move.b     d1, (a0)
07991c move.w     (a4)+, $6(a0)
079920 addq.w     #$8, a0
079922 addq.w     #$4, d1
079924 move.b     d1, (a0)
079926 move.w     (a4)+, $6(a0)
07992a addq.w     #$8, a0
07992c addq.w     #$4, d1
07992e move.b     d1, (a0)
079930 move.w     (a4)+, $6(a0)
079934 addq.w     #$8, a0
079936 addq.w     #$4, d1
079938 move.b     d1, (a0)
07993a move.w     (a4)+, $6(a0)
07993e addq.w     #$8, a0
079940 addq.w     #$4, d1
079942 move.b     d1, (a0)
079944 move.w     (a4)+, $6(a0)
079948 addq.w     #$8, a0
07994a addq.w     #$4, d1
07994c move.b     d1, (a0)
07994e move.w     (a4)+, $6(a0)
079952 addq.w     #$8, a0
079954 addq.w     #$4, d1
079956 move.b     d1, (a0)
079958 move.w     (a4)+, $6(a0)
07995c addq.w     #$8, a0
07995e addq.w     #$4, d1
079960 move.b     d1, (a0)
079962 move.w     (a4)+, $6(a0)
079966 addq.w     #$8, a0
079968 addq.w     #$4, d1
07996a move.b     d1, (a0)
07996c move.w     (a4)+, $6(a0)
079970 addq.w     #$8, a0
079972 addq.w     #$4, d1
079974 move.b     d1, (a0)
079976 move.w     (a4)+, $6(a0)
07997a addq.w     #$8, a0
07997c addq.w     #$4, d1
07997e move.b     d1, (a0)
079980 move.w     (a4)+, $6(a0)
079984 addq.w     #$8, a0
079986 addq.w     #$4, d1
079988 move.b     d1, (a0)
07998a move.w     (a4)+, $6(a0)
07998e addq.w     #$8, a0
079990 addq.w     #$4, d1
079992 move.b     d1, (a0)
079994 move.w     (a4)+, $6(a0)
079998 addq.w     #$8, a0
07999a addq.w     #$4, d1
07999c move.b     d1, (a0)
07999e move.w     (a4)+, $6(a0)
0799a2 addq.w     #$8, a0
0799a4 addq.w     #$4, d1
0799a6 move.b     d1, (a0)
0799a8 move.w     (a4)+, $6(a0)
0799ac addq.w     #$8, a0
0799ae addq.w     #$4, d1
0799b0 move.b     d1, (a0)
0799b2 move.w     (a4)+, $6(a0)
0799b6 addq.w     #$8, a0
0799b8 addq.w     #$4, d1
0799ba move.b     d1, (a0)
0799bc move.w     (a4)+, $6(a0)
0799c0 addq.w     #$8, a0
0799c2 addq.w     #$4, d1
0799c4 move.b     d1, (a0)
0799c6 move.w     (a4)+, $6(a0)
0799ca addq.w     #$8, a0
0799cc addq.w     #$4, d1
0799ce move.b     d1, (a0)
0799d0 move.w     (a4)+, $6(a0)
0799d4 addq.w     #$8, a0
0799d6 addq.w     #$4, d1
0799d8 move.b     d1, (a0)
0799da move.w     (a4)+, $6(a0)
0799de addq.w     #$8, a0
0799e0 addq.w     #$4, d1
0799e2 move.b     d1, (a0)
0799e4 move.w     (a4)+, $6(a0)
0799e8 addq.w     #$8, a0
0799ea addq.w     #$4, d1
0799ec move.b     d1, (a0)
0799ee move.w     (a4)+, $6(a0)
0799f2 addq.w     #$8, a0
0799f4 addq.w     #$4, d1
0799f6 move.b     d1, (a0)
0799f8 move.w     (a4)+, $6(a0)
0799fc addq.w     #$8, a0
0799fe addq.w     #$4, d1
079a00 move.b     d1, (a0)
079a02 move.w     (a4)+, $6(a0)
079a06 addq.w     #$8, a0
079a08 addq.w     #$4, d1
079a0a move.b     d1, (a0)
079a0c move.w     (a4)+, $6(a0)
079a10 addq.w     #$8, a0
079a12 addq.w     #$4, d1
079a14 move.b     d1, (a0)
079a16 move.w     (a4)+, $6(a0)
079a1a addq.w     #$8, a0
079a1c addq.w     #$4, d1
079a1e move.b     d1, (a0)
079a20 move.w     (a4)+, $6(a0)
079a24 addq.w     #$8, a0
079a26 addq.w     #$4, d1
079a28 move.b     d1, (a0)
079a2a move.w     (a4)+, $6(a0)
079a2e addq.w     #$8, a0
079a30 addq.w     #$4, d1
079a32 move.b     d1, (a0)
079a34 move.w     (a4)+, $6(a0)
079a38 addq.w     #$8, a0
079a3a addq.w     #$4, d1
079a3c move.b     d1, (a0)
079a3e move.w     (a4)+, $6(a0)
079a42 addq.w     #$8, a0
079a44 addq.w     #$4, d1
079a46 move.b     d1, (a0)
079a48 move.w     (a4)+, $6(a0)
079a4c addq.w     #$8, a0
079a4e addq.w     #$4, d1
079a50 move.w     (a7)+, d4
079a52 movea.l    (a7)+, a4
079a54 move.w     d4, d0
079a56 lsr.w      #$1, d0
079a58 moveq      #$24, d1
079a5a sub.w      d0, d1
079a5c bpl.b      $79a60
079a5e clr.w      d1
079a60 move.w     d1, d0
079a62 move.w     d0, d3
079a64 asl.w      #$4, d0
079a66 sub.w      d3, d0
079a68 add.w      d0, d0
079a6a lea.l      $79a8c(pc), a2
079a6e adda.w     d0, a2
079a70 asl.w      #$4, d1
079a72 adda.w     d1, a1
079a74 move.l     a1, d1
079a76 movea.l    (a7)+, a0
079a78 move.w     d1, $6(a0)
079a7c swap       d1
079a7e move.w     d1, $2(a0)
079a82 moveq      #$10, d1
079a84 lea.l      $2188(a3), a0
079a88 moveq      #$0, d0
079a8a jmp        (a2)
079a8c move.b     (a4)+, (a1)
079a8e move.b     (a4)+, d0
079a90 andi.w     #$ff, d0
079a94 asl.w      #$3, d0
079a96 move.w     (a0, d0.w), $6(a1)
079a9c move.w     $2(a0, d0.w), $a(a1)
079aa2 move.w     $4(a0, d0.w), $e(a1)
079aa8 adda.w     d1, a1
079aaa move.b     (a4)+, (a1)
079aac move.b     (a4)+, d0
079aae andi.w     #$ff, d0
079ab2 asl.w      #$3, d0
079ab4 move.w     (a0, d0.w), $6(a1)
079aba move.w     $2(a0, d0.w), $a(a1)
079ac0 move.w     $4(a0, d0.w), $e(a1)
079ac6 adda.w     d1, a1
079ac8 move.b     (a4)+, (a1)
079aca move.b     (a4)+, d0
079acc andi.w     #$ff, d0
079ad0 asl.w      #$3, d0
079ad2 move.w     (a0, d0.w), $6(a1)
079ad8 move.w     $2(a0, d0.w), $a(a1)
079ade move.w     $4(a0, d0.w), $e(a1)
079ae4 adda.w     d1, a1
079ae6 move.b     (a4)+, (a1)
079ae8 move.b     (a4)+, d0
079aea andi.w     #$ff, d0
079aee asl.w      #$3, d0
079af0 move.w     (a0, d0.w), $6(a1)
079af6 move.w     $2(a0, d0.w), $a(a1)
079afc move.w     $4(a0, d0.w), $e(a1)
079b02 adda.w     d1, a1
079b04 move.b     (a4)+, (a1)
079b06 move.b     (a4)+, d0
079b08 andi.w     #$ff, d0
079b0c asl.w      #$3, d0
079b0e move.w     (a0, d0.w), $6(a1)
079b14 move.w     $2(a0, d0.w), $a(a1)
079b1a move.w     $4(a0, d0.w), $e(a1)
079b20 adda.w     d1, a1
079b22 move.b     (a4)+, (a1)
079b24 move.b     (a4)+, d0
079b26 andi.w     #$ff, d0
079b2a asl.w      #$3, d0
079b2c move.w     (a0, d0.w), $6(a1)
079b32 move.w     $2(a0, d0.w), $a(a1)
079b38 move.w     $4(a0, d0.w), $e(a1)
079b3e adda.w     d1, a1
079b40 move.b     (a4)+, (a1)
079b42 move.b     (a4)+, d0
079b44 andi.w     #$ff, d0
079b48 asl.w      #$3, d0
079b4a move.w     (a0, d0.w), $6(a1)
079b50 move.w     $2(a0, d0.w), $a(a1)
079b56 move.w     $4(a0, d0.w), $e(a1)
079b5c adda.w     d1, a1
079b5e move.b     (a4)+, (a1)
079b60 move.b     (a4)+, d0
079b62 andi.w     #$ff, d0
079b66 asl.w      #$3, d0
079b68 move.w     (a0, d0.w), $6(a1)
079b6e move.w     $2(a0, d0.w), $a(a1)
079b74 move.w     $4(a0, d0.w), $e(a1)
079b7a adda.w     d1, a1
079b7c move.b     (a4)+, (a1)
079b7e move.b     (a4)+, d0
079b80 andi.w     #$ff, d0
079b84 asl.w      #$3, d0
079b86 move.w     (a0, d0.w), $6(a1)
079b8c move.w     $2(a0, d0.w), $a(a1)
079b92 move.w     $4(a0, d0.w), $e(a1)
079b98 adda.w     d1, a1
079b9a move.b     (a4)+, (a1)
079b9c move.b     (a4)+, d0
079b9e andi.w     #$ff, d0
079ba2 asl.w      #$3, d0
079ba4 move.w     (a0, d0.w), $6(a1)
079baa move.w     $2(a0, d0.w), $a(a1)
079bb0 move.w     $4(a0, d0.w), $e(a1)
079bb6 adda.w     d1, a1
079bb8 move.b     (a4)+, (a1)
079bba move.b     (a4)+, d0
079bbc andi.w     #$ff, d0
079bc0 asl.w      #$3, d0
079bc2 move.w     (a0, d0.w), $6(a1)
079bc8 move.w     $2(a0, d0.w), $a(a1)
079bce move.w     $4(a0, d0.w), $e(a1)
079bd4 adda.w     d1, a1
079bd6 move.b     (a4)+, (a1)
079bd8 move.b     (a4)+, d0
079bda andi.w     #$ff, d0
079bde asl.w      #$3, d0
079be0 move.w     (a0, d0.w), $6(a1)
079be6 move.w     $2(a0, d0.w), $a(a1)
079bec move.w     $4(a0, d0.w), $e(a1)
079bf2 adda.w     d1, a1
079bf4 move.b     (a4)+, (a1)
079bf6 move.b     (a4)+, d0
079bf8 andi.w     #$ff, d0
079bfc asl.w      #$3, d0
079bfe move.w     (a0, d0.w), $6(a1)
079c04 move.w     $2(a0, d0.w), $a(a1)
079c0a move.w     $4(a0, d0.w), $e(a1)
079c10 adda.w     d1, a1
079c12 move.b     (a4)+, (a1)
079c14 move.b     (a4)+, d0
079c16 andi.w     #$ff, d0
079c1a asl.w      #$3, d0
079c1c move.w     (a0, d0.w), $6(a1)
079c22 move.w     $2(a0, d0.w), $a(a1)
079c28 move.w     $4(a0, d0.w), $e(a1)
079c2e adda.w     d1, a1
079c30 move.b     (a4)+, (a1)
079c32 move.b     (a4)+, d0
079c34 andi.w     #$ff, d0
079c38 asl.w      #$3, d0
079c3a move.w     (a0, d0.w), $6(a1)
079c40 move.w     $2(a0, d0.w), $a(a1)
079c46 move.w     $4(a0, d0.w), $e(a1)
079c4c adda.w     d1, a1
079c4e move.b     (a4)+, (a1)
079c50 move.b     (a4)+, d0
079c52 andi.w     #$ff, d0
079c56 asl.w      #$3, d0
079c58 move.w     (a0, d0.w), $6(a1)
079c5e move.w     $2(a0, d0.w), $a(a1)
079c64 move.w     $4(a0, d0.w), $e(a1)
079c6a adda.w     d1, a1
079c6c move.b     (a4)+, (a1)
079c6e move.b     (a4)+, d0
079c70 andi.w     #$ff, d0
079c74 asl.w      #$3, d0
079c76 move.w     (a0, d0.w), $6(a1)
079c7c move.w     $2(a0, d0.w), $a(a1)
079c82 move.w     $4(a0, d0.w), $e(a1)
079c88 adda.w     d1, a1
079c8a move.b     (a4)+, (a1)
079c8c move.b     (a4)+, d0
079c8e andi.w     #$ff, d0
079c92 asl.w      #$3, d0
079c94 move.w     (a0, d0.w), $6(a1)
079c9a move.w     $2(a0, d0.w), $a(a1)
079ca0 move.w     $4(a0, d0.w), $e(a1)
079ca6 adda.w     d1, a1
079ca8 move.b     (a4)+, (a1)
079caa move.b     (a4)+, d0
079cac andi.w     #$ff, d0
079cb0 asl.w      #$3, d0
079cb2 move.w     (a0, d0.w), $6(a1)
079cb8 move.w     $2(a0, d0.w), $a(a1)
079cbe move.w     $4(a0, d0.w), $e(a1)
079cc4 adda.w     d1, a1
079cc6 move.b     (a4)+, (a1)
079cc8 move.b     (a4)+, d0
079cca andi.w     #$ff, d0
079cce asl.w      #$3, d0
079cd0 move.w     (a0, d0.w), $6(a1)
079cd6 move.w     $2(a0, d0.w), $a(a1)
079cdc move.w     $4(a0, d0.w), $e(a1)
079ce2 adda.w     d1, a1
079ce4 move.b     (a4)+, (a1)
079ce6 move.b     (a4)+, d0
079ce8 andi.w     #$ff, d0
079cec asl.w      #$3, d0
079cee move.w     (a0, d0.w), $6(a1)
079cf4 move.w     $2(a0, d0.w), $a(a1)
079cfa move.w     $4(a0, d0.w), $e(a1)
079d00 adda.w     d1, a1
079d02 move.b     (a4)+, (a1)
079d04 move.b     (a4)+, d0
079d06 andi.w     #$ff, d0
079d0a asl.w      #$3, d0
079d0c move.w     (a0, d0.w), $6(a1)
079d12 move.w     $2(a0, d0.w), $a(a1)
079d18 move.w     $4(a0, d0.w), $e(a1)
079d1e adda.w     d1, a1
079d20 move.b     (a4)+, (a1)
079d22 move.b     (a4)+, d0
079d24 andi.w     #$ff, d0
079d28 asl.w      #$3, d0
079d2a move.w     (a0, d0.w), $6(a1)
079d30 move.w     $2(a0, d0.w), $a(a1)
079d36 move.w     $4(a0, d0.w), $e(a1)
079d3c adda.w     d1, a1
079d3e move.b     (a4)+, (a1)
079d40 move.b     (a4)+, d0
079d42 andi.w     #$ff, d0
079d46 asl.w      #$3, d0
079d48 move.w     (a0, d0.w), $6(a1)
079d4e move.w     $2(a0, d0.w), $a(a1)
079d54 move.w     $4(a0, d0.w), $e(a1)
079d5a adda.w     d1, a1
079d5c move.b     (a4)+, (a1)
079d5e move.b     (a4)+, d0
079d60 andi.w     #$ff, d0
079d64 asl.w      #$3, d0
079d66 move.w     (a0, d0.w), $6(a1)
079d6c move.w     $2(a0, d0.w), $a(a1)
079d72 move.w     $4(a0, d0.w), $e(a1)
079d78 adda.w     d1, a1
079d7a move.b     (a4)+, (a1)
079d7c move.b     (a4)+, d0
079d7e andi.w     #$ff, d0
079d82 asl.w      #$3, d0
079d84 move.w     (a0, d0.w), $6(a1)
079d8a move.w     $2(a0, d0.w), $a(a1)
079d90 move.w     $4(a0, d0.w), $e(a1)
079d96 adda.w     d1, a1
079d98 move.b     (a4)+, (a1)
079d9a move.b     (a4)+, d0
079d9c andi.w     #$ff, d0
079da0 asl.w      #$3, d0
079da2 move.w     (a0, d0.w), $6(a1)
079da8 move.w     $2(a0, d0.w), $a(a1)
079dae move.w     $4(a0, d0.w), $e(a1)
079db4 adda.w     d1, a1
079db6 move.b     (a4)+, (a1)
079db8 move.b     (a4)+, d0
079dba andi.w     #$ff, d0
079dbe asl.w      #$3, d0
079dc0 move.w     (a0, d0.w), $6(a1)
079dc6 move.w     $2(a0, d0.w), $a(a1)
079dcc move.w     $4(a0, d0.w), $e(a1)
079dd2 adda.w     d1, a1
079dd4 move.b     (a4)+, (a1)
079dd6 move.b     (a4)+, d0
079dd8 andi.w     #$ff, d0
079ddc asl.w      #$3, d0
079dde move.w     (a0, d0.w), $6(a1)
079de4 move.w     $2(a0, d0.w), $a(a1)
079dea move.w     $4(a0, d0.w), $e(a1)
079df0 adda.w     d1, a1
079df2 move.b     (a4)+, (a1)
079df4 move.b     (a4)+, d0
079df6 andi.w     #$ff, d0
079dfa asl.w      #$3, d0
079dfc move.w     (a0, d0.w), $6(a1)
079e02 move.w     $2(a0, d0.w), $a(a1)
079e08 move.w     $4(a0, d0.w), $e(a1)
079e0e adda.w     d1, a1
079e10 move.b     (a4)+, (a1)
079e12 move.b     (a4)+, d0
079e14 andi.w     #$ff, d0
079e18 asl.w      #$3, d0
079e1a move.w     (a0, d0.w), $6(a1)
079e20 move.w     $2(a0, d0.w), $a(a1)
079e26 move.w     $4(a0, d0.w), $e(a1)
079e2c adda.w     d1, a1
079e2e move.b     (a4)+, (a1)
079e30 move.b     (a4)+, d0
079e32 andi.w     #$ff, d0
079e36 asl.w      #$3, d0
079e38 move.w     (a0, d0.w), $6(a1)
079e3e move.w     $2(a0, d0.w), $a(a1)
079e44 move.w     $4(a0, d0.w), $e(a1)
079e4a adda.w     d1, a1
079e4c move.b     (a4)+, (a1)
079e4e move.b     (a4)+, d0
079e50 andi.w     #$ff, d0
079e54 asl.w      #$3, d0
079e56 move.w     (a0, d0.w), $6(a1)
079e5c move.w     $2(a0, d0.w), $a(a1)
079e62 move.w     $4(a0, d0.w), $e(a1)
079e68 adda.w     d1, a1
079e6a move.b     (a4)+, (a1)
079e6c move.b     (a4)+, d0
079e6e andi.w     #$ff, d0
079e72 asl.w      #$3, d0
079e74 move.w     (a0, d0.w), $6(a1)
079e7a move.w     $2(a0, d0.w), $a(a1)
079e80 move.w     $4(a0, d0.w), $e(a1)
079e86 adda.w     d1, a1
079e88 move.b     (a4)+, (a1)
079e8a move.b     (a4)+, d0
079e8c andi.w     #$ff, d0
079e90 asl.w      #$3, d0
079e92 move.w     (a0, d0.w), $6(a1)
079e98 move.w     $2(a0, d0.w), $a(a1)
079e9e move.w     $4(a0, d0.w), $e(a1)
079ea4 adda.w     d1, a1
079ea6 move.b     (a4)+, (a1)
079ea8 move.b     (a4)+, d0
079eaa andi.w     #$ff, d0
079eae asl.w      #$3, d0
079eb0 move.w     (a0, d0.w), $6(a1)
079eb6 move.w     $2(a0, d0.w), $a(a1)
079ebc move.w     $4(a0, d0.w), $e(a1)
079ec2 adda.w     d1, a1
079ec4 rts        
079ec6 move.l     $30c2(a3), d0
079eca lea.l      -$2278(a3), a2
079ece bsr.b      $79eee
079ed0 move.w     d0, $30b8(a3)
079ed4 move.w     d1, $30ce(a3)
079ed8 rts        
079eda move.l     $3196(a3), d0
079ede lea.l      -$2278(a3), a2
079ee2 bsr.b      $79eee
079ee4 move.w     d0, $318c(a3)
079ee8 move.w     d1, $31a2(a3)
079eec rts        
079eee movea.l    a2, a1
079ef0 lea.l      $4a7e(a3), a4
079ef4 move.w     d0, d1
079ef6 rol.w      #$4, d1
079ef8 andi.w     #$f, d1
079efc moveq      #$f, d6
079efe sub.w      d1, d6
079f00 move.w     d6, $2db4(a3)
079f04 move.w     d1, d6
079f06 addq.w     #$1, d6
079f08 move.w     d6, $2db6(a3)
079f0c swap       d0
079f0e asl.w      #$4, d0
079f10 lea.l      -$1e7d(a3), a0
079f14 adda.w     d0, a0
079f16 moveq      #$0, d0
079f18 moveq      #$0, d1
079f1a moveq      #$0, d2
079f1c moveq      #$0, d3
079f1e move.w     $2e94(a3), d7
079f22 adda.w     #$10, a0
079f26 move.b     -$b(a0), d4
079f2a ext.w      d4
079f2c move.b     -$a(a0), d5
079f30 ext.w      d5
079f32 add.w      d5, d5
079f34 tst.w      $2db4(a3)
079f38 beq.b      $79f68
079f3a add.w      d4, d0
079f3c sub.w      d5, d1
079f3e add.w      d0, d2
079f40 add.w      d1, d3
079f42 move.w     d2, (a2)+
079f44 move.w     d3, d6
079f46 muls.w     $100(a4), d6
079f4a swap       d6
079f4c add.w      (a4)+, d6
079f4e move.w     d6, (a2)+
079f50 cmp.w      $2e94(a3), d6
079f54 bcc.w      $7a24c
079f58 cmp.w      d7, d6
079f5a bpl.b      $79f5e
079f5c move.b     d6, d7
079f5e move.w     d7, (a2)+
079f60 move.w     d0, (a2)+
079f62 subq.w     #$1, $2db4(a3)
079f66 bne.b      $79f3a
079f68 move.w     #$7, $2f84(a3)
079f6e adda.w     #$10, a0
079f72 move.b     -$b(a0), d4
079f76 ext.w      d4
079f78 move.b     -$a(a0), d5
079f7c ext.w      d5
079f7e add.w      d5, d5
079f80 add.w      d4, d0
079f82 sub.w      d5, d1
079f84 add.w      d0, d2
079f86 add.w      d1, d3
079f88 move.w     d2, (a2)+
079f8a move.w     d3, d6
079f8c muls.w     $100(a4), d6
079f90 swap       d6
079f92 add.w      (a4)+, d6
079f94 move.w     d6, (a2)+
079f96 cmp.w      $2e94(a3), d6
079f9a bcc.w      $7a24c
079f9e cmp.w      d7, d6
079fa0 bpl.b      $79fa4
079fa2 move.b     d6, d7
079fa4 move.w     d7, (a2)+
079fa6 move.w     d0, (a2)+
079fa8 add.w      d4, d0
079faa sub.w      d5, d1
079fac add.w      d0, d2
079fae add.w      d1, d3
079fb0 move.w     d2, (a2)+
079fb2 move.w     d3, d6
079fb4 muls.w     $100(a4), d6
079fb8 swap       d6
079fba add.w      (a4)+, d6
079fbc move.w     d6, (a2)+
079fbe cmp.w      $2e94(a3), d6
079fc2 bcc.w      $7a24c
079fc6 cmp.w      d7, d6
079fc8 bpl.b      $79fcc
079fca move.b     d6, d7
079fcc move.w     d7, (a2)+
079fce move.w     d0, (a2)+
079fd0 add.w      d4, d0
079fd2 sub.w      d5, d1
079fd4 add.w      d0, d2
079fd6 add.w      d1, d3
079fd8 move.w     d2, (a2)+
079fda move.w     d3, d6
079fdc muls.w     $100(a4), d6
079fe0 swap       d6
079fe2 add.w      (a4)+, d6
079fe4 move.w     d6, (a2)+
079fe6 cmp.w      $2e94(a3), d6
079fea bcc.w      $7a24c
079fee cmp.w      d7, d6
079ff0 bpl.b      $79ff4
079ff2 move.b     d6, d7
079ff4 move.w     d7, (a2)+
079ff6 move.w     d0, (a2)+
079ff8 add.w      d4, d0
079ffa sub.w      d5, d1
079ffc add.w      d0, d2
079ffe add.w      d1, d3
07a000 move.w     d2, (a2)+
07a002 move.w     d3, d6
07a004 muls.w     $100(a4), d6
07a008 swap       d6
07a00a add.w      (a4)+, d6
07a00c move.w     d6, (a2)+
07a00e cmp.w      $2e94(a3), d6
07a012 bcc.w      $7a24c
07a016 cmp.w      d7, d6
07a018 bpl.b      $7a01c
07a01a move.b     d6, d7
07a01c move.w     d7, (a2)+
07a01e move.w     d0, (a2)+
07a020 add.w      d4, d0
07a022 sub.w      d5, d1
07a024 add.w      d0, d2
07a026 add.w      d1, d3
07a028 move.w     d2, (a2)+
07a02a move.w     d3, d6
07a02c muls.w     $100(a4), d6
07a030 swap       d6
07a032 add.w      (a4)+, d6
07a034 move.w     d6, (a2)+
07a036 cmp.w      $2e94(a3), d6
07a03a bcc.w      $7a24c
07a03e cmp.w      d7, d6
07a040 bpl.b      $7a044
07a042 move.b     d6, d7
07a044 move.w     d7, (a2)+
07a046 move.w     d0, (a2)+
07a048 add.w      d4, d0
07a04a sub.w      d5, d1
07a04c add.w      d0, d2
07a04e add.w      d1, d3
07a050 move.w     d2, (a2)+
07a052 move.w     d3, d6
07a054 muls.w     $100(a4), d6
07a058 swap       d6
07a05a add.w      (a4)+, d6
07a05c move.w     d6, (a2)+
07a05e cmp.w      $2e94(a3), d6
07a062 bcc.w      $7a24c
07a066 cmp.w      d7, d6
07a068 bpl.b      $7a06c
07a06a move.b     d6, d7
07a06c move.w     d7, (a2)+
07a06e move.w     d0, (a2)+
07a070 add.w      d4, d0
07a072 sub.w      d5, d1
07a074 add.w      d0, d2
07a076 add.w      d1, d3
07a078 move.w     d2, (a2)+
07a07a move.w     d3, d6
07a07c muls.w     $100(a4), d6
07a080 swap       d6
07a082 add.w      (a4)+, d6
07a084 move.w     d6, (a2)+
07a086 cmp.w      $2e94(a3), d6
07a08a bcc.w      $7a24c
07a08e cmp.w      d7, d6
07a090 bpl.b      $7a094
07a092 move.b     d6, d7
07a094 move.w     d7, (a2)+
07a096 move.w     d0, (a2)+
07a098 add.w      d4, d0
07a09a sub.w      d5, d1
07a09c add.w      d0, d2
07a09e add.w      d1, d3
07a0a0 move.w     d2, (a2)+
07a0a2 move.w     d3, d6
07a0a4 muls.w     $100(a4), d6
07a0a8 swap       d6
07a0aa add.w      (a4)+, d6
07a0ac move.w     d6, (a2)+
07a0ae cmp.w      $2e94(a3), d6
07a0b2 bcc.w      $7a24c
07a0b6 cmp.w      d7, d6
07a0b8 bpl.b      $7a0bc
07a0ba move.b     d6, d7
07a0bc move.w     d7, (a2)+
07a0be move.w     d0, (a2)+
07a0c0 add.w      d4, d0
07a0c2 sub.w      d5, d1
07a0c4 add.w      d0, d2
07a0c6 add.w      d1, d3
07a0c8 move.w     d2, (a2)+
07a0ca move.w     d3, d6
07a0cc muls.w     $100(a4), d6
07a0d0 swap       d6
07a0d2 add.w      (a4)+, d6
07a0d4 move.w     d6, (a2)+
07a0d6 cmp.w      $2e94(a3), d6
07a0da bcc.w      $7a24c
07a0de cmp.w      d7, d6
07a0e0 bpl.b      $7a0e4
07a0e2 move.b     d6, d7
07a0e4 move.w     d7, (a2)+
07a0e6 move.w     d0, (a2)+
07a0e8 add.w      d4, d0
07a0ea sub.w      d5, d1
07a0ec add.w      d0, d2
07a0ee add.w      d1, d3
07a0f0 move.w     d2, (a2)+
07a0f2 move.w     d3, d6
07a0f4 muls.w     $100(a4), d6
07a0f8 swap       d6
07a0fa add.w      (a4)+, d6
07a0fc move.w     d6, (a2)+
07a0fe cmp.w      $2e94(a3), d6
07a102 bcc.w      $7a24c
07a106 cmp.w      d7, d6
07a108 bpl.b      $7a10c
07a10a move.b     d6, d7
07a10c move.w     d7, (a2)+
07a10e move.w     d0, (a2)+
07a110 add.w      d4, d0
07a112 sub.w      d5, d1
07a114 add.w      d0, d2
07a116 add.w      d1, d3
07a118 move.w     d2, (a2)+
07a11a move.w     d3, d6
07a11c muls.w     $100(a4), d6
07a120 swap       d6
07a122 add.w      (a4)+, d6
07a124 move.w     d6, (a2)+
07a126 cmp.w      $2e94(a3), d6
07a12a bcc.w      $7a24c
07a12e cmp.w      d7, d6
07a130 bpl.b      $7a134
07a132 move.b     d6, d7
07a134 move.w     d7, (a2)+
07a136 move.w     d0, (a2)+
07a138 add.w      d4, d0
07a13a sub.w      d5, d1
07a13c add.w      d0, d2
07a13e add.w      d1, d3
07a140 move.w     d2, (a2)+
07a142 move.w     d3, d6
07a144 muls.w     $100(a4), d6
07a148 swap       d6
07a14a add.w      (a4)+, d6
07a14c move.w     d6, (a2)+
07a14e cmp.w      $2e94(a3), d6
07a152 bcc.w      $7a24c
07a156 cmp.w      d7, d6
07a158 bpl.b      $7a15c
07a15a move.b     d6, d7
07a15c move.w     d7, (a2)+
07a15e move.w     d0, (a2)+
07a160 add.w      d4, d0
07a162 sub.w      d5, d1
07a164 add.w      d0, d2
07a166 add.w      d1, d3
07a168 move.w     d2, (a2)+
07a16a move.w     d3, d6
07a16c muls.w     $100(a4), d6
07a170 swap       d6
07a172 add.w      (a4)+, d6
07a174 move.w     d6, (a2)+
07a176 cmp.w      $2e94(a3), d6
07a17a bcc.w      $7a24c
07a17e cmp.w      d7, d6
07a180 bpl.b      $7a184
07a182 move.b     d6, d7
07a184 move.w     d7, (a2)+
07a186 move.w     d0, (a2)+
07a188 add.w      d4, d0
07a18a sub.w      d5, d1
07a18c add.w      d0, d2
07a18e add.w      d1, d3
07a190 move.w     d2, (a2)+
07a192 move.w     d3, d6
07a194 muls.w     $100(a4), d6
07a198 swap       d6
07a19a add.w      (a4)+, d6
07a19c move.w     d6, (a2)+
07a19e cmp.w      $2e94(a3), d6
07a1a2 bcc.w      $7a24c
07a1a6 cmp.w      d7, d6
07a1a8 bpl.b      $7a1ac
07a1aa move.b     d6, d7
07a1ac move.w     d7, (a2)+
07a1ae move.w     d0, (a2)+
07a1b0 add.w      d4, d0
07a1b2 sub.w      d5, d1
07a1b4 add.w      d0, d2
07a1b6 add.w      d1, d3
07a1b8 move.w     d2, (a2)+
07a1ba move.w     d3, d6
07a1bc muls.w     $100(a4), d6
07a1c0 swap       d6
07a1c2 add.w      (a4)+, d6
07a1c4 move.w     d6, (a2)+
07a1c6 cmp.w      $2e94(a3), d6
07a1ca bcc.w      $7a24c
07a1ce cmp.w      d7, d6
07a1d0 bpl.b      $7a1d4
07a1d2 move.b     d6, d7
07a1d4 move.w     d7, (a2)+
07a1d6 move.w     d0, (a2)+
07a1d8 add.w      d4, d0
07a1da sub.w      d5, d1
07a1dc add.w      d0, d2
07a1de add.w      d1, d3
07a1e0 move.w     d2, (a2)+
07a1e2 move.w     d3, d6
07a1e4 muls.w     $100(a4), d6
07a1e8 swap       d6
07a1ea add.w      (a4)+, d6
07a1ec move.w     d6, (a2)+
07a1ee cmp.w      $2e94(a3), d6
07a1f2 bcc.b      $7a24c
07a1f4 cmp.w      d7, d6
07a1f6 bpl.b      $7a1fa
07a1f8 move.b     d6, d7
07a1fa move.w     d7, (a2)+
07a1fc move.w     d0, (a2)+
07a1fe subq.w     #$1, $2f84(a3)
07a202 bne.w      $79f6e
07a206 adda.w     #$10, a0
07a20a move.b     -$b(a0), d4
07a20e ext.w      d4
07a210 move.b     -$a(a0), d5
07a214 ext.w      d5
07a216 add.w      d5, d5
07a218 add.w      d4, d0
07a21a sub.w      d5, d1
07a21c add.w      d0, d2
07a21e add.w      d1, d3
07a220 move.w     d2, (a2)+
07a222 move.w     d3, d6
07a224 muls.w     $100(a4), d6
07a228 swap       d6
07a22a add.w      (a4)+, d6
07a22c move.w     d6, (a2)+
07a22e cmp.w      $2e94(a3), d6
07a232 bcc.b      $7a24c
07a234 cmp.w      d7, d6
07a236 bpl.b      $7a23a
07a238 move.b     d6, d7
07a23a move.w     d7, (a2)+
07a23c move.w     d0, (a2)+
07a23e subq.w     #$1, $2db6(a3)
07a242 bne.b      $7a218
07a244 move.w     d7, d1
07a246 move.w     #$80, d0
07a24a bra.b      $7a26c
07a24c cmp.w      $2e94(a3), d6
07a250 bpl.b      $7a264
07a252 clr.w      (a2)
07a254 clr.w      -$2(a2)
07a258 moveq      #$0, d1
07a25a move.w     a2, d0
07a25c sub.l      a1, d0
07a25e lsr.w      #$3, d0
07a260 addq.w     #$1, d0
07a262 bra.b      $7a26c
07a264 move.w     d7, d1
07a266 move.w     a2, d0
07a268 sub.l      a1, d0
07a26a lsr.w      #$3, d0
07a26c clr.w      (a1)+
07a26e move.w     $2e94(a3), (a1)+
07a272 move.w     $2e94(a3), (a1)+
07a276 clr.w      (a1)
07a278 rts        
07a27a lea.l      -$2278(a3), a4
07a27e lea.l      -$2bd8(a3), a1
07a282 move.w     $30b8(a3), d0
07a286 move.l     $30c2(a3), d4
07a28a bra.b      $7a29c
07a28c lea.l      -$2278(a3), a4
07a290 lea.l      -$2728(a3), a1
07a294 move.w     $318c(a3), d0
07a298 move.l     $3196(a3), d4
07a29c move.w     d0, d7
07a29e move.w     d7, d6
07a2a0 add.w      d6, d6
07a2a2 subq.w     #$1, d7
07a2a4 asl.w      #$8, d7
07a2a6 lea.l      $4b7e(a3), a0
07a2aa adda.w     d6, a0
07a2ac add.w      d6, d6
07a2ae add.w      d6, d6
07a2b0 adda.w     d6, a4
07a2b2 lea.l      -$3bd8(a3), a2
07a2b6 subq.w     #$4, a4
07a2b8 move.w     -(a4), d1
07a2ba subq.w     #$6, a4
07a2bc move.w     -(a0), d0
07a2be move.w     d1, d3
07a2c0 add.w      d3, d3
07a2c2 add.w      d1, d3
07a2c4 add.w      d3, d3
07a2c6 adda.w     d3, a1
07a2c8 moveq      #$ff, d6
07a2ca move.w     -(a4), d5
07a2cc move.w     -(a4), d2
07a2ce subq.w     #$4, a4
07a2d0 move.w     -(a0), d4
07a2d2 cmp.w      d5, d1
07a2d4 bne.b      $7a2da
07a2d6 move.w     d4, d0
07a2d8 bra.b      $7a34c
07a2da sub.w      d5, d1
07a2dc cmp.w      d6, d1
07a2de beq.b      $7a342
07a2e0 bmi.b      $7a2f0
07a2e2 add.w      d1, d1
07a2e4 suba.w     d1, a1
07a2e6 add.w      d1, d1
07a2e8 suba.w     d1, a1
07a2ea move.w     d4, d0
07a2ec move.w     d5, d1
07a2ee bra.b      $7a34c
07a2f0 neg.w      d1
07a2f2 ext.l      d0
07a2f4 move.w     d1, d3
07a2f6 add.w      d3, d3
07a2f8 add.w      d3, d3
07a2fa move.l     $40(a2, d3.w), d3
07a2fe asl.l      #$4, d3
07a300 swap       d3
07a302 move.w     d3, $2fde(a3)
07a306 move.w     d4, d3
07a308 sub.w      d0, d3
07a30a andi.w     #$fff0, d3
07a30e add.w      d1, d3
07a310 add.w      d3, d3
07a312 add.w      d3, d3
07a314 move.l     (a2, d3.w), d3
07a318 subq.w     #$2, d1
07a31a move.w     d2, (a1)+
07a31c move.w     d0, (a1)+
07a31e move.w     d7, (a1)+
07a320 sub.w      $2fde(a3), d7
07a324 swap       d0
07a326 add.l      d3, d0
07a328 swap       d0
07a32a dbra       d1, $7a31a
07a32e move.w     d2, (a1)+
07a330 move.w     d0, (a1)+
07a332 move.w     d7, (a1)+
07a334 sub.w      $2fde(a3), d7
07a338 andi.w     #$ff00, d7
07a33c addi.w     #$100, d7
07a340 bra.b      $7a348
07a342 move.w     d2, (a1)+
07a344 move.w     d0, (a1)+
07a346 move.w     d7, (a1)+
07a348 move.w     d4, d0
07a34a move.w     d5, d1
07a34c subi.w     #$100, d7
07a350 bpl.w      $7a2ca
07a354 rts        
07a356 lea.l      $303e(a3), a4
07a35a bsr.b      $7a366
07a35c rts        
07a35e lea.l      $3112(a3), a4
07a362 bsr.b      $7a366
07a364 rts        
07a366 move.w     $8c(a4), d0
07a36a move.w     d0, $a6(a4)
07a36e move.w     $90(a4), d1
07a372 asr.w      #$1, d0
07a374 move.w     $2e94(a3), d7
07a378 subi.w     #$38, d7
07a37c sub.w      $2c78(a3), d7
07a380 sub.w      d0, d7
07a382 move.w     d7, d2
07a384 add.w      $2c78(a3), d7
07a388 move.w     d7, d3
07a38a clr.w      d4
07a38c move.w     d2, d0
07a38e bpl.b      $7a396
07a390 clr.w      d2
07a392 neg.w      d0
07a394 move.w     d0, d4
07a396 move.w     d3, d0
07a398 bpl.b      $7a39c
07a39a clr.w      d3
07a39c move.w     d1, d0
07a39e sub.w      d3, d0
07a3a0 bpl.b      $7a3a4
07a3a2 move.w     d1, d3
07a3a4 move.w     d1, d0
07a3a6 sub.w      d2, d0
07a3a8 bpl.b      $7a3ac
07a3aa move.w     d1, d2
07a3ac move.w     d1, d0
07a3ae sub.w      d3, d0
07a3b0 move.w     d0, d5
07a3b2 move.w     d3, d0
07a3b4 sub.w      d2, d0
07a3b6 move.w     d0, d6
07a3b8 move.w     d2, d7
07a3ba move.w     d2, $92(a4)
07a3be move.w     d3, $98(a4)
07a3c2 move.w     d4, $96(a4)
07a3c6 move.w     d5, $9a(a4)
07a3ca move.w     d6, $94(a4)
07a3ce move.w     d7, $9c(a4)
07a3d2 rts        
07a3d4 move.l     #$20d0, d7
07a3da move.l     $2f74(a3), d6
07a3de movea.l    d6, a0
07a3e0 move.w     $30ce(a3), d1
07a3e4 move.w     d1, d0
07a3e6 mulu.w     #$2a, d0
07a3ea adda.w     d0, a0
07a3ec adda.w     #$2, a0
07a3f0 move.w     $2e94(a3), d0
07a3f4 sub.w      d1, d0
07a3f6 lsl.w      #$6, d0
07a3f8 addi.w     #$14, d0
07a3fc move.l     a0, (a4)+
07a3fe move.w     d0, (a4)+
07a400 adda.w     d7, a0
07a402 move.l     a0, (a4)+
07a404 move.w     d0, (a4)+
07a406 move.w     $30da(a3), d0
07a40a beq.b      $7a42e
07a40c lsl.w      #$6, d0
07a40e addi.w     #$14, d0
07a412 movea.l    d6, a0
07a414 addq.l     #$2, a0
07a416 move.l     a0, (a4)+
07a418 move.w     d0, (a4)+
07a41a adda.w     d7, a0
07a41c move.l     a0, (a4)+
07a41e move.w     d0, (a4)+
07a420 adda.w     d7, a0
07a422 move.l     a0, (a4)+
07a424 move.w     d0, (a4)+
07a426 adda.w     d7, a0
07a428 move.l     a0, (a4)+
07a42a move.w     d0, (a4)+
07a42c bra.b      $7a434
07a42e move.l     #$ffffffff, (a4)+
07a434 move.w     $30d2(a3), d0
07a438 beq.b      $7a4b4
07a43a lsl.w      #$6, d0
07a43c addi.w     #$15, d0
07a440 move.w     d0, d5
07a442 move.l     $2d12(a3), d3
07a446 move.w     $30cc(a3), d1
07a44a andi.w     #$fff, d1
07a44e mulu.w     #$2800, d1
07a452 swap       d1
07a454 move.w     d1, d0
07a456 lsr.w      #$4, d1
07a458 add.w      d1, d1
07a45a ext.l      d1
07a45c add.l      d1, d3
07a45e move.w     $30d4(a3), d4
07a462 mulu.w     #$78, d4
07a466 add.l      d4, d3
07a468 andi.w     #$f, d0
07a46c eori.w     #$f, d0
07a470 lsl.w      #$4, d0
07a472 lsl.w      #$8, d0
07a474 ori.w      #$9f0, d0
07a478 move.w     d0, d1
07a47a move.w     $30d0(a3), d0
07a47e mulu.w     #$2a, d0
07a482 add.l      d6, d0
07a484 move.w     $2c78(a3), d4
07a488 mulu.w     #$78, d4
07a48c move.l     d0, (a4)+
07a48e move.l     d3, (a4)+
07a490 move.w     d1, (a4)+
07a492 move.w     d5, (a4)+
07a494 add.l      d4, d3
07a496 add.l      d7, d0
07a498 move.l     d0, (a4)+
07a49a move.l     d3, (a4)+
07a49c move.w     d5, (a4)+
07a49e add.l      d4, d3
07a4a0 add.l      d7, d0
07a4a2 move.l     d0, (a4)+
07a4a4 move.l     d3, (a4)+
07a4a6 move.w     d5, (a4)+
07a4a8 add.l      d4, d3
07a4aa add.l      d7, d0
07a4ac move.l     d0, (a4)+
07a4ae move.l     d3, (a4)+
07a4b0 move.w     d5, (a4)+
07a4b2 bra.b      $7a4ba
07a4b4 move.l     #$ffffffff, (a4)+
07a4ba move.w     $30d8(a3), d0
07a4be bls.b      $7a4ec
07a4c0 lsl.w      #$6, d0
07a4c2 addi.w     #$14, d0
07a4c6 movea.l    d6, a0
07a4c8 addq.l     #$2, a0
07a4ca move.w     $30d6(a3), d1
07a4ce mulu.w     #$2a, d1
07a4d2 adda.w     d1, a0
07a4d4 move.l     a0, (a4)+
07a4d6 move.w     d0, (a4)+
07a4d8 adda.w     d7, a0
07a4da move.l     a0, (a4)+
07a4dc move.w     d0, (a4)+
07a4de adda.w     d7, a0
07a4e0 move.l     a0, (a4)+
07a4e2 move.w     d0, (a4)+
07a4e4 adda.w     d7, a0
07a4e6 move.l     a0, (a4)+
07a4e8 move.w     d0, (a4)+
07a4ea bra.b      $7a4f2
07a4ec move.l     #$ffffffff, (a4)+
07a4f2 rts        
07a4f4 move.l     #$20d0, d7
07a4fa move.l     $2f74(a3), d6
07a4fe addi.l     #$fc0, d6
07a504 movea.l    d6, a0
07a506 move.w     $31a2(a3), d1
07a50a move.w     d1, d0
07a50c mulu.w     #$2a, d0
07a510 adda.w     d0, a0
07a512 adda.w     #$2, a0
07a516 moveq      #$60, d0
07a518 sub.w      d1, d0
07a51a lsl.w      #$6, d0
07a51c addi.w     #$14, d0
07a520 move.l     a0, (a4)+
07a522 move.w     d0, (a4)+
07a524 adda.w     d7, a0
07a526 move.l     a0, (a4)+
07a528 move.w     d0, (a4)+
07a52a move.w     $31ae(a3), d0
07a52e beq.b      $7a552
07a530 lsl.w      #$6, d0
07a532 addi.w     #$14, d0
07a536 movea.l    d6, a0
07a538 addq.l     #$2, a0
07a53a move.l     a0, (a4)+
07a53c move.w     d0, (a4)+
07a53e adda.w     d7, a0
07a540 move.l     a0, (a4)+
07a542 move.w     d0, (a4)+
07a544 adda.w     d7, a0
07a546 move.l     a0, (a4)+
07a548 move.w     d0, (a4)+
07a54a adda.w     d7, a0
07a54c move.l     a0, (a4)+
07a54e move.w     d0, (a4)+
07a550 bra.b      $7a558
07a552 move.l     #$ffffffff, (a4)+
07a558 move.w     $31a6(a3), d0
07a55c beq.b      $7a5d8
07a55e lsl.w      #$6, d0
07a560 addi.w     #$15, d0
07a564 move.w     d0, d5
07a566 move.l     $2d12(a3), d3
07a56a move.w     $31a0(a3), d1
07a56e andi.w     #$fff, d1
07a572 mulu.w     #$2800, d1
07a576 swap       d1
07a578 move.w     d1, d0
07a57a lsr.w      #$4, d1
07a57c add.w      d1, d1
07a57e ext.l      d1
07a580 add.l      d1, d3
07a582 move.w     $31a8(a3), d4
07a586 mulu.w     #$78, d4
07a58a add.l      d4, d3
07a58c andi.w     #$f, d0
07a590 eori.w     #$f, d0
07a594 lsl.w      #$4, d0
07a596 lsl.w      #$8, d0
07a598 ori.w      #$9f0, d0
07a59c move.w     d0, d1
07a59e move.w     $31a4(a3), d0
07a5a2 mulu.w     #$2a, d0
07a5a6 add.l      d6, d0
07a5a8 move.w     $2c78(a3), d4
07a5ac mulu.w     #$78, d4
07a5b0 move.l     d0, (a4)+
07a5b2 move.l     d3, (a4)+
07a5b4 move.w     d1, (a4)+
07a5b6 move.w     d5, (a4)+
07a5b8 add.l      d4, d3
07a5ba add.l      d7, d0
07a5bc move.l     d0, (a4)+
07a5be move.l     d3, (a4)+
07a5c0 move.w     d5, (a4)+
07a5c2 add.l      d4, d3
07a5c4 add.l      d7, d0
07a5c6 move.l     d0, (a4)+
07a5c8 move.l     d3, (a4)+
07a5ca move.w     d5, (a4)+
07a5cc add.l      d4, d3
07a5ce add.l      d7, d0
07a5d0 move.l     d0, (a4)+
07a5d2 move.l     d3, (a4)+
07a5d4 move.w     d5, (a4)+
07a5d6 bra.b      $7a5de
07a5d8 move.l     #$ffffffff, (a4)+
07a5de move.w     $31ac(a3), d0
07a5e2 bls.b      $7a610
07a5e4 lsl.w      #$6, d0
07a5e6 addi.w     #$14, d0
07a5ea movea.l    d6, a0
07a5ec addq.l     #$2, a0
07a5ee move.w     $31aa(a3), d1
07a5f2 mulu.w     #$2a, d1
07a5f6 adda.w     d1, a0
07a5f8 move.l     a0, (a4)+
07a5fa move.w     d0, (a4)+
07a5fc adda.w     d7, a0
07a5fe move.l     a0, (a4)+
07a600 move.w     d0, (a4)+
07a602 adda.w     d7, a0
07a604 move.l     a0, (a4)+
07a606 move.w     d0, (a4)+
07a608 adda.w     d7, a0
07a60a move.l     a0, (a4)+
07a60c move.w     d0, (a4)+
07a60e bra.b      $7a616
07a610 move.l     #$ffffffff, (a4)+
07a616 rts        
07a618 movea.l    $2fee(a3), a0
07a61c lea.l      $2438(a3), a2
07a620 move.l     a0, (a2)+
07a622 move.w     #$14f, d7
07a626 moveq      #$0, d1
07a628 bsr.w      $7a76e
07a62c move.w     d1, (a0)+
07a62e dbra       d7, $7a626
07a632 move.w     #$143, d7
07a636 movea.l    -$4(a2), a1
07a63a move.w     (a1)+, (a0)+
07a63c dbra       d7, $7a63a
07a640 move.l     a0, (a2)+
07a642 move.w     #$7d, d7
07a646 moveq      #$0, d1
07a648 moveq      #$0, d2
07a64a bsr.w      $7a77a
07a64e move.w     d2, $1f4(a0)
07a652 move.w     d1, (a0)+
07a654 dbra       d7, $7a646
07a658 move.w     #$7b, d7
07a65c movea.l    -$4(a2), a1
07a660 move.w     (a1)+, (a0)+
07a662 dbra       d7, $7a660
07a666 move.l     a0, (a2)+
07a668 adda.w     #$fc, a0
07a66c move.w     #$7b, d7
07a670 movea.l    -$4(a2), a1
07a674 move.w     (a1)+, (a0)+
07a676 dbra       d7, $7a674
07a67a move.l     a0, (a2)+
07a67c move.w     #$53, d7
07a680 moveq      #$0, d1
07a682 moveq      #$0, d2
07a684 moveq      #$0, d3
07a686 bsr.w      $7a788
07a68a move.w     d3, $284(a0)
07a68e move.w     d2, $142(a0)
07a692 move.w     d1, (a0)+
07a694 dbra       d7, $7a680
07a698 move.w     #$4c, d7
07a69c movea.l    -$4(a2), a1
07a6a0 move.w     (a1)+, (a0)+
07a6a2 dbra       d7, $7a6a0
07a6a6 move.l     a0, (a2)+
07a6a8 adda.w     #$a8, a0
07a6ac move.w     #$4c, d7
07a6b0 movea.l    -$4(a2), a1
07a6b4 move.w     (a1)+, (a0)+
07a6b6 dbra       d7, $7a6b4
07a6ba move.l     a0, (a2)+
07a6bc adda.w     #$a8, a0
07a6c0 move.w     #$4c, d7
07a6c4 movea.l    -$4(a2), a1
07a6c8 move.w     (a1)+, (a0)+
07a6ca dbra       d7, $7a6c8
07a6ce move.l     a0, (a2)+
07a6d0 move.w     #$53, d7
07a6d4 moveq      #$0, d1
07a6d6 moveq      #$0, d2
07a6d8 moveq      #$0, d3
07a6da moveq      #$0, d4
07a6dc bsr.w      $7a798
07a6e0 move.w     d4, $348(a0)
07a6e4 move.w     d3, $230(a0)
07a6e8 move.w     d2, $118(a0)
07a6ec move.w     d1, (a0)+
07a6ee dbra       d7, $7a6d4
07a6f2 move.w     #$37, d7
07a6f6 movea.l    -$4(a2), a1
07a6fa move.w     (a1)+, (a0)+
07a6fc dbra       d7, $7a6fa
07a700 move.l     a0, (a2)+
07a702 adda.w     #$a8, a0
07a706 move.w     #$37, d7
07a70a movea.l    -$4(a2), a1
07a70e move.w     (a1)+, (a0)+
07a710 dbra       d7, $7a70e
07a714 move.l     a0, (a2)+
07a716 adda.w     #$a8, a0
07a71a move.w     #$37, d7
07a71e movea.l    -$4(a2), a1
07a722 move.w     (a1)+, (a0)+
07a724 dbra       d7, $7a722
07a728 move.l     a0, (a2)+
07a72a adda.w     #$a8, a0
07a72e move.w     #$37, d7
07a732 movea.l    -$4(a2), a1
07a736 move.w     (a1)+, (a0)+
07a738 dbra       d7, $7a736
07a73c move.l     a0, $2fee(a3)
07a740 rts        
07a742 bsr.w      $78c64
07a746 andi.w     #$7, d0
07a74a move.w     d0, d5
07a74c add.w      d5, d5
07a74e move.w     (a4, d5.w), d1
07a752 move.w     $10(a4, d5.w), d2
07a756 move.w     $20(a4, d5.w), d3
07a75a move.w     $30(a4, d5.w), d4
07a75e bsr.w      $78c64
07a762 andi.w     #$f, d0
07a766 cmp.w      d6, d0
07a768 bpl.b      $7a75e
07a76a move.w     d0, d6
07a76c rts        
07a76e lea.l      $7cda2(pc), a4
07a772 moveq      #$10, d6
07a774 bsr.b      $7a742
07a776 lsr.l      d6, d1
07a778 rts        
07a77a lea.l      $7cdb2(pc), a4
07a77e moveq      #$f, d6
07a780 bsr.b      $7a742
07a782 lsr.l      d6, d1
07a784 lsr.l      d6, d2
07a786 rts        
07a788 lea.l      $7cdd2(pc), a4
07a78c moveq      #$e, d6
07a78e bsr.b      $7a742
07a790 lsr.l      d6, d1
07a792 lsr.l      d6, d2
07a794 lsr.l      d6, d3
07a796 rts        
07a798 lea.l      $7ce02(pc), a4
07a79c moveq      #$d, d6
07a79e bsr.b      $7a742
07a7a0 lsr.l      d6, d1
07a7a2 lsr.l      d6, d2
07a7a4 lsr.l      d6, d3
07a7a6 lsr.l      d6, d4
07a7a8 rts        
07a7aa move.w     #$100, d0
07a7ae move.w     #$d0, d3
07a7b2 moveq      #$60, d7
07a7b4 move.w     #$1a, d6
07a7b8 bsr.w      $7a96c
07a7bc clr.w      d4
07a7be moveq      #$0, d5
07a7c0 moveq      #$a, d2
07a7c2 bsr.w      $7a9a6
07a7c6 rts        
07a7c8 move.w     #$200, d0
07a7cc move.w     #$cc, d3
07a7d0 moveq      #$40, d7
07a7d2 move.w     #$44, d6
07a7d6 bsr.w      $7a96c
07a7da clr.w      d4
07a7dc moveq      #$4, d5
07a7de moveq      #$a, d2
07a7e0 bsr.w      $7a9a6
07a7e4 moveq      #$2a, d4
07a7e6 moveq      #$8, d5
07a7e8 moveq      #$a, d2
07a7ea bsr.w      $7a9a6
07a7ee rts        
07a7f0 move.w     #$400, d0
07a7f4 move.w     #$dc, d3
07a7f8 moveq      #$20, d7
07a7fa move.w     #$6e, d6
07a7fe bsr.w      $7a96c
07a802 clr.w      d4
07a804 moveq      #$c, d5
07a806 moveq      #$a, d2
07a808 bsr.w      $7a9a6
07a80c moveq      #$2a, d4
07a80e moveq      #$10, d5
07a810 moveq      #$a, d2
07a812 bsr.w      $7a9a6
07a816 moveq      #$54, d4
07a818 moveq      #$14, d5
07a81a moveq      #$a, d2
07a81c bsr.w      $7a9a6
07a820 rts        
07a822 move.w     #$800, d0
07a826 move.w     #$130, d3
07a82a clr.w      d7
07a82c move.w     #$98, d6
07a830 bsr.w      $7a96c
07a834 clr.w      d4
07a836 moveq      #$18, d5
07a838 moveq      #$a, d2
07a83a bsr.w      $7a9a6
07a83e moveq      #$2a, d4
07a840 moveq      #$1c, d5
07a842 moveq      #$a, d2
07a844 bsr.w      $7a9a6
07a848 moveq      #$54, d4
07a84a moveq      #$20, d5
07a84c moveq      #$a, d2
07a84e bsr.w      $7a9a6
07a852 moveq      #$7e, d4
07a854 moveq      #$24, d5
07a856 moveq      #$a, d2
07a858 bsr.w      $7a9a6
07a85c rts        
07a85e movea.l    $2fee(a3), a0
07a862 lea.l      $2438(a3), a2
07a866 move.l     a0, (a2)+
07a868 move.w     #$14f, d7
07a86c moveq      #$0, d1
07a86e bsr.b      $7a8b6
07a870 move.w     d1, (a0)+
07a872 dbra       d7, $7a86c
07a876 move.w     #$143, d7
07a87a movea.l    -$4(a2), a1
07a87e move.w     (a1)+, (a0)+
07a880 dbra       d7, $7a87e
07a884 move.l     a0, $2fee(a3)
07a888 rts        
07a88a bsr.w      $78c64
07a88e andi.w     #$7, d0
07a892 move.w     d0, d5
07a894 add.w      d5, d5
07a896 move.w     (a4, d5.w), d1
07a89a move.w     $10(a4, d5.w), d2
07a89e move.w     $20(a4, d5.w), d3
07a8a2 move.w     $30(a4, d5.w), d4
07a8a6 bsr.w      $78c64
07a8aa andi.w     #$f, d0
07a8ae cmp.w      d6, d0
07a8b0 bpl.b      $7a8a6
07a8b2 move.w     d0, d6
07a8b4 rts        
07a8b6 lea.l      $7ce42(pc), a4
07a8ba moveq      #$10, d6
07a8bc bsr.b      $7a88a
07a8be lsr.l      d6, d1
07a8c0 rts        
07a8c2 rts        
07a8c4 move.w     #$200, d0
07a8c8 move.w     #$d0, d3
07a8cc moveq      #$40, d7
07a8ce move.w     #$1a, d6
07a8d2 bsr.w      $7a96c
07a8d6 clr.w      d4
07a8d8 moveq      #$0, d5
07a8da moveq      #$c, d2
07a8dc bsr.w      $7a9a6
07a8e0 moveq      #$2a, d4
07a8e2 moveq      #$0, d5
07a8e4 moveq      #$b, d2
07a8e6 bsr.w      $7a9a6
07a8ea rts        
07a8ec move.w     #$400, d0
07a8f0 move.w     #$cc, d3
07a8f4 moveq      #$20, d7
07a8f6 move.w     #$44, d6
07a8fa bsr.b      $7a96c
07a8fc clr.w      d4
07a8fe moveq      #$0, d5
07a900 moveq      #$c, d2
07a902 bsr.w      $7a9a6
07a906 moveq      #$2a, d4
07a908 moveq      #$0, d5
07a90a moveq      #$c, d2
07a90c bsr.w      $7a9a6
07a910 moveq      #$54, d4
07a912 moveq      #$0, d5
07a914 moveq      #$c, d2
07a916 bsr.w      $7a9a6
07a91a moveq      #$7e, d4
07a91c moveq      #$0, d5
07a91e moveq      #$b, d2
07a920 bsr.w      $7a9a6
07a924 rts        
07a926 move.w     #$600, d0
07a92a move.w     #$dc, d3
07a92e clr.w      d7
07a930 move.w     #$6e, d6
07a934 bsr.b      $7a96c
07a936 clr.w      d4
07a938 moveq      #$0, d5
07a93a moveq      #$c, d2
07a93c bsr.b      $7a9a6
07a93e moveq      #$2a, d4
07a940 moveq      #$0, d5
07a942 moveq      #$c, d2
07a944 bsr.b      $7a9a6
07a946 moveq      #$54, d4
07a948 moveq      #$0, d5
07a94a moveq      #$c, d2
07a94c bsr.b      $7a9a6
07a94e moveq      #$7e, d4
07a950 moveq      #$0, d5
07a952 moveq      #$c, d2
07a954 bsr.b      $7a9a6
07a956 move.w     #$a8, d4
07a95a moveq      #$0, d5
07a95c moveq      #$b, d2
07a95e bsr.b      $7a9a6
07a960 move.w     #$d2, d4
07a964 moveq      #$0, d5
07a966 moveq      #$b, d2
07a968 bsr.b      $7a9a6
07a96a rts        
07a96c asl.w      #$3, d7
07a96e lea.l      -$2278(a3), a0
07a972 move.w     $4(a0, d7.w), d7
07a976 mulu.w     $2cf8(a3), d0
07a97a lsr.l      #$8, d0
07a97c divu.w     d3, d0
07a97e swap       d0
07a980 move.w     d3, d1
07a982 sub.w      d0, d1
07a984 move.w     d1, d0
07a986 mulu.w     #$2a, d0
07a98a divu.w     d6, d0
07a98c swap       d0
07a98e move.w     d0, d1
07a990 swap       d0
07a992 tst.w      d1
07a994 beq.b      $7a998
07a996 addq.w     #$1, d0
07a998 move.w     d0, d1
07a99a mulu.w     d6, d1
07a99c divu.w     #$2a, d1
07a9a0 swap       d1
07a9a2 add.w      d0, d0
07a9a4 rts        
07a9a6 lea.l      $2438(a3), a1
07a9aa movea.l    (a1, d5.w), a1
07a9ae adda.w     d0, a1
07a9b0 move.w     d7, d3
07a9b2 lea.l      -$3d6a(a3), a0
07a9b6 add.w      d3, d3
07a9b8 move.w     (a0, d3.w), d3
07a9bc ext.l      d3
07a9be sub.w      d4, d3
07a9c0 bmi.b      $7aa0e
07a9c2 ext.l      d3
07a9c4 divu.w     d6, d3
07a9c6 beq.b      $7aa0e
07a9c8 asl.w      #$6, d3
07a9ca addq.w     #$1, d3
07a9cc movea.l    $2f74(a3), a0
07a9d0 adda.w     d1, a0
07a9d2 adda.w     d4, a0
07a9d4 adda.l     $2eac(a3), a0
07a9d8 move.w     d2, (a4)+
07a9da move.w     d6, d2
07a9dc subq.w     #$2, d2
07a9de move.w     d2, (a4)+
07a9e0 move.w     d2, (a4)+
07a9e2 move.l     #$20d0, d2
07a9e8 move.l     a0, (a4)+
07a9ea move.l     a0, (a4)+
07a9ec move.l     a1, (a4)+
07a9ee move.w     d3, (a4)+
07a9f0 adda.w     d2, a0
07a9f2 move.l     a0, (a4)+
07a9f4 move.l     a0, (a4)+
07a9f6 move.l     a1, (a4)+
07a9f8 move.w     d3, (a4)+
07a9fa adda.w     d2, a0
07a9fc move.l     a0, (a4)+
07a9fe move.l     a0, (a4)+
07aa00 move.l     a1, (a4)+
07aa02 move.w     d3, (a4)+
07aa04 adda.w     d2, a0
07aa06 move.l     a0, (a4)+
07aa08 move.l     a0, (a4)+
07aa0a move.l     a1, (a4)+
07aa0c move.w     d3, (a4)+
07aa0e rts        
07aa10 move.w     #$2000, d2
07aa14 movea.l    #$56, a2
07aa1a movea.l    #$64746, a0
07aa20 moveq      #$8, d0
07aa22 moveq      #$8, d1
07aa24 bsr.w      $7ab4c
07aa28 move.w     #$2000, d2
07aa2c movea.l    #$1fa, a2
07aa32 movea.l    #$64946, a0
07aa38 moveq      #$6, d0
07aa3a moveq      #$d, d1
07aa3c bsr.w      $7ab4c
07aa40 move.w     #$2000, d2
07aa44 movea.l    #$470, a2
07aa4a movea.l    #$64bb6, a0
07aa50 moveq      #$4, d0
07aa52 moveq      #$10, d1
07aa54 bsr.w      $7ab4c
07aa58 move.w     #$e000, d2
07aa5c movea.l    #$74, a2
07aa62 movea.l    #$64846, a0
07aa68 moveq      #$8, d0
07aa6a moveq      #$8, d1
07aa6c bsr.w      $7ab4c
07aa70 move.w     #$e000, d2
07aa74 movea.l    #$21a, a2
07aa7a movea.l    #$64a7e, a0
07aa80 moveq      #$6, d0
07aa82 move.w     $2f6e(a3), d1
07aa86 bsr.w      $7ab2e
07aa8a move.w     #$e000, d2
07aa8e movea.l    #$492, a2
07aa94 movea.l    #$64cb6, a0
07aa9a moveq      #$4, d0
07aa9c moveq      #$10, d1
07aa9e bsr.w      $7ab4c
07aaa2 rts        
07aaa4 move.w     #$2000, d2
07aaa8 movea.l    #$1016, a2
07aaae movea.l    #$640d6, a0
07aab4 moveq      #$8, d0
07aab6 moveq      #$8, d1
07aab8 bsr.w      $7ab4c
07aabc move.w     #$2000, d2
07aac0 movea.l    #$11ba, a2
07aac6 movea.l    #$642d6, a0
07aacc moveq      #$6, d0
07aace moveq      #$d, d1
07aad0 bsr.b      $7ab4c
07aad2 move.w     #$2000, d2
07aad6 movea.l    #$1430, a2
07aadc movea.l    #$64546, a0
07aae2 moveq      #$4, d0
07aae4 moveq      #$10, d1
07aae6 bsr.b      $7ab4c
07aae8 move.w     #$e000, d2
07aaec movea.l    #$1034, a2
07aaf2 movea.l    #$641d6, a0
07aaf8 moveq      #$8, d0
07aafa moveq      #$8, d1
07aafc bsr.b      $7ab4c
07aafe move.w     #$e000, d2
07ab02 movea.l    #$11da, a2
07ab08 movea.l    #$6440e, a0
07ab0e moveq      #$6, d0
07ab10 move.w     $2f6e(a3), d1
07ab14 bsr.b      $7ab2e
07ab16 move.w     #$e000, d2
07ab1a movea.l    #$1452, a2
07ab20 movea.l    #$64646, a0
07ab26 moveq      #$4, d0
07ab28 moveq      #$10, d1
07ab2a bsr.b      $7ab4c
07ab2c rts        
07ab2e moveq      #$d, d4
07ab30 tst.w      d1
07ab32 bne.b      $7ab4e
07ab34 moveq      #$1, d1
07ab36 move.w     d1, d4
07ab38 adda.l     $2f74(a3), a2
07ab3c move.w     d2, d3
07ab3e ori.w      #$7ca, d3
07ab42 move.w     d3, (a4)+
07ab44 move.w     d2, (a4)+
07ab46 ori.w      #$30a, d2
07ab4a bra.b      $7ab60
07ab4c move.w     d1, d4
07ab4e adda.l     $2f74(a3), a2
07ab52 move.w     d2, d3
07ab54 ori.w      #$fca, d3
07ab58 move.w     d3, (a4)+
07ab5a move.w     d2, (a4)+
07ab5c ori.w      #$b0a, d2
07ab60 moveq      #$28, d5
07ab62 sub.w      d0, d5
07ab64 move.w     d5, (a4)+
07ab66 move.w     d5, (a4)+
07ab68 move.w     d4, d5
07ab6a mulu.w     d0, d5
07ab6c movea.l    a0, a1
07ab6e adda.w     d5, a0
07ab70 adda.w     d5, a0
07ab72 adda.w     d5, a0
07ab74 asl.w      #$6, d1
07ab76 lsr.w      #$1, d0
07ab78 add.w      d0, d1
07ab7a addq.w     #$1, d1
07ab7c move.w     #$20d0, d4
07ab80 move.l     a0, (a4)+
07ab82 move.l     a1, (a4)+
07ab84 move.l     a2, (a4)+
07ab86 move.l     a2, (a4)+
07ab88 move.w     d1, (a4)+
07ab8a adda.w     d5, a1
07ab8c adda.w     d4, a2
07ab8e move.l     a0, (a4)+
07ab90 move.l     a1, (a4)+
07ab92 move.l     a2, (a4)+
07ab94 move.l     a2, (a4)+
07ab96 move.w     d1, (a4)+
07ab98 adda.w     d5, a1
07ab9a adda.w     d4, a2
07ab9c move.l     a0, (a4)+
07ab9e move.l     a1, (a4)+
07aba0 move.l     a2, (a4)+
07aba2 move.l     a2, (a4)+
07aba4 move.w     d1, (a4)+
07aba6 adda.w     d5, a1
07aba8 adda.w     d4, a2
07abaa move.w     d2, (a4)+
07abac move.l     a0, (a4)+
07abae move.l     a2, (a4)+
07abb0 move.l     a2, (a4)+
07abb2 move.w     d1, (a4)+
07abb4 rts        
07abb6 move.l     $303e(a3), d4
07abba move.l     $3112(a3), d1
07abbe move.l     $2e3a(a3), d2
07abc2 move.l     $2e42(a3), d3
07abc6 sub.l      d4, d1
07abc8 sub.l      d4, d2
07abca sub.l      d4, d3
07abcc cmp.l      d1, d2
07abce bcs.b      $7abd6
07abd0 cmp.l      d1, d3
07abd2 bcs.b      $7abe8
07abd4 bra.b      $7abdc
07abd6 cmp.l      d2, d3
07abd8 bcs.b      $7abe8
07abda bra.b      $7abe2
07abdc move.l     d1, d4
07abde moveq      #$2, d1
07abe0 bra.b      $7abec
07abe2 move.l     d2, d4
07abe4 moveq      #$3, d1
07abe6 bra.b      $7abec
07abe8 move.l     d3, d4
07abea moveq      #$4, d1
07abec cmp.l      #$40000, d4
07abf2 bcs.b      $7abf6
07abf4 clr.w      d1
07abf6 rts        
07abf8 move.l     $3112(a3), d4
07abfc move.l     $303e(a3), d1
07ac00 move.l     $2e3a(a3), d2
07ac04 move.l     $2e42(a3), d3
07ac08 sub.l      d4, d1
07ac0a sub.l      d4, d2
07ac0c sub.l      d4, d3
07ac0e cmp.l      d1, d2
07ac10 bcs.b      $7ac18
07ac12 cmp.l      d1, d3
07ac14 bcs.b      $7ac2a
07ac16 bra.b      $7ac1e
07ac18 cmp.l      d2, d3
07ac1a bcs.b      $7ac2a
07ac1c bra.b      $7ac24
07ac1e move.l     d1, d4
07ac20 moveq      #$1, d1
07ac22 bra.b      $7ac2e
07ac24 move.l     d2, d4
07ac26 moveq      #$3, d1
07ac28 bra.b      $7ac2e
07ac2a move.l     d3, d4
07ac2c moveq      #$4, d1
07ac2e cmp.l      #$40000, d4
07ac34 bcs.b      $7ac38
07ac36 clr.w      d1
07ac38 rts        
07ac3a moveq      #$ff, d0
07ac3c tst.w      $2f88(a3)
07ac40 beq.b      $7ac48
07ac42 moveq      #$2, d0
07ac44 bra.w      $7acfa
07ac48 tst.w      $1a(a2)
07ac4c beq.b      $7ac68
07ac4e moveq      #$6, d0
07ac50 cmpi.w     #$2, $1a(a2)
07ac56 beq.w      $7acfa
07ac5a tst.l      $20(a2)
07ac5e bne.w      $7acfa
07ac62 clr.w      d0
07ac64 bra.w      $7acfa
07ac68 tst.w      $bc(a2)
07ac6c beq.b      $7ac80
07ac6e bsr.w      $7acfc
07ac72 moveq      #$7, d0
07ac74 lea.l      $303e(a3), a0
07ac78 cmpa.l     a0, a2
07ac7a beq.b      $7ac7e
07ac7c moveq      #$8, d0
07ac7e bra.b      $7acfa
07ac80 tst.w      $c6(a2)
07ac84 beq.b      $7ac8a
07ac86 moveq      #$9, d0
07ac88 bra.b      $7acfa
07ac8a tst.w      $a8(a2)
07ac8e beq.b      $7ac9e
07ac90 move.w     $a8(a2), d1
07ac94 andi.w     #$8, d1
07ac98 beq.b      $7acfa
07ac9a moveq      #$1, d0
07ac9c bra.b      $7acfa
07ac9e move.w     $2f8a(a3), d1
07aca2 cmp.w      #$ff6a, d1
07aca6 bmi.b      $7acfa
07aca8 cmp.w      #$ff9c, d1
07acac bmi.b      $7acce
07acae cmp.w      #$ffb5, d1
07acb2 bmi.b      $7acfa
07acb4 cmp.w      #$ffe7, d1
07acb8 bmi.b      $7acca
07acba cmp.w      #$0, d1
07acbe bmi.b      $7acfa
07acc0 cmp.w      #$64, d1
07acc4 bpl.b      $7acd2
07acc6 moveq      #$5, d0
07acc8 bra.b      $7acfa
07acca moveq      #$4, d0
07accc bra.b      $7acfa
07acce moveq      #$3, d0
07acd0 bra.b      $7acfa
07acd2 cmp.w      #$fa, d1
07acd6 bmi.b      $7acfa
07acd8 tst.w      $2f40(a3)
07acdc bne.b      $7acfa
07acde lea.l      $303e(a3), a0
07ace2 cmpa.l     a0, a2
07ace4 beq.b      $7acec
07ace6 bsr.w      $7abf8
07acea bra.b      $7acf0
07acec bsr.w      $7abb6
07acf0 tst.w      d1
07acf2 beq.b      $7acfa
07acf4 move.w     d1, d0
07acf6 addi.w     #$9, d0
07acfa rts        
07acfc move.w     $bc(a2), d0
07ad00 ext.l      d0
07ad02 divu.w     #$5, d0
07ad06 cmp.w      #$63, d0
07ad0a bmi.b      $7ad0e
07ad0c moveq      #$63, d0
07ad0e ext.l      d0
07ad10 divu.w     #$a, d0
07ad14 lea.l      $64dfc.l, a0
07ad1a lea.l      $303e(a3), a1
07ad1e cmpa.l     a1, a2
07ad20 beq.b      $7ad28
07ad22 lea.l      $64e5c.l, a0
07ad28 lea.l      $64e0c.l, a1
07ad2e adda.w     d0, a1
07ad30 move.l     a0, -(a7)
07ad32 moveq      #$1a, d7
07ad34 move.b     (a1), (a0)
07ad36 adda.w     #$a8, a0
07ad3a adda.w     #$a8, a1
07ad3e dbra       d7, $7ad34
07ad42 movea.l    (a7)+, a0
07ad44 addq.l     #$1, a0
07ad46 swap       d0
07ad48 lea.l      $64e0c.l, a1
07ad4e adda.w     d0, a1
07ad50 moveq      #$1a, d7
07ad52 move.b     (a1), (a0)
07ad54 adda.w     #$a8, a0
07ad58 adda.w     #$a8, a1
07ad5c dbra       d7, $7ad52
07ad60 rts        
07ad62 lea.l      $28c8(a3), a0
07ad66 moveq      #$60, d0
07ad68 move.b     #$31, d2
07ad6c bsr.b      $7ad98
07ad6e lea.l      $28bc(a3), a0
07ad72 moveq      #$70, d0
07ad74 move.b     #$32, d2
07ad78 bsr.b      $7ad98
07ad7a lea.l      $28d4(a3), a0
07ad7e move.w     #$80, d0
07ad82 move.b     #$33, d2
07ad86 bsr.b      $7ad98
07ad88 lea.l      $28e0(a3), a0
07ad8c move.w     #$90, d0
07ad90 move.b     #$34, d2
07ad94 bsr.b      $7ad98
07ad96 rts        
07ad98 lea.l      $2ffe(a3), a2
07ad9c movea.l    a0, a1
07ad9e adda.w     #$a, a0
07ada2 moveq      #$a, d7
07ada4 move.b     -(a0), d1
07ada6 cmp.b      #$20, d1
07adaa bne.b      $7adc8
07adac subq.w     #$1, d7
07adae bne.b      $7ada4
07adb0 move.w     #$4, d7
07adb4 move.b     #$70, (a2)+
07adb8 move.b     #$6c, (a2)+
07adbc move.b     #$79, (a2)+
07adc0 move.b     d2, (a2)+
07adc2 moveq      #$6, d6
07adc4 movea.l    a1, a0
07adc6 bra.b      $7add4
07adc8 moveq      #$a, d6
07adca sub.l      d7, d6
07adcc movea.l    a1, a0
07adce move.b     (a0)+, (a2)+
07add0 subq.w     #$1, d7
07add2 bne.b      $7adce
07add4 moveq      #$0, d2
07add6 move.b     #$20, (a2)+
07adda move.b     #$61, (a2)+
07adde move.b     #$68, (a2)+
07ade2 move.b     #$65, (a2)+
07ade6 move.b     #$61, (a2)+
07adea move.b     #$64, (a2)+
07adee bra.b      $7adf6
07adf0 move.b     #$20, (a2)+
07adf4 addq.w     #$1, d2
07adf6 dbra       d6, $7adf0
07adfa move.w     d2, -(a7)
07adfc lea.l      $2ffe(a3), a0
07ae00 moveq      #$f, d7
07ae02 lea.l      $64db6.l, a2
07ae08 adda.w     d0, a2
07ae0a move.b     (a0)+, d0
07ae0c lea.l      $3f386.l, a1
07ae12 andi.w     #$ff, d0
07ae16 move.w     d0, d1
07ae18 andi.w     #$1f, d1
07ae1c adda.w     d1, a1
07ae1e andi.w     #$ffe0, d0
07ae22 mulu.w     #$9, d0
07ae26 adda.w     d0, a1
07ae28 moveq      #$8, d6
07ae2a move.b     $900(a1), d2
07ae2e move.b     $480(a1), d1
07ae32 move.b     (a1), d0
07ae34 move.b     d2, d3
07ae36 not.b      d3
07ae38 move.b     d3, $bd0(a2)
07ae3c move.b     d0, $0(a2)
07ae40 eor.b      d0, d1
07ae42 move.b     d1, $5e8(a2)
07ae46 adda.w     #$a8, a2
07ae4a adda.w     #$20, a1
07ae4e dbra       d6, $7ae2a
07ae52 suba.w     #$5e7, a2
07ae56 dbra       d7, $7ae0a
07ae5a suba.w     #$10, a2
07ae5e move.w     (a7)+, d2
07ae60 beq.b      $7aed6
07ae62 asl.w      #$2, d2
07ae64 subq.w     #$1, d2
07ae66 moveq      #$8, d3
07ae68 lsr.w      (a2)
07ae6a roxr.w     $2(a2)
07ae6e roxr.w     $4(a2)
07ae72 roxr.w     $6(a2)
07ae76 roxr.w     $8(a2)
07ae7a roxr.w     $a(a2)
07ae7e roxr.w     $c(a2)
07ae82 roxr.w     $e(a2)
07ae86 lsr.w      $5e8(a2)
07ae8a roxr.w     $5ea(a2)
07ae8e roxr.w     $5ec(a2)
07ae92 roxr.w     $5ee(a2)
07ae96 roxr.w     $5f0(a2)
07ae9a roxr.w     $5f2(a2)
07ae9e roxr.w     $5f4(a2)
07aea2 roxr.w     $5f6(a2)
07aea6 lsr.w      $bd0(a2)
07aeaa roxr.w     $bd2(a2)
07aeae roxr.w     $bd4(a2)
07aeb2 roxr.w     $bd6(a2)
07aeb6 roxr.w     $bd8(a2)
07aeba roxr.w     $bda(a2)
07aebe roxr.w     $bdc(a2)
07aec2 roxr.w     $bde(a2)
07aec6 adda.w     #$a8, a2
07aeca dbra       d3, $7ae68
07aece suba.w     #$5e8, a2
07aed2 dbra       d2, $7ae66
07aed6 rts        
07aed8 ori.b      #$c, d0
07aedc ori.b      #$20, (a0)+
07aee0 ori.b      #$2c, $30(a0)
07aee6 ori.w      #$a0, d0
07aeea .byte      0x00, 0x48
07aeec ori.w      #$70, -(a0)
07aef0 ori.l      #$90000c, d0
07aef6 .byte      0x00, 0x0c
07aef8 .byte      0x00, 0x08
07aefa .byte      0x00, 0x08
07aefc ori.b      #$4, d4
07af00 ori.b      #$8, (a0)
07af04 .byte      0x00, 0x08
07af06 .byte      0x00, 0x0c
07af08 ori.b      #$10, (a0)
07af0c ori.b      #$10, (a0)
07af10 lea.l      $303e(a3), a2
07af14 bsr.w      $7ac3a
07af18 moveq      #$0, d3
07af1a bra.b      $7af28
07af1c lea.l      $3112(a3), a2
07af20 bsr.w      $7ac3a
07af24 move.w     #$fc0, d3
07af28 tst.w      d0
07af2a bmi.w      $7afb0
07af2e lea.l      $7aed8(pc), a0
07af32 add.w      d0, d0
07af34 move.w     $1c(a0, d0.w), d1
07af38 move.w     (a0, d0.w), d0
07af3c moveq      #$28, d2
07af3e sub.w      d1, d2
07af40 lsr.w      #$1, d2
07af42 andi.w     #$fffe, d2
07af46 moveq      #$2a, d5
07af48 sub.w      d1, d5
07af4a move.w     #$a8, d6
07af4e sub.w      d1, d6
07af50 move.w     d5, (a4)+
07af52 move.w     d6, (a4)+
07af54 move.w     d6, (a4)+
07af56 move.w     d5, (a4)+
07af58 movea.l    $2f74(a3), a2
07af5c adda.w     d2, a2
07af5e adda.w     d3, a2
07af60 adda.w     #$1fa, a2
07af64 lea.l      $64db6.l, a0
07af6a adda.w     d0, a0
07af6c movea.l    a0, a1
07af6e adda.w     #$bd0, a0
07af72 lsr.w      #$1, d1
07af74 ori.w      #$240, d1
07af78 move.w     #$20d0, d4
07af7c move.l     a0, (a4)+
07af7e move.l     a1, (a4)+
07af80 move.l     a2, (a4)+
07af82 move.l     a2, (a4)+
07af84 move.w     d1, (a4)+
07af86 adda.w     #$5e8, a1
07af8a adda.w     d4, a2
07af8c move.l     a0, (a4)+
07af8e move.l     a2, (a4)+
07af90 move.l     a2, (a4)+
07af92 move.w     d1, (a4)+
07af94 adda.w     d4, a2
07af96 move.l     a0, (a4)+
07af98 move.l     a1, (a4)+
07af9a move.l     a2, (a4)+
07af9c move.l     a2, (a4)+
07af9e move.w     d1, (a4)+
07afa0 adda.w     #$5e8, a1
07afa4 adda.w     d4, a2
07afa6 move.l     a0, (a4)+
07afa8 move.l     a2, (a4)+
07afaa move.l     a2, (a4)+
07afac move.w     d1, (a4)+
07afae rts        
07afb0 moveq      #$0, d0
07afb2 move.l     d0, (a4)+
07afb4 rts        
07afb6 lea.l      -$1e78(a3), a1
07afba move.l     $303e(a3), d0
07afbe tst.w      $3038(a3)
07afc2 beq.b      $7afce
07afc4 cmp.l      $3112(a3), d0
07afc8 bcc.b      $7afce
07afca move.l     $3112(a3), d0
07afce lea.l      -$3e46(a3), a0
07afd2 move.l     #$4000, d6
07afd8 move.w     #$9, d7
07afdc move.l     (a0), d3
07afde move.w     $4(a0), d4
07afe2 move.w     $6(a0), d5
07afe6 move.l     $8(a0), d2
07afea move.l     d2, d1
07afec swap       d1
07afee add.w      $2f9a(a3), d1
07aff2 move.w     d1, d0
07aff4 sub.w      d5, d0
07aff6 lsr.w      #$7, d0
07aff8 addq.w     #$1, d0
07affa add.w      d0, d5
07affc cmp.w      d5, d1
07affe bcc.b      $7b002
07b000 move.w     d1, d5
07b002 move.l     d3, d0
07b004 swap       d0
07b006 asl.w      #$4, d0
07b008 move.b     $f(a1, d0.w), d1
07b00c move.b     $e(a1, d0.w), d0
07b010 ext.w      d1
07b012 ext.w      d0
07b014 asl.w      #$4, d1
07b016 asl.w      #$4, d0
07b018 cmp.w      d1, d4
07b01a bpl.b      $7b02e
07b01c cmp.w      d0, d4
07b01e bmi.b      $7b024
07b020 add.w      d2, d4
07b022 bra.b      $7b036
07b024 addq.w     #$4, d4
07b026 tst.w      d2
07b028 bpl.b      $7b036
07b02a neg.w      d2
07b02c bra.b      $7b036
07b02e subq.w     #$4, d4
07b030 tst.w      d2
07b032 bmi.b      $7b036
07b034 neg.w      d2
07b036 move.w     d5, d0
07b038 ext.l      d0
07b03a add.l      d0, d3
07b03c cmp.w      #$9, d7
07b040 beq.b      $7b064
07b042 move.l     -$c(a0), d0
07b046 sub.l      d6, d0
07b048 cmp.l      d3, d0
07b04a bcc.b      $7b08e
07b04c move.l     d0, d3
07b04e move.w     d5, d0
07b050 move.w     -$6(a0), d5
07b054 move.w     d0, -$6(a0)
07b058 move.l     d2, d0
07b05a move.l     -$4(a0), d2
07b05e move.l     d0, -$4(a0)
07b062 bra.b      $7b08e
07b064 move.l     $6c(a0), d0
07b068 subi.l     #$80000, d0
07b06e addi.l     #$400000, d0
07b074 cmp.l      d3, d0
07b076 bcc.b      $7b08e
07b078 move.l     d0, d3
07b07a move.w     d5, d0
07b07c move.w     $72(a0), d5
07b080 move.w     d0, $72(a0)
07b084 move.l     d2, d0
07b086 move.l     $74(a0), d2
07b08a move.l     d0, $74(a0)
07b08e move.l     d3, (a0)+
07b090 move.w     d4, (a0)+
07b092 move.w     d5, (a0)+
07b094 move.l     d2, (a0)+
07b096 dbra       d7, $7afdc
07b09a rts        
07b09c clr.w      $2eec(a3)
07b0a0 move.l     $30c2(a3), $2fb0(a3)
07b0a6 lea.l      -$4098(a3), a0
07b0aa move.w     $30c2(a3), d1
07b0ae asl.w      #$4, d1
07b0b0 lea.l      -$1e78(a3), a1
07b0b4 adda.w     d1, a1
07b0b6 adda.w     #$8a, a1
07b0ba moveq      #$8, d6
07b0bc move.l     -(a1), -(a0)
07b0be move.l     -(a1), -(a0)
07b0c0 subq.l     #$8, a1
07b0c2 dbra       d6, $7b0bc
07b0c6 move.l     $30c2(a3), d1
07b0ca clr.w      d1
07b0cc addi.l     #$90000, d1
07b0d2 sub.l      $30c2(a3), d1
07b0d6 asl.l      #$4, d1
07b0d8 move.w     d1, $2fae(a3)
07b0dc swap       d1
07b0de lea.l      -$4098(a3), a2
07b0e2 move.w     d1, d0
07b0e4 andi.w     #$3, d0
07b0e8 ori.w      #$7c, d0
07b0ec move.w     d0, $2f1c(a3)
07b0f0 sub.w      d0, d1
07b0f2 lsr.w      #$1, d1
07b0f4 suba.w     d1, a2
07b0f6 move.w     #$8, $2efa(a3)
07b0fc tst.w      $2de8(a3)
07b100 bne.b      $7b106
07b102 clr.w      $2efa(a3)
07b106 move.w     #$a, $2f26(a3)
07b10c move.w     #$4, $2f28(a3)
07b112 lea.l      -$4098(a3), a0
07b116 tst.w      $2dd8(a3)
07b11a beq.w      $7b1c0
07b11e move.w     $2ea2(a3), d0
07b122 lsr.w      #$8, d0
07b124 move.w     d0, $2fbc(a3)
07b128 clr.w      $2eb0(a3)
07b12c suba.l     #$40, a2
07b132 moveq      #$1f, d7
07b134 move.w     $2f1c(a3), d6
07b138 andi.w     #$3, d6
07b13c subq.w     #$4, d6
07b13e add.w      d6, d6
07b140 move.w     $30b6(a3), d1
07b144 beq.b      $7b14a
07b146 clr.w      d2
07b148 bra.b      $7b188
07b14a move.w     (a2)+, d0
07b14c andi.w     #$ff00, d0
07b150 cmp.w      #$fc00, d0
07b154 bne.b      $7b180
07b156 tst.w      d6
07b158 bmi.b      $7b178
07b15a lea.l      $4b7e(a3), a1
07b15e move.w     (a1, d6.w), d2
07b162 asr.w      #$4, d2
07b164 asr.w      #$1, d2
07b166 lea.l      -$2278(a3), a1
07b16a asl.w      #$2, d6
07b16c sub.w      $2(a1, d6.w), d2
07b170 asr.w      #$2, d6
07b172 neg.w      d2
07b174 tst.w      d2
07b176 bpl.b      $7b17a
07b178 clr.w      d2
07b17a move.b     d2, -$1(a2)
07b17e bra.b      $7b19a
07b180 addq.w     #$8, d6
07b182 dbra       d7, $7b14a
07b186 bra.b      $7b1b8
07b188 move.w     (a2)+, d0
07b18a andi.w     #$ff00, d0
07b18e cmp.w      #$fd00, d0
07b192 bne.b      $7b19a
07b194 move.b     d2, -$1(a2)
07b198 bra.b      $7b180
07b19a addq.w     #$8, d6
07b19c dbra       d7, $7b188
07b1a0 addq.w     #$4, d6
07b1a2 move.w     #$fd00, d0
07b1a6 move.b     d2, d0
07b1a8 move.w     d0, $2f14(a3)
07b1ac move.w     #$1, $2eb0(a3)
07b1b2 move.w     d2, $2fbe(a3)
07b1b6 bra.b      $7b1ca
07b1b8 addq.w     #$4, d6
07b1ba move.w     d2, $2fbe(a3)
07b1be bra.b      $7b1c6
07b1c0 move.w     #$ffff, $2fbc(a3)
07b1c6 bsr.w      $7ba8c
07b1ca bsr.w      $7baae
07b1ce bsr.w      $7baee
07b1d2 bsr.w      $7bb6a
07b1d6 lea.l      $2eb6(a3), a1
07b1da bsr.w      $7bb36
07b1de move.w     #$ffe0, $2ea6(a3)
07b1e4 tst.w      $2ddc(a3)
07b1e8 beq.b      $7b1f0
07b1ea move.w     #$60, $2ea6(a3)
07b1f0 clr.l      $2eac(a3)
07b1f4 move.w     $2f1c(a3), d0
07b1f8 move.w     $2f1e(a3), d1
07b1fc move.w     $2f22(a3), d2
07b200 move.w     d0, d6
07b202 and.w      d1, d6
07b204 and.w      d2, d6
07b206 addq.w     #$1, d6
07b208 beq.w      $7b2ce
07b20c cmp.w      d0, d1
07b20e bpl.b      $7b216
07b210 cmp.w      d2, d0
07b212 bpl.b      $7b21c
07b214 bra.b      $7b292
07b216 cmp.w      d2, d1
07b218 bpl.b      $7b256
07b21a bra.b      $7b292
07b21c cmp.w      $2ea6(a3), d0
07b220 bpl.b      $7b226
07b222 bsr.w      $7b918
07b226 cmp.w      $2fbc(a3), d0
07b22a bgt.b      $7b230
07b22c bsr.w      $7ba0c
07b230 cmp.w      $2f00(a3), d0
07b234 bgt.b      $7b244
07b236 movem.l    d0-d2, -(a7)
07b23a bsr.w      $7bc72
07b23e movem.l    (a7)+, d0-d2
07b242 bra.b      $7b230
07b244 movem.l    a0-a2, -(a7)
07b248 bsr.w      $7bbdc
07b24c movem.l    (a7)+, a0-a2
07b250 bsr.w      $7ba8c
07b254 bra.b      $7b1f4
07b256 cmp.w      $2ea6(a3), d1
07b25a bpl.b      $7b260
07b25c bsr.w      $7b918
07b260 cmp.w      $2fbc(a3), d1
07b264 bgt.b      $7b26a
07b266 bsr.w      $7ba0c
07b26a cmp.w      $2f00(a3), d1
07b26e bgt.b      $7b27e
07b270 movem.l    d0-d2, -(a7)
07b274 bsr.w      $7bc72
07b278 movem.l    (a7)+, d0-d2
07b27c bra.b      $7b26a
07b27e movem.l    a0-a2, -(a7)
07b282 bsr.w      $7bc44
07b286 movem.l    (a7)+, a0-a2
07b28a bsr.w      $7baae
07b28e bra.w      $7b1f4
07b292 cmp.w      $2ea6(a3), d2
07b296 bpl.b      $7b29c
07b298 bsr.w      $7b918
07b29c cmp.w      $2fbc(a3), d2
07b2a0 bgt.b      $7b2a6
07b2a2 bsr.w      $7ba0c
07b2a6 cmp.w      $2f00(a3), d2
07b2aa bgt.b      $7b2ba
07b2ac movem.l    d0-d2, -(a7)
07b2b0 bsr.w      $7bc72
07b2b4 movem.l    (a7)+, d0-d2
07b2b8 bra.b      $7b2a6
07b2ba movem.l    a0-a2, -(a7)
07b2be bsr.w      $7bd30
07b2c2 movem.l    (a7)+, a0-a2
07b2c6 bsr.w      $7bb36
07b2ca bra.w      $7b1f4
07b2ce tst.w      $3058(a3)
07b2d2 bne.b      $7b336
07b2d4 moveq      #$0, d7
07b2d6 tst.w      $2f88(a3)
07b2da bne.b      $7b2ea
07b2dc move.w     $304c(a3), d7
07b2e0 cmp.w      #$800, d7
07b2e4 bmi.b      $7b2ea
07b2e6 move.w     #$800, d7
07b2ea add.w      $310e(a3), d7
07b2ee cmp.w      #$1800, d7
07b2f2 bmi.b      $7b2f8
07b2f4 subi.w     #$1800, d7
07b2f8 move.w     d7, $310e(a3)
07b2fc lsr.w      #$8, d7
07b2fe lsr.w      #$3, d7
07b300 move.w     $304e(a3), d1
07b304 neg.w      d1
07b306 addi.w     #$20, d1
07b30a lsr.w      #$3, d1
07b30c add.w      d1, d7
07b30e add.w      d1, d7
07b310 add.w      d1, d7
07b312 suba.l     a2, a2
07b314 clr.w      d1
07b316 move.w     $2ef4(a3), d2
07b31a subq.w     #$1, d2
07b31c movea.l    $2624(a3), a1
07b320 clr.w      $2fac(a3)
07b324 move.w     #$ffff, $2fa6(a3)
07b32a movem.l    d0-d7/a0-a2, -(a7)
07b32e bsr.w      $7c358
07b332 movem.l    (a7)+, d0-d7/a0-a2
07b336 move.w     $30ea(a3), d7
07b33a beq.b      $7b38c
07b33c suba.l     a2, a2
07b33e move.w     $2f8a(a3), d7
07b342 lsr.w      #$2, d7
07b344 andi.w     #$3, d7
07b348 eori.w     #$3, d7
07b34c move.w     #$ffd2, d1
07b350 tst.w      $30e8(a3)
07b354 bmi.b      $7b35a
07b356 addq.w     #$4, d7
07b358 neg.w      d1
07b35a add.w      $30be(a3), d1
07b35e clr.w      d0
07b360 clr.w      d2
07b362 move.w     $30b8(a3), $2f04(a3)
07b368 move.w     $30be(a3), $2f06(a3)
07b36e move.l     $30ba(a3), $2f08(a3)
07b374 suba.l     a2, a2
07b376 movea.l    $2604(a3), a1
07b37a move.w     #$1400, d4
07b37e move.w     #$ffff, $2fa6(a3)
07b384 clr.w      $2fac(a3)
07b388 bsr.w      $7c104
07b38c suba.l     a2, a2
07b38e tst.w      $3058(a3)
07b392 bne.b      $7b3f2
07b394 move.w     $30fe(a3), d7
07b398 beq.b      $7b3f2
07b39a lsr.w      #$2, d7
07b39c tst.w      $3100(a3)
07b3a0 beq.b      $7b3a4
07b3a2 bpl.b      $7b3c6
07b3a4 moveq      #$d1, d1
07b3a6 move.w     $2e94(a3), d2
07b3aa subq.w     #$3, d2
07b3ac movea.l    $260c(a3), a1
07b3b0 clr.w      $2fac(a3)
07b3b4 move.w     #$ffff, $2fa6(a3)
07b3ba movem.l    d0-d7/a0-a2, -(a7)
07b3be bsr.w      $7c358
07b3c2 movem.l    (a7)+, d0-d7/a0-a2
07b3c6 tst.w      $3100(a3)
07b3ca bmi.b      $7b3f2
07b3cc addq.w     #$5, d7
07b3ce move.w     #$2f, d1
07b3d2 move.w     $2e94(a3), d2
07b3d6 subq.w     #$3, d2
07b3d8 movea.l    $260c(a3), a1
07b3dc clr.w      $2fac(a3)
07b3e0 move.w     #$ffff, $2fa6(a3)
07b3e6 movem.l    d0-d7/a0-a2, -(a7)
07b3ea bsr.w      $7c358
07b3ee movem.l    (a7)+, d0-d7/a0-a2
07b3f2 tst.w      $30fe(a3)
07b3f6 bne.b      $7b45a
07b3f8 tst.w      $3058(a3)
07b3fc bne.b      $7b45a
07b3fe cmpi.w     #$c00, $304c(a3)
07b404 bmi.b      $7b45a
07b406 tst.w      $2dec(a3)
07b40a bne.b      $7b424
07b40c tst.w      $2de6(a3)
07b410 bne.b      $7b41e
07b412 tst.w      $2de4(a3)
07b416 beq.b      $7b45a
07b418 movea.l    $2724(a3), a1
07b41c bra.b      $7b428
07b41e movea.l    $2758(a3), a1
07b422 bra.b      $7b428
07b424 movea.l    $262c(a3), a1
07b428 move.w     $2cf8(a3), d7
07b42c lsr.w      #$2, d7
07b42e ext.l      d7
07b430 divu.w     #$3, d7
07b434 swap       d7
07b436 move.w     $304e(a3), d1
07b43a neg.w      d1
07b43c asr.w      #$2, d1
07b43e move.w     $2e94(a3), d2
07b442 subq.w     #$2, d2
07b444 clr.w      $2fac(a3)
07b448 move.w     #$ffff, $2fa6(a3)
07b44e movem.l    d0-d7/a0-a2, -(a7)
07b452 bsr.w      $7c358
07b456 movem.l    (a7)+, d0-d7/a0-a2
07b45a tst.w      $304c(a3)
07b45e beq.b      $7b4d6
07b460 tst.w      $3102(a3)
07b464 beq.b      $7b4d6
07b466 tst.w      $3058(a3)
07b46a bne.b      $7b4d6
07b46c tst.w      $3108(a3)
07b470 bne.b      $7b4d6
07b472 tst.w      $2dec(a3)
07b476 bne.b      $7b4d6
07b478 tst.w      $2de6(a3)
07b47c bne.b      $7b4d6
07b47e tst.w      $2de4(a3)
07b482 bne.b      $7b4d6
07b484 move.w     $2cf8(a3), d7
07b488 lsr.w      #$2, d7
07b48a andi.w     #$3, d7
07b48e move.w     #$24, d1
07b492 move.w     $2e94(a3), d2
07b496 subq.w     #$2, d2
07b498 movea.l    $2608(a3), a1
07b49c clr.w      $2fac(a3)
07b4a0 move.w     #$ffff, $2fa6(a3)
07b4a6 movem.l    d0-d7/a0-a2, -(a7)
07b4aa bsr.w      $7c358
07b4ae movem.l    (a7)+, d0-d7/a0-a2
07b4b2 addq.w     #$4, d7
07b4b4 moveq      #$dc, d1
07b4b6 move.w     $2e94(a3), d2
07b4ba subq.w     #$2, d2
07b4bc movea.l    $2608(a3), a1
07b4c0 clr.w      $2fac(a3)
07b4c4 move.w     #$ffff, $2fa6(a3)
07b4ca movem.l    d0-d7/a0-a2, -(a7)
07b4ce bsr.w      $7c358
07b4d2 movem.l    (a7)+, d0-d7/a0-a2
07b4d6 rts        
07b4d8 clr.w      $2eec(a3)
07b4dc move.l     $3196(a3), $2fb0(a3)
07b4e2 lea.l      -$4098(a3), a0
07b4e6 move.w     $3196(a3), d1
07b4ea asl.w      #$4, d1
07b4ec lea.l      -$1e78(a3), a1
07b4f0 adda.w     d1, a1
07b4f2 adda.w     #$8a, a1
07b4f6 moveq      #$8, d6
07b4f8 move.l     -(a1), -(a0)
07b4fa move.l     -(a1), -(a0)
07b4fc subq.l     #$8, a1
07b4fe dbra       d6, $7b4f8
07b502 move.l     $3196(a3), d1
07b506 clr.w      d1
07b508 addi.l     #$90000, d1
07b50e sub.l      $3196(a3), d1
07b512 asl.l      #$4, d1
07b514 move.w     d1, $2fae(a3)
07b518 swap       d1
07b51a lea.l      -$4098(a3), a2
07b51e move.w     d1, d0
07b520 andi.w     #$3, d0
07b524 ori.w      #$7c, d0
07b528 move.w     d0, $2f1c(a3)
07b52c sub.w      d0, d1
07b52e lsr.w      #$1, d1
07b530 suba.w     d1, a2
07b532 move.w     #$8, $2efa(a3)
07b538 tst.w      $2de8(a3)
07b53c bne.b      $7b542
07b53e clr.w      $2efa(a3)
07b542 move.w     #$a, $2f26(a3)
07b548 move.w     #$4, $2f28(a3)
07b54e lea.l      -$4098(a3), a0
07b552 tst.w      $2dd8(a3)
07b556 beq.w      $7b5f8
07b55a move.w     $2ea4(a3), d0
07b55e lsr.w      #$8, d0
07b560 move.w     d0, $2fbc(a3)
07b564 clr.w      $2eb0(a3)
07b568 suba.l     #$40, a2
07b56e moveq      #$1f, d7
07b570 move.w     $2f1c(a3), d6
07b574 andi.w     #$3, d6
07b578 subq.w     #$4, d6
07b57a add.w      d6, d6
07b57c move.w     $318a(a3), d1
07b580 beq.b      $7b586
07b582 clr.w      d2
07b584 bra.b      $7b5c4
07b586 move.w     (a2)+, d0
07b588 andi.w     #$ff00, d0
07b58c cmp.w      #$fc00, d0
07b590 bne.b      $7b5bc
07b592 tst.w      d6
07b594 bmi.b      $7b5b4
07b596 lea.l      $4b7e(a3), a1
07b59a move.w     (a1, d6.w), d2
07b59e asr.w      #$4, d2
07b5a0 asr.w      #$1, d2
07b5a2 lea.l      -$2278(a3), a1
07b5a6 asl.w      #$2, d6
07b5a8 sub.w      $2(a1, d6.w), d2
07b5ac asr.w      #$2, d6
07b5ae neg.w      d2
07b5b0 tst.w      d2
07b5b2 bpl.b      $7b5b6
07b5b4 clr.w      d2
07b5b6 move.b     d2, -$1(a2)
07b5ba bra.b      $7b5d6
07b5bc addq.w     #$8, d6
07b5be dbra       d7, $7b586
07b5c2 bra.b      $7b5f2
07b5c4 move.w     (a2)+, d0
07b5c6 andi.w     #$ff00, d0
07b5ca cmp.w      #$fd00, d0
07b5ce bne.b      $7b5d6
07b5d0 move.b     d2, -$1(a2)
07b5d4 bra.b      $7b5bc
07b5d6 addq.w     #$8, d6
07b5d8 dbra       d7, $7b5c4
07b5dc move.w     #$fd00, d0
07b5e0 move.b     d2, d0
07b5e2 move.w     d0, $2f14(a3)
07b5e6 move.w     #$1, $2eb0(a3)
07b5ec move.w     d2, $2fbe(a3)
07b5f0 bra.b      $7b602
07b5f2 move.w     d2, $2fbe(a3)
07b5f6 bra.b      $7b5fe
07b5f8 move.w     #$ffff, $2fbc(a3)
07b5fe bsr.w      $7ba8c
07b602 bsr.w      $7baae
07b606 bsr.w      $7baee
07b60a bsr.w      $7bb6a
07b60e lea.l      $2eb6(a3), a1
07b612 bsr.w      $7bb36
07b616 move.w     #$ffe0, $2ea6(a3)
07b61c tst.w      $2ddc(a3)
07b620 beq.b      $7b628
07b622 move.w     #$60, $2ea6(a3)
07b628 move.l     #$fc0, $2eac(a3)
07b630 move.w     $2f1c(a3), d0
07b634 move.w     $2f1e(a3), d1
07b638 move.w     $2f22(a3), d2
07b63c move.w     d0, d6
07b63e and.w      d1, d6
07b640 and.w      d2, d6
07b642 addq.w     #$1, d6
07b644 beq.w      $7b70a
07b648 cmp.w      d0, d1
07b64a bpl.b      $7b652
07b64c cmp.w      d2, d0
07b64e bpl.b      $7b658
07b650 bra.b      $7b6ce
07b652 cmp.w      d2, d1
07b654 bpl.b      $7b692
07b656 bra.b      $7b6ce
07b658 cmp.w      $2ea6(a3), d0
07b65c bpl.b      $7b662
07b65e bsr.w      $7b918
07b662 cmp.w      $2fbc(a3), d0
07b666 bgt.b      $7b66c
07b668 bsr.w      $7ba4c
07b66c cmp.w      $2f00(a3), d0
07b670 bgt.b      $7b680
07b672 movem.l    d0-d2, -(a7)
07b676 bsr.w      $7bcba
07b67a movem.l    (a7)+, d0-d2
07b67e bra.b      $7b66c
07b680 movem.l    a0-a2, -(a7)
07b684 bsr.w      $7bc10
07b688 movem.l    (a7)+, a0-a2
07b68c bsr.w      $7ba8c
07b690 bra.b      $7b630
07b692 cmp.w      $2ea6(a3), d1
07b696 bpl.b      $7b69c
07b698 bsr.w      $7b918
07b69c cmp.w      $2fbc(a3), d1
07b6a0 bgt.b      $7b6a6
07b6a2 bsr.w      $7ba4c
07b6a6 cmp.w      $2f00(a3), d1
07b6aa bgt.b      $7b6ba
07b6ac movem.l    d0-d2, -(a7)
07b6b0 bsr.w      $7bcba
07b6b4 movem.l    (a7)+, d0-d2
07b6b8 bra.b      $7b6a6
07b6ba movem.l    a0-a2, -(a7)
07b6be bsr.w      $7bd02
07b6c2 movem.l    (a7)+, a0-a2
07b6c6 bsr.w      $7baae
07b6ca bra.w      $7b630
07b6ce cmp.w      $2ea6(a3), d2
07b6d2 bpl.b      $7b6d8
07b6d4 bsr.w      $7b918
07b6d8 cmp.w      $2fbc(a3), d2
07b6dc bgt.b      $7b6e2
07b6de bsr.w      $7ba4c
07b6e2 cmp.w      $2f00(a3), d2
07b6e6 bgt.b      $7b6f6
07b6e8 movem.l    d0-d2, -(a7)
07b6ec bsr.w      $7bcba
07b6f0 movem.l    (a7)+, d0-d2
07b6f4 bra.b      $7b6e2
07b6f6 movem.l    a0-a2, -(a7)
07b6fa bsr.w      $7bd76
07b6fe movem.l    (a7)+, a0-a2
07b702 bsr.w      $7bb36
07b706 bra.w      $7b630
07b70a tst.w      $312c(a3)
07b70e bne.b      $7b776
07b710 moveq      #$0, d7
07b712 tst.w      $2f88(a3)
07b716 bne.b      $7b726
07b718 move.w     $3120(a3), d7
07b71c cmp.w      #$800, d7
07b720 bmi.b      $7b726
07b722 move.w     #$800, d7
07b726 add.w      $31e2(a3), d7
07b72a cmp.w      #$1800, d7
07b72e bmi.b      $7b734
07b730 subi.w     #$1800, d7
07b734 move.w     d7, $31e2(a3)
07b738 lsr.w      #$8, d7
07b73a lsr.w      #$3, d7
07b73c move.w     $3122(a3), d1
07b740 neg.w      d1
07b742 addi.w     #$20, d1
07b746 lsr.w      #$3, d1
07b748 add.w      d1, d7
07b74a add.w      d1, d7
07b74c add.w      d1, d7
07b74e movea.l    #$fc0, a2
07b754 clr.w      d1
07b756 move.w     $2ef4(a3), d2
07b75a subq.w     #$1, d2
07b75c movea.l    $2624(a3), a1
07b760 clr.w      $2fac(a3)
07b764 move.w     #$ffff, $2fa6(a3)
07b76a movem.l    d0-d7/a0-a2, -(a7)
07b76e bsr.w      $7c358
07b772 movem.l    (a7)+, d0-d7/a0-a2
07b776 move.w     $31be(a3), d7
07b77a beq.b      $7b7ce
07b77c movea.l    #$fc0, a2
07b782 move.w     $2f8a(a3), d7
07b786 lsr.w      #$2, d7
07b788 andi.w     #$3, d7
07b78c eori.w     #$3, d7
07b790 move.w     #$ffd2, d1
07b794 tst.w      $31bc(a3)
07b798 bmi.b      $7b79e
07b79a addq.w     #$4, d7
07b79c neg.w      d1
07b79e add.w      $3192(a3), d1
07b7a2 clr.w      d0
07b7a4 clr.w      d2
07b7a6 move.w     $318c(a3), $2f04(a3)
07b7ac move.w     $3192(a3), $2f06(a3)
07b7b2 move.l     $318e(a3), $2f08(a3)
07b7b8 movea.l    $2604(a3), a1
07b7bc move.w     #$1400, d4
07b7c0 move.w     #$ffff, $2fa6(a3)
07b7c6 clr.w      $2fac(a3)
07b7ca bsr.w      $7c104
07b7ce movea.l    #$fc0, a2
07b7d4 tst.w      $312c(a3)
07b7d8 bne.b      $7b838
07b7da move.w     $31d2(a3), d7
07b7de beq.b      $7b838
07b7e0 lsr.w      #$2, d7
07b7e2 tst.w      $31d4(a3)
07b7e6 beq.b      $7b7ea
07b7e8 bpl.b      $7b80c
07b7ea moveq      #$d1, d1
07b7ec move.w     $2e94(a3), d2
07b7f0 subq.w     #$3, d2
07b7f2 movea.l    $260c(a3), a1
07b7f6 clr.w      $2fac(a3)
07b7fa move.w     #$ffff, $2fa6(a3)
07b800 movem.l    d0-d7/a0-a2, -(a7)
07b804 bsr.w      $7c358
07b808 movem.l    (a7)+, d0-d7/a0-a2
07b80c tst.w      $31d4(a3)
07b810 bmi.b      $7b838
07b812 addq.w     #$5, d7
07b814 move.w     #$2f, d1
07b818 move.w     $2e94(a3), d2
07b81c subq.w     #$3, d2
07b81e movea.l    $260c(a3), a1
07b822 clr.w      $2fac(a3)
07b826 move.w     #$ffff, $2fa6(a3)
07b82c movem.l    d0-d7/a0-a2, -(a7)
07b830 bsr.w      $7c358
07b834 movem.l    (a7)+, d0-d7/a0-a2
07b838 tst.w      $31d2(a3)
07b83c bne.b      $7b8a0
07b83e tst.w      $312c(a3)
07b842 bne.b      $7b8a0
07b844 cmpi.w     #$c00, $3120(a3)
07b84a bmi.b      $7b8a0
07b84c tst.w      $2dec(a3)
07b850 bne.b      $7b86a
07b852 tst.w      $2de6(a3)
07b856 bne.b      $7b864
07b858 tst.w      $2de4(a3)
07b85c beq.b      $7b8a0
07b85e movea.l    $2724(a3), a1
07b862 bra.b      $7b86e
07b864 movea.l    $2758(a3), a1
07b868 bra.b      $7b86e
07b86a movea.l    $262c(a3), a1
07b86e move.w     $2cf8(a3), d7
07b872 lsr.w      #$2, d7
07b874 ext.l      d7
07b876 divu.w     #$3, d7
07b87a swap       d7
07b87c move.w     $3122(a3), d1
07b880 neg.w      d1
07b882 asr.w      #$2, d1
07b884 move.w     $2e94(a3), d2
07b888 subq.w     #$2, d2
07b88a clr.w      $2fac(a3)
07b88e move.w     #$ffff, $2fa6(a3)
07b894 movem.l    d0-d7/a0-a2, -(a7)
07b898 bsr.w      $7c358
07b89c movem.l    (a7)+, d0-d7/a0-a2
07b8a0 tst.w      $3120(a3)
07b8a4 beq.b      $7b916
07b8a6 tst.w      $31d6(a3)
07b8aa beq.b      $7b916
07b8ac tst.w      $312c(a3)
07b8b0 bne.b      $7b916
07b8b2 tst.w      $31dc(a3)
07b8b6 bne.b      $7b916
07b8b8 tst.w      $2dec(a3)
07b8bc bne.b      $7b916
07b8be tst.w      $2de4(a3)
07b8c2 bne.b      $7b916
07b8c4 move.w     $2cf8(a3), d7
07b8c8 lsr.w      #$2, d7
07b8ca andi.w     #$3, d7
07b8ce move.w     #$24, d1
07b8d2 move.w     $2e94(a3), d2
07b8d6 subq.w     #$2, d2
07b8d8 movea.l    $2608(a3), a1
07b8dc clr.w      $2fac(a3)
07b8e0 move.w     #$ffff, $2fa6(a3)
07b8e6 movem.l    d0-d7/a0-a2, -(a7)
07b8ea bsr.w      $7c358
07b8ee movem.l    (a7)+, d0-d7/a0-a2
07b8f2 addq.w     #$4, d7
07b8f4 moveq      #$dc, d1
07b8f6 move.w     $2e94(a3), d2
07b8fa subq.w     #$2, d2
07b8fc movea.l    $2608(a3), a1
07b900 clr.w      $2fac(a3)
07b904 move.w     #$ffff, $2fa6(a3)
07b90a movem.l    d0-d7/a0-a2, -(a7)
07b90e bsr.w      $7c358
07b912 movem.l    (a7)+, d0-d7/a0-a2
07b916 rts        
07b918 tst.w      $2dec(a3)
07b91c bne.b      $7b98e
07b91e cmpi.w     #$60, $2ea6(a3)
07b924 bne.b      $7b93a
07b926 movem.l    a0-a2, -(a7)
07b92a bsr.w      $7a7aa
07b92e movem.l    (a7)+, a0-a2
07b932 move.w     #$40, $2ea6(a3)
07b938 rts        
07b93a cmpi.w     #$40, $2ea6(a3)
07b940 bne.b      $7b956
07b942 movem.l    a0-a2, -(a7)
07b946 bsr.w      $7a7c8
07b94a movem.l    (a7)+, a0-a2
07b94e move.w     #$20, $2ea6(a3)
07b954 rts        
07b956 cmpi.w     #$20, $2ea6(a3)
07b95c bne.b      $7b970
07b95e movem.l    a0-a2, -(a7)
07b962 bsr.w      $7a7f0
07b966 movem.l    (a7)+, a0-a2
07b96a clr.w      $2ea6(a3)
07b96e rts        
07b970 cmpi.w     #$0, $2ea6(a3)
07b976 bne.b      $7b98c
07b978 movem.l    a0-a2, -(a7)
07b97c bsr.w      $7a822
07b980 movem.l    (a7)+, a0-a2
07b984 move.w     #$ffe0, $2ea6(a3)
07b98a rts        
07b98c rts        
07b98e cmpi.w     #$60, $2ea6(a3)
07b994 bne.b      $7b9aa
07b996 movem.l    a0-a2, -(a7)
07b99a bsr.w      $7a8c2
07b99e movem.l    (a7)+, a0-a2
07b9a2 move.w     #$40, $2ea6(a3)
07b9a8 rts        
07b9aa cmpi.w     #$40, $2ea6(a3)
07b9b0 bne.b      $7b9c6
07b9b2 movem.l    a0-a2, -(a7)
07b9b6 bsr.w      $7a8c4
07b9ba movem.l    (a7)+, a0-a2
07b9be move.w     #$20, $2ea6(a3)
07b9c4 rts        
07b9c6 cmpi.w     #$20, $2ea6(a3)
07b9cc bne.b      $7b9e0
07b9ce movem.l    a0-a2, -(a7)
07b9d2 bsr.w      $7a8ec
07b9d6 movem.l    (a7)+, a0-a2
07b9da clr.w      $2ea6(a3)
07b9de rts        
07b9e0 cmpi.w     #$0, $2ea6(a3)
07b9e6 bne.b      $7b9fc
07b9e8 movem.l    a0-a2, -(a7)
07b9ec bsr.w      $7a926
07b9f0 movem.l    (a7)+, a0-a2
07b9f4 move.w     #$ffe0, $2ea6(a3)
07b9fa rts        
07b9fc rts        
07b9fe tst.w      $2ea6(a3)
07ba02 bmi.b      $7ba0a
07ba04 bsr.w      $7b918
07ba08 bra.b      $7b9fe
07ba0a rts        
07ba0c movem.l    d0-d2/a0-a2, -(a7)
07ba10 moveq      #$0, d0
07ba12 move.w     $2fbc(a3), d0
07ba16 asl.l      #$4, d0
07ba18 asl.l      #$8, d0
07ba1a add.l      $30c2(a3), d0
07ba1e swap       d0
07ba20 asl.w      #$4, d0
07ba22 lea.l      -$1e78(a3), a0
07ba26 tst.w      $a(a0, d0.w)
07ba2a bpl.b      $7ba40
07ba2c move.w     $2fbc(a3), d0
07ba30 move.w     $2fbe(a3), d1
07ba34 andi.w     #$ff, d1
07ba38 ori.w      #$fd00, d1
07ba3c bsr.w      $7bbe4
07ba40 move.w     #$ffff, $2fbc(a3)
07ba46 movem.l    (a7)+, d0-d2/a0-a2
07ba4a rts        
07ba4c movem.l    d0-d2/a0-a2, -(a7)
07ba50 moveq      #$0, d0
07ba52 move.w     $2fbc(a3), d0
07ba56 asl.l      #$4, d0
07ba58 asl.l      #$8, d0
07ba5a add.l      $3196(a3), d0
07ba5e swap       d0
07ba60 asl.w      #$4, d0
07ba62 lea.l      -$1e78(a3), a0
07ba66 tst.w      $a(a0, d0.w)
07ba6a bpl.b      $7ba80
07ba6c move.w     $2fbc(a3), d0
07ba70 move.w     $2fbe(a3), d1
07ba74 andi.w     #$ff, d1
07ba78 ori.w      #$fd00, d1
07ba7c bsr.w      $7bc18
07ba80 move.w     #$ffff, $2fbc(a3)
07ba86 movem.l    (a7)+, d0-d2/a0-a2
07ba8a rts        
07ba8c subq.w     #$4, $2f1c(a3)
07ba90 bpl.b      $7ba9a
07ba92 move.w     #$ffff, $2f1c(a3)
07ba98 rts        
07ba9a move.w     -(a2), d0
07ba9c move.w     d0, $2f14(a3)
07baa0 andi.w     #$ff00, d0
07baa4 beq.b      $7ba8c
07baa6 cmp.w      #$ff00, d0
07baaa bcc.b      $7ba8c
07baac rts        
07baae subq.w     #$1, $2f26(a3)
07bab2 bpl.b      $7babc
07bab4 move.w     #$ffff, $2f1e(a3)
07baba rts        
07babc move.l     (a0)+, d0
07babe move.w     (a0)+, $2f18(a3)
07bac2 move.w     (a0)+, $2eb4(a3)
07bac6 sub.l      $2fb0(a3), d0
07baca cmp.l      #$80000, d0
07bad0 bpl.b      $7baae
07bad2 andi.l     #$3fffff, d0
07bad8 cmp.l      #$80000, d0
07bade bcc.b      $7baae
07bae0 asl.l      #$4, d0
07bae2 move.w     d0, $2f20(a3)
07bae6 swap       d0
07bae8 move.w     d0, $2f1e(a3)
07baec rts        
07baee subq.w     #$1, $2efa(a3)
07baf2 bpl.b      $7bafc
07baf4 move.w     #$ffff, $2f00(a3)
07bafa rts        
07bafc move.l     a0, -(a7)
07bafe move.w     $2efa(a3), d0
07bb02 asl.w      #$3, d0
07bb04 lea.l      -$3dce(a3), a0
07bb08 adda.w     d0, a0
07bb0a move.l     (a0)+, d0
07bb0c move.w     (a0)+, $2efc(a3)
07bb10 move.w     (a0)+, $2efe(a3)
07bb14 movea.l    (a7)+, a0
07bb16 sub.l      $2fb0(a3), d0
07bb1a andi.l     #$3fffff, d0
07bb20 cmp.l      #$80000, d0
07bb26 bcc.b      $7baee
07bb28 asl.l      #$4, d0
07bb2a move.w     d0, $2f02(a3)
07bb2e swap       d0
07bb30 move.w     d0, $2f00(a3)
07bb34 rts        
07bb36 subq.w     #$1, $2f28(a3)
07bb3a bpl.b      $7bb44
07bb3c move.w     #$ffff, $2f22(a3)
07bb42 rts        
07bb44 move.l     (a1)+, d0
07bb46 move.w     (a1)+, $2f1a(a3)
07bb4a move.w     (a1)+, $2eb2(a3)
07bb4e sub.l      $2fb0(a3), d0
07bb52 bmi.b      $7bb3c
07bb54 cmp.l      #$80000, d0
07bb5a bcc.b      $7bb36
07bb5c asl.l      #$4, d0
07bb5e move.w     d0, $2f24(a3)
07bb62 swap       d0
07bb64 move.w     d0, $2f22(a3)
07bb68 rts        
07bb6a move.l     $30ba(a3), d0
07bb6e move.l     $30be(a3), d1
07bb72 move.l     $318e(a3), d2
07bb76 move.l     $3192(a3), d3
07bb7a move.l     $2e4a(a3), d4
07bb7e move.l     $2e4e(a3), d5
07bb82 move.l     $2e52(a3), d6
07bb86 move.l     $2e56(a3), d7
07bb8a cmp.l      d0, d2
07bb8c bcs.b      $7bb92
07bb8e exg.l      d0, d2
07bb90 exg.l      d1, d3
07bb92 cmp.l      d2, d4
07bb94 bcs.b      $7bb9a
07bb96 exg.l      d2, d4
07bb98 exg.l      d3, d5
07bb9a cmp.l      d4, d6
07bb9c bcs.b      $7bba2
07bb9e exg.l      d4, d6
07bba0 exg.l      d5, d7
07bba2 cmp.l      d0, d2
07bba4 bcs.b      $7bbaa
07bba6 exg.l      d0, d2
07bba8 exg.l      d1, d3
07bbaa cmp.l      d2, d4
07bbac bcs.b      $7bbb2
07bbae exg.l      d2, d4
07bbb0 exg.l      d3, d5
07bbb2 cmp.l      d4, d6
07bbb4 bcs.b      $7bbba
07bbb6 exg.l      d4, d6
07bbb8 exg.l      d5, d7
07bbba cmp.l      d0, d2
07bbbc bcs.b      $7bbc2
07bbbe exg.l      d0, d2
07bbc0 exg.l      d1, d3
07bbc2 cmp.l      d2, d4
07bbc4 bcs.b      $7bbca
07bbc6 exg.l      d2, d4
07bbc8 exg.l      d3, d5
07bbca cmp.l      d4, d6
07bbcc bcs.b      $7bbd2
07bbce exg.l      d4, d6
07bbd0 exg.l      d5, d7
07bbd2 lea.l      $2eb6(a3), a1
07bbd6 movem.l    d0-d7, (a1)
07bbda rts        
07bbdc move.w     $2f1c(a3), d0
07bbe0 move.w     $2f14(a3), d1
07bbe4 move.w     d1, $2f16(a3)
07bbe8 move.w     d1, d2
07bbea ext.w      d1
07bbec asl.w      #$4, d1
07bbee andi.w     #$ff00, d2
07bbf2 lsr.w      #$8, d2
07bbf4 move.w     d2, $2fac(a3)
07bbf8 lea.l      $4c7e(a3), a0
07bbfc move.w     d0, d6
07bbfe add.w      d6, d6
07bc00 move.w     (a0, d6.w), d7
07bc04 bmi.b      $7bc0e
07bc06 move.w     $2fae(a3), d2
07bc0a bsr.w      $7beb4
07bc0e rts        
07bc10 move.w     $2f1c(a3), d0
07bc14 move.w     $2f14(a3), d1
07bc18 move.w     d1, $2f16(a3)
07bc1c move.w     d1, d2
07bc1e ext.w      d1
07bc20 asl.w      #$4, d1
07bc22 andi.w     #$ff00, d2
07bc26 lsr.w      #$8, d2
07bc28 move.w     d2, $2fac(a3)
07bc2c lea.l      $4c7e(a3), a0
07bc30 move.w     d0, d6
07bc32 add.w      d6, d6
07bc34 move.w     (a0, d6.w), d7
07bc38 bmi.b      $7bc42
07bc3a move.w     $2fae(a3), d2
07bc3e bsr.w      $7c090
07bc42 rts        
07bc44 move.w     $2f1e(a3), d0
07bc48 move.w     d0, $2fba(a3)
07bc4c move.w     $2f20(a3), d2
07bc50 move.w     $2f18(a3), d1
07bc54 lea.l      $4d7e(a3), a0
07bc58 move.w     d0, d6
07bc5a add.w      d6, d6
07bc5c move.w     (a0, d6.w), d7
07bc60 bmi.b      $7bc70
07bc62 move.w     $2eb4(a3), $2fa6(a3)
07bc68 clr.w      $2ede(a3)
07bc6c bsr.w      $7bde0
07bc70 rts        
07bc72 movem.l    a0-a2, -(a7)
07bc76 move.w     $2f00(a3), d0
07bc7a move.w     $2f02(a3), d2
07bc7e move.w     $2efc(a3), d1
07bc82 lea.l      $4d7e(a3), a0
07bc86 move.w     d0, d6
07bc88 add.w      d6, d6
07bc8a move.w     (a0, d6.w), d7
07bc8e bmi.b      $7bca8
07bc90 move.w     $2efe(a3), $2fa6(a3)
07bc96 clr.w      $2ede(a3)
07bc9a move.w     #$99, $2fce(a3)
07bca0 bsr.w      $7bde0
07bca4 clr.w      $2fce(a3)
07bca8 movem.l    (a7)+, a0-a2
07bcac movem.l    a0-a2, -(a7)
07bcb0 bsr.w      $7baee
07bcb4 movem.l    (a7)+, a0-a2
07bcb8 rts        
07bcba movem.l    a0-a2, -(a7)
07bcbe move.w     $2f00(a3), d0
07bcc2 move.w     $2f02(a3), d2
07bcc6 move.w     $2efc(a3), d1
07bcca lea.l      $4d7e(a3), a0
07bcce move.w     d0, d6
07bcd0 add.w      d6, d6
07bcd2 move.w     (a0, d6.w), d7
07bcd6 bmi.b      $7bcf0
07bcd8 move.w     $2efe(a3), $2fa6(a3)
07bcde clr.w      $2ede(a3)
07bce2 move.w     #$99, $2fce(a3)
07bce8 bsr.w      $7be48
07bcec clr.w      $2fce(a3)
07bcf0 movem.l    (a7)+, a0-a2
07bcf4 movem.l    a0-a2, -(a7)
07bcf8 bsr.w      $7baee
07bcfc movem.l    (a7)+, a0-a2
07bd00 rts        
07bd02 move.w     $2f1e(a3), d0
07bd06 move.w     d0, $2fba(a3)
07bd0a move.w     $2f20(a3), d2
07bd0e move.w     $2f18(a3), d1
07bd12 lea.l      $4d7e(a3), a0
07bd16 move.w     d0, d6
07bd18 add.w      d6, d6
07bd1a move.w     (a0, d6.w), d7
07bd1e bmi.b      $7bd2e
07bd20 move.w     $2eb4(a3), $2fa6(a3)
07bd26 clr.w      $2ede(a3)
07bd2a bsr.w      $7be48
07bd2e rts        
07bd30 move.w     $2eb2(a3), d0
07bd34 move.w     d0, d1
07bd36 ext.w      d0
07bd38 move.w     d0, $2fa8(a3)
07bd3c andi.w     #$fffc, $2fa8(a3)
07bd42 move.w     d1, d2
07bd44 andi.w     #$3, d1
07bd48 move.w     d1, $2fa6(a3)
07bd4c andi.w     #$ff00, d2
07bd50 move.w     d2, $2ede(a3)
07bd54 move.w     $2f22(a3), d0
07bd58 move.w     d0, $2fba(a3)
07bd5c move.w     $2f24(a3), d2
07bd60 move.w     $2f1a(a3), d1
07bd64 lea.l      $4d7e(a3), a0
07bd68 move.w     d0, d6
07bd6a add.w      d6, d6
07bd6c move.w     (a0, d6.w), d7
07bd70 bmi.b      $7bd74
07bd72 bsr.b      $7bde0
07bd74 rts        
07bd76 move.w     $2eb2(a3), d0
07bd7a move.w     d0, d1
07bd7c ext.w      d0
07bd7e move.w     d0, $2fa8(a3)
07bd82 andi.w     #$fffc, $2fa8(a3)
07bd88 move.w     d1, d2
07bd8a andi.w     #$3, d1
07bd8e move.w     d1, $2fa6(a3)
07bd92 andi.w     #$ff00, d2
07bd96 move.w     d2, $2ede(a3)
07bd9a move.w     $2f22(a3), d0
07bd9e move.w     d0, $2fba(a3)
07bda2 move.w     $2f24(a3), d2
07bda6 move.w     $2f1a(a3), d1
07bdaa lea.l      $4d7e(a3), a0
07bdae move.w     d0, d6
07bdb0 add.w      d6, d6
07bdb2 move.w     (a0, d6.w), d7
07bdb6 bmi.b      $7bdbc
07bdb8 bsr.w      $7be48
07bdbc rts        
07bdbe tst.w      $2de2(a3)
07bdc2 bne.b      $7bdcc
07bdc4 tst.w      $2de0(a3)
07bdc8 bne.b      $7bdd6
07bdca rts        
07bdcc lea.l      $2508(a3), a1
07bdd0 movea.l    (a1, d6.w), a1
07bdd4 rts        
07bdd6 lea.l      $25c8(a3), a1
07bdda movea.l    (a1, d6.w), a1
07bdde rts        
07bde0 move.w     $30b8(a3), $2f04(a3)
07bde6 move.w     $30c6(a3), $2f06(a3)
07bdec move.l     $30c2(a3), $2f08(a3)
07bdf2 suba.l     a2, a2
07bdf4 movea.l    $2d06(a3), a1
07bdf8 move.w     $2ede(a3), d4
07bdfc clr.w      $2fac(a3)
07be00 tst.w      $2fce(a3)
07be04 beq.b      $7be10
07be06 movea.l    $26a4(a3), a1
07be0a move.w     #$ffff, $2fa6(a3)
07be10 tst.w      d0
07be12 bne.b      $7be44
07be14 tst.w      d2
07be16 bne.b      $7be44
07be18 tst.w      d4
07be1a beq.b      $7be44
07be1c bmi.b      $7be44
07be1e movea.l    $2628(a3), a1
07be22 move.w     #$ffff, $2fa6(a3)
07be28 movem.l    d0-d7/a0-a2, -(a7)
07be2c moveq      #$2, d7
07be2e clr.w      d4
07be30 bsr.w      $7c104
07be34 movem.l    (a7)+, d0-d7/a0-a2
07be38 move.w     $2ed6(a3), d7
07be3c subq.w     #$1, d7
07be3e lsr.w      #$1, d7
07be40 eori.w     #$1, d7
07be44 bra.w      $7c104
07be48 move.w     $318c(a3), $2f04(a3)
07be4e move.w     $319a(a3), $2f06(a3)
07be54 move.l     $3196(a3), $2f08(a3)
07be5a movea.l    #$fc0, a2
07be60 movea.l    $2d06(a3), a1
07be64 move.w     $2ede(a3), d4
07be68 clr.w      $2fac(a3)
07be6c tst.w      $2fce(a3)
07be70 beq.b      $7be7c
07be72 movea.l    $26a4(a3), a1
07be76 move.w     #$ffff, $2fa6(a3)
07be7c tst.w      d0
07be7e bne.b      $7beb0
07be80 tst.w      d2
07be82 bne.b      $7beb0
07be84 tst.w      d4
07be86 beq.b      $7beb0
07be88 bmi.b      $7beb0
07be8a movea.l    $2628(a3), a1
07be8e move.w     #$ffff, $2fa6(a3)
07be94 movem.l    d0-d7/a0-a2, -(a7)
07be98 moveq      #$2, d7
07be9a clr.w      d4
07be9c bsr.w      $7c104
07bea0 movem.l    (a7)+, d0-d7/a0-a2
07bea4 move.w     $2ed8(a3), d7
07bea8 subq.w     #$1, d7
07beaa lsr.w      #$1, d7
07beac eori.w     #$1, d7
07beb0 bra.w      $7c104
07beb4 move.w     $30b8(a3), $2f04(a3)
07beba move.w     $30c6(a3), $2f06(a3)
07bec0 move.l     $30c2(a3), $2f08(a3)
07bec6 suba.l     a2, a2
07bec8 move.w     $2fac(a3), d6
07becc add.w      d6, d6
07bece add.w      d6, d6
07bed0 lea.l      $2438(a3), a1
07bed4 movea.l    (a1, d6.w), a1
07bed8 clr.w      d4
07beda move.w     #$ffff, $2fa6(a3)
07bee0 cmpi.w     #$40, $2fac(a3)
07bee6 bmi.w      $7bfba
07beea cmpi.w     #$9a, $2fac(a3)
07bef0 beq.b      $7bf2c
07bef2 cmpi.w     #$92, $2fac(a3)
07bef8 beq.w      $7c060
07befc cmpi.w     #$78, $2fac(a3)
07bf02 bmi.b      $7bf28
07bf04 cmpi.w     #$7b, $2fac(a3)
07bf0a bpl.b      $7bf28
07bf0c clr.w      d1
07bf0e movem.l    d0-d7/a0-a2, -(a7)
07bf12 bsr.w      $7c104
07bf16 movem.l    (a7)+, d0-d7/a0-a2
07bf1a bsr.w      $7bdbe
07bf1e move.w     #$ff00, $2fa6(a3)
07bf24 bra.w      $7c138
07bf28 bra.w      $7c104
07bf2c sub.w      $2cf8(a3), d1
07bf30 asl.w      #$4, d1
07bf32 andi.w     #$1fff, d1
07bf36 subi.w     #$1000, d1
07bf3a movem.l    d0-d7/a0-a2, -(a7)
07bf3e bsr.w      $7c104
07bf42 movem.l    (a7)+, d0-d7/a0-a2
07bf46 move.w     $2ef4(a3), -(a7)
07bf4a move.w     $2eee(a3), -(a7)
07bf4e cmp.w      #$9, d7
07bf52 bpl.b      $7bfa4
07bf54 addq.w     #$2, a7
07bf56 move.w     $2eee(a3), -(a7)
07bf5a movea.l    $2694(a3), a1
07bf5e move.w     $2ef0(a3), d1
07bf62 move.w     $2ef4(a3), d2
07bf66 movem.l    d0-d7/a0-a2, -(a7)
07bf6a bsr.w      $7c2ee
07bf6e movem.l    (a7)+, d0-d7/a0-a2
07bf72 movea.l    $2690(a3), a1
07bf76 move.w     (a7)+, d1
07bf78 move.w     $2ef4(a3), d2
07bf7c movem.l    d0-d7/a0-a2, -(a7)
07bf80 bsr.w      $7c322
07bf84 movem.l    (a7)+, d0-d7/a0-a2
07bf88 move.w     $2eee(a3), -(a7)
07bf8c movea.l    $269c(a3), a1
07bf90 move.w     $2eee(a3), d1
07bf94 move.w     $2ef2(a3), d2
07bf98 movem.l    d0-d7/a0-a2, -(a7)
07bf9c bsr.w      $7c2ee
07bfa0 movem.l    (a7)+, d0-d7/a0-a2
07bfa4 movea.l    $268c(a3), a1
07bfa8 move.w     (a7)+, d1
07bfaa move.w     (a7)+, d2
07bfac movem.l    d0-d7/a0-a2, -(a7)
07bfb0 bsr.w      $7c322
07bfb4 movem.l    (a7)+, d0-d7/a0-a2
07bfb8 rts        
07bfba movem.l    d0/a0, -(a7)
07bfbe move.w     $2fac(a3), d0
07bfc2 move.w     #$c4, $2fac(a3)
07bfc8 add.w      d0, d0
07bfca lea.l      $7bfe0(pc), a0
07bfce move.w     (a0, d0.w), d4
07bfd2 asl.w      #$8, d4
07bfd4 movem.l    (a7)+, d0/a0
07bfd8 movea.l    $2748(a3), a1
07bfdc bra.w      $7c104
07bfe0 ori.b      #$10, d0
07bfe4 ori.b      #$30, -(a0)
07bfe8 ori.w      #$50, d0
07bfec ori.w      #$70, -(a0)
07bff0 .byte      0x00, 0x7f
07bff2 .byte      0x00, 0x8d
07bff4 ori.l      #$a600b1, (a2)+
07bffa .byte      0x00, 0xbb
07bffc .byte      0x00, 0xc4
07bffe .byte      0x00, 0xcc
07c000 .byte      0x00, 0xd3
07c002 .byte      0x00, 0xd9
07c004 .byte      0x00, 0xde
07c006 .byte      0x00, 0xe2
07c008 .byte      0x00, 0xe5
07c00a .byte      0x00, 0xe7
07c00c .byte      0x00, 0xe8
07c00e .byte      0x00, 0xe7
07c010 .byte      0x00, 0xe5
07c012 .byte      0x00, 0xe2
07c014 .byte      0x00, 0xde
07c016 .byte      0x00, 0xd9
07c018 .byte      0x00, 0xd3
07c01a .byte      0x00, 0xcc
07c01c .byte      0x00, 0xc4
07c01e .byte      0x00, 0xbb
07c020 ori.l      #$a6009a, -$73(a1, d0.w)
07c028 .byte      0x00, 0x7f
07c02a ori.w      #$60, $50(a0, d0.w)
07c030 ori.w      #$30, d0
07c034 ori.b      #$10, -(a0)
07c038 ori.b      #$8, d0
07c03c .byte      0x00, 0x0f
07c03e ori.b      #$1a, (a5)
07c042 ori.b      #$21, (a6)+
07c046 ori.b      #$24, -(a3)
07c04a ori.b      #$21, -(a3)
07c04e ori.b      #$1a, (a6)+
07c052 ori.b      #$f, (a5)
07c056 .byte      0x00, 0x08
07c058 ori.b      #$4, d0
07c05c ori.b      #$4, d6
07c060 movem.l    d0-d7/a0-a2, -(a7)
07c064 bsr.w      $7c104
07c068 movem.l    (a7)+, d0-d7/a0-a2
07c06c move.w     $2ef2(a3), d2
07c070 move.w     $2eee(a3), d1
07c074 add.w      $2ef0(a3), d1
07c078 asr.w      #$1, d1
07c07a subi.w     #$a0, d1
07c07e movea.l    $267c(a3), a1
07c082 movem.l    d0-d7/a0-a2, -(a7)
07c086 bsr.w      $7c358
07c08a movem.l    (a7)+, d0-d7/a0-a2
07c08e rts        
07c090 move.w     $318c(a3), $2f04(a3)
07c096 move.w     $319a(a3), $2f06(a3)
07c09c move.l     $3196(a3), $2f08(a3)
07c0a2 movea.l    #$fc0, a2
07c0a8 move.w     $2fac(a3), d6
07c0ac add.w      d6, d6
07c0ae add.w      d6, d6
07c0b0 lea.l      $2438(a3), a1
07c0b4 movea.l    (a1, d6.w), a1
07c0b8 clr.w      d4
07c0ba move.w     #$ffff, $2fa6(a3)
07c0c0 cmpi.w     #$40, $2fac(a3)
07c0c6 bmi.w      $7bfba
07c0ca cmpi.w     #$9a, $2fac(a3)
07c0d0 beq.w      $7bf2c
07c0d4 cmpi.w     #$92, $2fac(a3)
07c0da beq.b      $7c060
07c0dc cmpi.w     #$78, $2fac(a3)
07c0e2 bmi.b      $7c104
07c0e4 cmpi.w     #$7b, $2fac(a3)
07c0ea bpl.b      $7c104
07c0ec clr.w      d1
07c0ee movem.l    d0-d7/a0-a2, -(a7)
07c0f2 bsr.b      $7c104
07c0f4 movem.l    (a7)+, d0-d7/a0-a2
07c0f8 bsr.w      $7bdbe
07c0fc move.w     #$ff00, $2fa6(a3)
07c102 bra.b      $7c138
07c104 move.w     d4, $2ee0(a3)
07c108 cmpi.w     #$fc, $2fac(a3)
07c10e beq.b      $7c130
07c110 cmpi.w     #$fd, $2fac(a3)
07c116 beq.b      $7c130
07c118 cmpi.w     #$78, $2fac(a3)
07c11e beq.b      $7c130
07c120 cmpi.w     #$79, $2fac(a3)
07c126 beq.b      $7c130
07c128 cmpi.w     #$7a, $2fac(a3)
07c12e bne.b      $7c138
07c130 move.w     #$fffe, $2fa6(a3)
07c136 clr.w      d1
07c138 cmp.w      #$40, d0
07c13c bcc.w      $7c1ce
07c140 cmpi.w     #$fffe, $2fa6(a3)
07c146 beq.w      $7c1ce
07c14a subq.w     #$1, $2f04(a3)
07c14e cmp.w      $2f04(a3), d0
07c152 bcc.w      $7c2ec
07c156 lsr.w      #$1, d2
07c158 move.w     d2, d3
07c15a add.w      d0, d0
07c15c move.w     d0, d4
07c15e add.w      d4, d4
07c160 add.w      d4, d4
07c162 lea.l      -$2278(a3), a0
07c166 move.w     $4(a0, d4.w), $2f34(a3)
07c16c move.w     $6(a0, d4.w), $2ee2(a3)
07c172 move.w     $8(a0, d4.w), d2
07c176 move.w     (a0, d4.w), d5
07c17a sub.w      d5, d2
07c17c muls.w     d3, d2
07c17e add.l      d2, d2
07c180 swap       d2
07c182 add.w      d5, d2
07c184 sub.w      $2f06(a3), d1
07c188 asl.w      #$3, d1
07c18a sub.w      d2, d1
07c18c move.w     $a(a0, d4.w), d2
07c190 move.w     $2(a0, d4.w), d5
07c194 sub.w      d5, d2
07c196 muls.w     d3, d2
07c198 add.l      d2, d2
07c19a swap       d2
07c19c add.w      d5, d2
07c19e lea.l      $4b7e(a3), a0
07c1a2 move.w     (a0, d0.w), $2ee8(a3)
07c1a8 move.w     $2(a0, d0.w), d4
07c1ac move.w     (a0, d0.w), d5
07c1b0 sub.w      d5, d4
07c1b2 muls.w     d3, d4
07c1b4 add.l      d4, d4
07c1b6 swap       d4
07c1b8 add.w      d5, d4
07c1ba add.w      d4, d4
07c1bc muls.w     d4, d1
07c1be swap       d1
07c1c0 move.w     $2e94(a3), d6
07c1c4 subq.w     #$2, d6
07c1c6 cmp.w      d6, d2
07c1c8 bcs.b      $7c1cc
07c1ca move.w     d6, d2
07c1cc bra.b      $7c21e
07c1ce cmp.w      $2f04(a3), d0
07c1d2 bcc.w      $7c2ec
07c1d6 add.w      d0, d0
07c1d8 move.w     d0, d2
07c1da add.w      d2, d2
07c1dc add.w      d2, d2
07c1de lea.l      -$2278(a3), a0
07c1e2 move.w     $4(a0, d2.w), $2f34(a3)
07c1e8 move.w     $6(a0, d2.w), $2ee2(a3)
07c1ee sub.w      $2f06(a3), d1
07c1f2 asl.w      #$3, d1
07c1f4 lea.l      -$2278(a3), a0
07c1f8 sub.w      (a0, d2.w), d1
07c1fc move.w     $2(a0, d2.w), d2
07c200 lea.l      $4b7e(a3), a0
07c204 move.w     (a0, d0.w), d4
07c208 move.w     d4, $2ee8(a3)
07c20c add.w      d4, d4
07c20e muls.w     d4, d1
07c210 swap       d1
07c212 move.w     $2e94(a3), d6
07c216 subq.w     #$2, d6
07c218 cmp.w      d6, d2
07c21a bcs.b      $7c21e
07c21c move.w     d6, d2
07c21e cmp.w      $2f34(a3), d2
07c222 bpl.b      $7c228
07c224 move.w     d2, $2f34(a3)
07c228 move.w     $2ee0(a3), d6
07c22c beq.b      $7c238
07c22e muls.w     $2ee8(a3), d6
07c232 swap       d6
07c234 asr.w      #$5, d6
07c236 sub.w      d6, d2
07c238 cmpi.w     #$72, $2fac(a3)
07c23e bne.b      $7c248
07c240 move.w     $2ee8(a3), d6
07c244 lsr.w      #$5, d6
07c246 sub.w      d6, d2
07c248 cmpi.w     #$fffe, $2fa6(a3)
07c24e beq.w      $7c358
07c252 cmpa.l     $26a4(a3), a1
07c256 beq.b      $7c260
07c258 cmpa.l     $2d06(a3), a1
07c25c bne.w      $7c2ea
07c260 move.w     d7, d6
07c262 asl.w      #$3, d7
07c264 add.w      d6, d7
07c266 move.w     d1, d6
07c268 neg.w      d6
07c26a addi.w     #$90, d6
07c26e asr.w      #$2, d6
07c270 cmpi.w     #$3, $2fa6(a3)
07c276 beq.b      $7c28c
07c278 cmpi.w     #$1, $2fa6(a3)
07c27e bne.b      $7c292
07c280 tst.w      $3038(a3)
07c284 bne.b      $7c28c
07c286 tst.w      $303a(a3)
07c28a beq.b      $7c292
07c28c move.w     $2fa8(a3), d4
07c290 add.w      d4, d6
07c292 move.w     $2ee2(a3), d4
07c296 asr.w      #$2, d4
07c298 sub.w      d4, d6
07c29a asr.w      #$3, d6
07c29c tst.w      d6
07c29e bpl.b      $7c2a2
07c2a0 moveq      #$0, d6
07c2a2 cmp.w      #$8, d6
07c2a6 bmi.b      $7c2aa
07c2a8 moveq      #$8, d6
07c2aa add.w      d6, d7
07c2ac add.w      $2fce(a3), d7
07c2b0 lea.l      $7ce92(pc), a0
07c2b4 move.b     (a0, d7.w), d7
07c2b8 andi.w     #$ff, d7
07c2bc tst.w      $2de0(a3)
07c2c0 beq.b      $7c2ea
07c2c2 cmp.w      #$18, d7
07c2c6 bmi.b      $7c2ea
07c2c8 move.l     $2f08(a3), d0
07c2cc asl.l      #$4, d0
07c2ce swap       d0
07c2d0 add.w      $2fba(a3), d0
07c2d4 lsr.w      #$4, d0
07c2d6 asl.w      #$4, d0
07c2d8 lea.l      -$1e78(a3), a0
07c2dc tst.w      $a(a0, d0.w)
07c2e0 bpl.b      $7c2ea
07c2e2 movea.l    $279c(a3), a1
07c2e6 subi.w     #$18, d7
07c2ea bra.b      $7c358
07c2ec rts        
07c2ee move.l     a4, d0
07c2f0 sub.l      $2f2c(a3), d0
07c2f4 cmp.l      #$1cac, d0
07c2fa bcc.w      $7c662
07c2fe move.l     (a1)+, $2f36(a3)
07c302 move.l     (a1)+, $2f3a(a3)
07c306 asl.w      #$3, d7
07c308 movea.l    (a1, d7.w), a0
07c30c move.w     $4(a1, d7.w), d4
07c310 move.w     $6(a1, d7.w), d3
07c314 adda.l     a1, a0
07c316 move.w     d2, d7
07c318 sub.w      d3, d2
07c31a addq.w     #$1, d2
07c31c move.w     d2, d5
07c31e bra.w      $7c3f4
07c322 move.l     a4, d0
07c324 sub.l      $2f2c(a3), d0
07c328 cmp.l      #$1cac, d0
07c32e bcc.w      $7c662
07c332 move.l     (a1)+, $2f36(a3)
07c336 move.l     (a1)+, $2f3a(a3)
07c33a asl.w      #$3, d7
07c33c movea.l    (a1, d7.w), a0
07c340 move.w     $4(a1, d7.w), d4
07c344 move.w     $6(a1, d7.w), d3
07c348 adda.l     a1, a0
07c34a move.w     d2, d7
07c34c sub.w      d3, d2
07c34e addq.w     #$1, d2
07c350 move.w     d2, d5
07c352 sub.w      d4, d1
07c354 bra.w      $7c3f4
07c358 cmpi.w     #$ff00, $2fa6(a3)
07c35e bne.b      $7c3aa
07c360 move.l     a4, d0
07c362 sub.l      $2f2c(a3), d0
07c366 cmp.l      #$1cac, d0
07c36c bcc.w      $7c662
07c370 move.w     #$ffff, $2fa6(a3)
07c376 move.l     (a1)+, $2f36(a3)
07c37a move.l     (a1)+, $2f3a(a3)
07c37e asl.w      #$3, d7
07c380 movea.l    (a1, d7.w), a0
07c384 move.w     $4(a1, d7.w), d4
07c388 move.w     $6(a1, d7.w), d3
07c38c adda.l     a1, a0
07c38e addi.w     #$a0, d1
07c392 move.w     $2f9e(a3), d7
07c396 move.w     d3, d0
07c398 asr.w      #$1, d0
07c39a add.w      d0, d7
07c39c move.w     d7, d5
07c39e sub.w      d3, d5
07c3a0 subq.w     #$1, d7
07c3a2 move.w     d4, d0
07c3a4 asr.w      #$1, d0
07c3a6 sub.w      d0, d1
07c3a8 bra.b      $7c3f4
07c3aa move.l     a4, d0
07c3ac sub.l      $2f2c(a3), d0
07c3b0 cmp.l      #$1cac, d0
07c3b6 bcc.w      $7c662
07c3ba cmpi.w     #$fffe, $2fa6(a3)
07c3c0 beq.w      $7c824
07c3c4 move.l     a1, d0
07c3c6 beq.w      $7c2ec
07c3ca move.l     (a1)+, $2f36(a3)
07c3ce move.l     (a1)+, $2f3a(a3)
07c3d2 asl.w      #$3, d7
07c3d4 movea.l    (a1, d7.w), a0
07c3d8 move.w     $4(a1, d7.w), d4
07c3dc move.w     $6(a1, d7.w), d3
07c3e0 adda.l     a1, a0
07c3e2 addi.w     #$a0, d1
07c3e6 move.w     d2, d7
07c3e8 sub.w      d3, d2
07c3ea addq.w     #$1, d2
07c3ec move.w     d2, d5
07c3ee move.w     d4, d0
07c3f0 asr.w      #$1, d0
07c3f2 sub.w      d0, d1
07c3f4 clr.w      $2fe8(a3)
07c3f8 move.w     d1, d2
07c3fa andi.w     #$f, d2
07c3fe move.w     d2, -(a7)
07c400 move.w     d4, d2
07c402 subq.w     #$1, d2
07c404 andi.w     #$f, d2
07c408 addq.w     #$1, d2
07c40a add.w      (a7)+, d2
07c40c subq.w     #$1, d2
07c40e cmp.w      #$10, d2
07c412 bpl.b      $7c41a
07c414 move.w     #$1, $2fe8(a3)
07c41a move.w     d1, $2eee(a3)
07c41e move.w     d5, $2ef2(a3)
07c422 move.w     d7, $2ef4(a3)
07c426 move.w     d1, d2
07c428 add.w      d4, d2
07c42a move.w     d2, $2ef0(a3)
07c42e move.w     d1, d2
07c430 asr.w      #$4, d2
07c432 addq.w     #$1, d2
07c434 andi.w     #$f, d1
07c438 ror.w      #$4, d1
07c43a move.w     d1, $3024(a3)
07c43e addi.w     #$f, d4
07c442 lsr.w      #$4, d4
07c444 move.w     d2, d6
07c446 add.w      d4, d6
07c448 move.w     d4, d1
07c44a tst.w      d2
07c44c bpl.b      $7c45e
07c44e tst.w      d6
07c450 bmi.w      $7c662
07c454 move.w     d2, d0
07c456 moveq      #$0, d2
07c458 add.w      d0, d4
07c45a add.w      d0, d0
07c45c suba.w     d0, a0
07c45e tst.w      d5
07c460 bpl.b      $7c474
07c462 tst.w      d7
07c464 bmi.w      $7c662
07c468 move.w     d5, d0
07c46a moveq      #$0, d5
07c46c add.w      d0, d3
07c46e add.w      d0, d0
07c470 muls.w     d1, d0
07c472 suba.w     d0, a0
07c474 cmp.w      #$15, d6
07c478 bmi.b      $7c48e
07c47a cmp.w      #$15, d2
07c47e bpl.w      $7c662
07c482 move.w     d6, d0
07c484 subi.w     #$15, d0
07c488 sub.w      d0, d4
07c48a clr.w      $2fe8(a3)
07c48e cmp.w      $2f34(a3), d7
07c492 bls.b      $7c4a0
07c494 sub.w      $2f34(a3), d7
07c498 addq.w     #$1, d7
07c49a sub.w      d7, d3
07c49c bls.w      $7c662
07c4a0 tst.w      d4
07c4a2 beq.w      $7c662
07c4a6 move.w     $2f38(a3), (a4)+
07c4aa cmpi.w     #$4, $2fa6(a3)
07c4b0 bmi.b      $7c4b6
07c4b2 addq.w     #$1, -$2(a4)
07c4b6 move.w     d4, d6
07c4b8 add.w      d6, d6
07c4ba subi.w     #$28, d6
07c4be neg.w      d6
07c4c0 move.w     d1, d7
07c4c2 sub.w      d4, d7
07c4c4 add.w      d7, d7
07c4c6 subq.w     #$2, d7
07c4c8 move.w     $3024(a3), d0
07c4cc move.w     d0, d1
07c4ce ori.w      #$fca, d1
07c4d2 move.w     d1, (a4)+
07c4d4 move.w     d0, (a4)+
07c4d6 ori.w      #$b0a, d0
07c4da tst.w      $2fe8(a3)
07c4de beq.b      $7c4e4
07c4e0 addq.w     #$2, d6
07c4e2 addq.w     #$2, d7
07c4e4 move.w     d6, (a4)+
07c4e6 move.w     d7, (a4)+
07c4e8 move.w     d7, (a4)+
07c4ea move.w     d6, (a4)+
07c4ec moveq      #$0, d6
07c4ee tst.w      $2fe8(a3)
07c4f2 beq.b      $7c4f6
07c4f4 moveq      #$ff, d6
07c4f6 move.w     d6, (a4)+
07c4f8 move.l     $2f3a(a3), d1
07c4fc movea.l    a0, a1
07c4fe move.w     $2f38(a3), d6
07c502 subq.w     #$1, d6
07c504 beq.b      $7c50c
07c506 adda.l     d1, a0
07c508 subq.w     #$1, d6
07c50a bne.b      $7c506
07c50c add.w      d2, d2
07c50e add.w      d5, d5
07c510 move.l     a0, -(a7)
07c512 lea.l      -$3d6a(a3), a0
07c516 add.w      (a0, d5.w), d2
07c51a movea.l    (a7)+, a0
07c51c adda.w     d2, a2
07c51e adda.l     $2f74(a3), a2
07c522 move.w     d3, d6
07c524 asl.w      #$6, d6
07c526 add.w      d4, d6
07c528 tst.w      $2fe8(a3)
07c52c bne.b      $7c530
07c52e addq.w     #$1, d6
07c530 move.w     #$20d0, d4
07c534 tst.w      $2fa6(a3)
07c538 bmi.b      $7c57e
07c53a tst.w      $2de2(a3)
07c53e bne.w      $7c7e0
07c542 cmpi.w     #$1, $2fa6(a3)
07c548 beq.w      $7c664
07c54c cmpi.w     #$2, $2fa6(a3)
07c552 beq.w      $7c6a4
07c556 cmpi.w     #$3, $2fa6(a3)
07c55c beq.w      $7c6e0
07c560 cmpi.w     #$5, $2fa6(a3)
07c566 beq.w      $7c71c
07c56a cmpi.w     #$6, $2fa6(a3)
07c570 beq.w      $7c760
07c574 cmpi.w     #$7, $2fa6(a3)
07c57a bra.w      $7c7a0
07c57e cmpi.l     #$1, $2f36(a3)
07c586 beq.w      $7c61a
07c58a cmpi.l     #$2, $2f36(a3)
07c592 beq.b      $7c5ee
07c594 cmpi.l     #$3, $2f36(a3)
07c59c beq.w      $7c632
07c5a0 move.l     a0, (a4)+
07c5a2 move.l     a1, (a4)+
07c5a4 move.l     a2, (a4)+
07c5a6 move.l     a2, (a4)+
07c5a8 move.w     d6, (a4)+
07c5aa adda.w     d1, a1
07c5ac adda.w     d4, a2
07c5ae move.l     a0, (a4)+
07c5b0 move.l     a1, (a4)+
07c5b2 move.l     a2, (a4)+
07c5b4 move.l     a2, (a4)+
07c5b6 move.w     d6, (a4)+
07c5b8 adda.w     d1, a1
07c5ba adda.w     d4, a2
07c5bc move.l     a0, (a4)+
07c5be move.l     a1, (a4)+
07c5c0 move.l     a2, (a4)+
07c5c2 move.l     a2, (a4)+
07c5c4 move.w     d6, (a4)+
07c5c6 cmpi.l     #$5, $2f36(a3)
07c5ce beq.b      $7c5de
07c5d0 adda.w     d4, a2
07c5d2 move.w     d0, (a4)+
07c5d4 move.l     a0, (a4)+
07c5d6 move.l     a2, (a4)+
07c5d8 move.l     a2, (a4)+
07c5da move.w     d6, (a4)+
07c5dc rts        
07c5de adda.w     d1, a1
07c5e0 adda.w     d4, a2
07c5e2 move.l     a0, (a4)+
07c5e4 move.l     a1, (a4)+
07c5e6 move.l     a2, (a4)+
07c5e8 move.l     a2, (a4)+
07c5ea move.w     d6, (a4)+
07c5ec rts        
07c5ee move.l     a0, (a4)+
07c5f0 move.l     a1, (a4)+
07c5f2 move.l     a2, (a4)+
07c5f4 move.l     a2, (a4)+
07c5f6 move.w     d6, (a4)+
07c5f8 adda.w     d4, a2
07c5fa move.w     d0, (a4)+
07c5fc move.l     a0, (a4)+
07c5fe move.l     a2, (a4)+
07c600 move.l     a2, (a4)+
07c602 move.w     d6, (a4)+
07c604 adda.w     d4, a2
07c606 move.l     a0, (a4)+
07c608 move.l     a2, (a4)+
07c60a move.l     a2, (a4)+
07c60c move.w     d6, (a4)+
07c60e adda.w     d4, a2
07c610 move.l     a0, (a4)+
07c612 move.l     a2, (a4)+
07c614 move.l     a2, (a4)+
07c616 move.w     d6, (a4)+
07c618 rts        
07c61a andi.w     #$f000, -$e(a4)
07c620 ori.w      #$bfa, -$e(a4)
07c626 adda.w     d4, a2
07c628 move.l     a1, (a4)+
07c62a move.l     a2, (a4)+
07c62c move.l     a2, (a4)+
07c62e move.w     d6, (a4)+
07c630 rts        
07c632 move.l     a0, (a4)+
07c634 move.l     a1, (a4)+
07c636 move.l     a2, (a4)+
07c638 move.l     a2, (a4)+
07c63a move.w     d6, (a4)+
07c63c adda.w     d1, a1
07c63e adda.w     d4, a2
07c640 move.l     a0, (a4)+
07c642 move.l     a1, (a4)+
07c644 move.l     a2, (a4)+
07c646 move.l     a2, (a4)+
07c648 move.w     d6, (a4)+
07c64a adda.w     d4, a2
07c64c move.w     d0, (a4)+
07c64e move.l     a0, (a4)+
07c650 move.l     a2, (a4)+
07c652 move.l     a2, (a4)+
07c654 move.w     d6, (a4)+
07c656 adda.w     d4, a2
07c658 move.l     a0, (a4)+
07c65a move.l     a2, (a4)+
07c65c move.l     a2, (a4)+
07c65e move.w     d6, (a4)+
07c660 rts        
07c662 rts        
07c664 adda.l     d1, a0
07c666 adda.l     d1, a0
07c668 adda.w     d1, a1
07c66a adda.w     d1, a1
07c66c move.l     a0, (a4)+
07c66e move.l     a1, (a4)+
07c670 move.l     a2, (a4)+
07c672 move.l     a2, (a4)+
07c674 move.w     d6, (a4)+
07c676 suba.w     d1, a1
07c678 adda.w     d4, a2
07c67a move.l     a0, (a4)+
07c67c move.l     a1, (a4)+
07c67e move.l     a2, (a4)+
07c680 move.l     a2, (a4)+
07c682 move.w     d6, (a4)+
07c684 adda.w     d1, a1
07c686 adda.w     d1, a1
07c688 adda.w     d1, a1
07c68a adda.w     d4, a2
07c68c move.l     a0, (a4)+
07c68e move.l     a1, (a4)+
07c690 move.l     a2, (a4)+
07c692 move.l     a2, (a4)+
07c694 move.w     d6, (a4)+
07c696 adda.w     d4, a2
07c698 move.w     d0, (a4)+
07c69a move.l     a0, (a4)+
07c69c move.l     a2, (a4)+
07c69e move.l     a2, (a4)+
07c6a0 move.w     d6, (a4)+
07c6a2 rts        
07c6a4 adda.l     d1, a0
07c6a6 adda.l     d1, a0
07c6a8 move.l     a0, (a4)+
07c6aa move.l     a1, (a4)+
07c6ac move.l     a2, (a4)+
07c6ae move.l     a2, (a4)+
07c6b0 move.w     d6, (a4)+
07c6b2 adda.w     d1, a1
07c6b4 adda.w     d1, a1
07c6b6 adda.w     d1, a1
07c6b8 adda.w     d4, a2
07c6ba move.l     a0, (a4)+
07c6bc move.l     a1, (a4)+
07c6be move.l     a2, (a4)+
07c6c0 move.l     a2, (a4)+
07c6c2 move.w     d6, (a4)+
07c6c4 adda.w     d1, a1
07c6c6 adda.w     d4, a2
07c6c8 move.l     a0, (a4)+
07c6ca move.l     a1, (a4)+
07c6cc move.l     a2, (a4)+
07c6ce move.l     a2, (a4)+
07c6d0 move.w     d6, (a4)+
07c6d2 adda.w     d4, a2
07c6d4 move.w     d0, (a4)+
07c6d6 move.l     a0, (a4)+
07c6d8 move.l     a2, (a4)+
07c6da move.l     a2, (a4)+
07c6dc move.w     d6, (a4)+
07c6de rts        
07c6e0 adda.l     d1, a0
07c6e2 adda.l     d1, a0
07c6e4 adda.w     d1, a1
07c6e6 adda.w     d1, a1
07c6e8 move.l     a0, (a4)+
07c6ea move.l     a1, (a4)+
07c6ec move.l     a2, (a4)+
07c6ee move.l     a2, (a4)+
07c6f0 move.w     d6, (a4)+
07c6f2 adda.w     d1, a1
07c6f4 adda.w     d4, a2
07c6f6 move.l     a0, (a4)+
07c6f8 move.l     a1, (a4)+
07c6fa move.l     a2, (a4)+
07c6fc move.l     a2, (a4)+
07c6fe move.w     d6, (a4)+
07c700 adda.w     d1, a1
07c702 adda.w     d4, a2
07c704 move.l     a0, (a4)+
07c706 move.l     a1, (a4)+
07c708 move.l     a2, (a4)+
07c70a move.l     a2, (a4)+
07c70c move.w     d6, (a4)+
07c70e adda.w     d4, a2
07c710 move.w     d0, (a4)+
07c712 move.l     a0, (a4)+
07c714 move.l     a2, (a4)+
07c716 move.l     a2, (a4)+
07c718 move.w     d6, (a4)+
07c71a rts        
07c71c adda.l     d1, a0
07c71e adda.l     d1, a0
07c720 adda.w     d1, a1
07c722 adda.w     d1, a1
07c724 move.l     a0, (a4)+
07c726 move.l     a1, (a4)+
07c728 move.l     a2, (a4)+
07c72a move.l     a2, (a4)+
07c72c move.w     d6, (a4)+
07c72e suba.w     d1, a1
07c730 adda.w     d4, a2
07c732 move.l     a0, (a4)+
07c734 move.l     a1, (a4)+
07c736 move.l     a2, (a4)+
07c738 move.l     a2, (a4)+
07c73a move.w     d6, (a4)+
07c73c adda.w     d1, a1
07c73e adda.w     d1, a1
07c740 adda.w     d1, a1
07c742 adda.w     d4, a2
07c744 move.l     a0, (a4)+
07c746 move.l     a1, (a4)+
07c748 move.l     a2, (a4)+
07c74a move.l     a2, (a4)+
07c74c move.w     d6, (a4)+
07c74e adda.w     d1, a1
07c750 adda.w     d1, a1
07c752 adda.w     d4, a2
07c754 move.l     a0, (a4)+
07c756 move.l     a1, (a4)+
07c758 move.l     a2, (a4)+
07c75a move.l     a2, (a4)+
07c75c move.w     d6, (a4)+
07c75e rts        
07c760 adda.l     d1, a0
07c762 adda.l     d1, a0
07c764 move.l     a0, (a4)+
07c766 move.l     a1, (a4)+
07c768 move.l     a2, (a4)+
07c76a move.l     a2, (a4)+
07c76c move.w     d6, (a4)+
07c76e adda.w     d1, a1
07c770 adda.w     d1, a1
07c772 adda.w     d1, a1
07c774 adda.w     d4, a2
07c776 move.l     a0, (a4)+
07c778 move.l     a1, (a4)+
07c77a move.l     a2, (a4)+
07c77c move.l     a2, (a4)+
07c77e move.w     d6, (a4)+
07c780 adda.w     d1, a1
07c782 adda.w     d4, a2
07c784 move.l     a0, (a4)+
07c786 move.l     a1, (a4)+
07c788 move.l     a2, (a4)+
07c78a move.l     a2, (a4)+
07c78c move.w     d6, (a4)+
07c78e adda.w     d1, a1
07c790 adda.w     d1, a1
07c792 adda.w     d4, a2
07c794 move.l     a0, (a4)+
07c796 move.l     a1, (a4)+
07c798 move.l     a2, (a4)+
07c79a move.l     a2, (a4)+
07c79c move.w     d6, (a4)+
07c79e rts        
07c7a0 adda.l     d1, a0
07c7a2 adda.l     d1, a0
07c7a4 adda.w     d1, a1
07c7a6 adda.w     d1, a1
07c7a8 move.l     a0, (a4)+
07c7aa move.l     a1, (a4)+
07c7ac move.l     a2, (a4)+
07c7ae move.l     a2, (a4)+
07c7b0 move.w     d6, (a4)+
07c7b2 adda.w     d1, a1
07c7b4 adda.w     d4, a2
07c7b6 move.l     a0, (a4)+
07c7b8 move.l     a1, (a4)+
07c7ba move.l     a2, (a4)+
07c7bc move.l     a2, (a4)+
07c7be move.w     d6, (a4)+
07c7c0 adda.w     d1, a1
07c7c2 adda.w     d4, a2
07c7c4 move.l     a0, (a4)+
07c7c6 move.l     a1, (a4)+
07c7c8 move.l     a2, (a4)+
07c7ca move.l     a2, (a4)+
07c7cc move.w     d6, (a4)+
07c7ce adda.w     d1, a1
07c7d0 adda.w     d1, a1
07c7d2 adda.w     d4, a2
07c7d4 move.l     a0, (a4)+
07c7d6 move.l     a1, (a4)+
07c7d8 move.l     a2, (a4)+
07c7da move.l     a2, (a4)+
07c7dc move.w     d6, (a4)+
07c7de rts        
07c7e0 move.w     $2fa6(a3), d0
07c7e4 subq.w     #$1, d0
07c7e6 mulu.w     #$96fc, d0
07c7ea adda.l     d0, a0
07c7ec adda.l     d0, a1
07c7ee move.l     a0, (a4)+
07c7f0 move.l     a1, (a4)+
07c7f2 move.l     a2, (a4)+
07c7f4 move.l     a2, (a4)+
07c7f6 move.w     d6, (a4)+
07c7f8 adda.w     d1, a1
07c7fa adda.w     d4, a2
07c7fc move.l     a0, (a4)+
07c7fe move.l     a1, (a4)+
07c800 move.l     a2, (a4)+
07c802 move.l     a2, (a4)+
07c804 move.w     d6, (a4)+
07c806 adda.w     d1, a1
07c808 adda.w     d4, a2
07c80a move.l     a0, (a4)+
07c80c move.l     a1, (a4)+
07c80e move.l     a2, (a4)+
07c810 move.l     a2, (a4)+
07c812 move.w     d6, (a4)+
07c814 adda.w     d1, a1
07c816 adda.w     d4, a2
07c818 move.l     a0, (a4)+
07c81a move.l     a1, (a4)+
07c81c move.l     a2, (a4)+
07c81e move.l     a2, (a4)+
07c820 move.w     d6, (a4)+
07c822 rts        
07c824 tst.w      $2de2(a3)
07c828 bne.b      $7c848
07c82a tst.w      $2de0(a3)
07c82e beq.b      $7c85e
07c830 lea.l      $7cbe6(pc), a0
07c834 move.b     (a0, d7.w), $3027(a3)
07c83a move.b     $11(a0, d7.w), $3029(a3)
07c840 move.b     $11(a0, d7.w), $302b(a3)
07c846 bra.b      $7c85e
07c848 lea.l      $7cc08(pc), a0
07c84c move.b     (a0, d7.w), $3027(a3)
07c852 move.b     $11(a0, d7.w), $3029(a3)
07c858 move.b     $11(a0, d7.w), $302b(a3)
07c85e cmpi.w     #$f0, $2fac(a3)
07c864 bmi.w      $7c928
07c868 clr.w      $302c(a3)
07c86c cmpi.w     #$fc, $2fac(a3)
07c872 bne.b      $7c87a
07c874 move.w     $3026(a3), $302c(a3)
07c87a addi.w     #$a0, d1
07c87e move.w     d1, $2ee4(a3)
07c882 move.w     d2, $2ee6(a3)
07c886 move.w     $2ee8(a3), d0
07c88a lsr.w      #$4, d0
07c88c move.w     d0, $2eea(a3)
07c890 lsr.w      $2eea(a3)
07c894 add.w      d0, d0
07c896 lea.l      -$4048(a3), a0
07c89a move.w     (a0, d0.w), d0
07c89e move.w     d0, $2ee8(a3)
07c8a2 tst.w      $2eb0(a3)
07c8a6 beq.b      $7c8c6
07c8a8 clr.w      $2eb0(a3)
07c8ac move.w     #$140, d4
07c8b0 clr.w      d2
07c8b2 move.w     $2f16(a3), d0
07c8b6 andi.w     #$ff, d0
07c8ba move.w     $2ee6(a3), d5
07c8be move.w     d0, d3
07c8c0 bsr.w      $7c9f2
07c8c4 rts        
07c8c6 clr.w      d2
07c8c8 move.w     $2ee4(a3), d4
07c8cc sub.w      $2ee8(a3), d4
07c8d0 move.w     $2ee6(a3), d5
07c8d4 move.w     $2eea(a3), d0
07c8d8 move.w     d5, d3
07c8da sub.w      d0, d3
07c8dc bsr.w      $7c9f2
07c8e0 move.w     $2ee4(a3), d2
07c8e4 add.w      $2ee8(a3), d2
07c8e8 move.w     #$140, d4
07c8ec move.w     $2ee6(a3), d5
07c8f0 move.w     $2eea(a3), d0
07c8f4 move.w     d5, d3
07c8f6 sub.w      d0, d3
07c8f8 bsr.w      $7c9f2
07c8fc clr.w      d2
07c8fe move.w     #$140, d4
07c902 move.w     $2ee6(a3), d5
07c906 move.w     $2eea(a3), d0
07c90a sub.w      d0, d5
07c90c move.w     d5, d3
07c90e lsr.w      #$1, d0
07c910 sub.w      d0, d3
07c912 cmpi.w     #$fd, $2fac(a3)
07c918 bne.b      $7c922
07c91a move.w     $2f16(a3), d3
07c91e andi.w     #$ff, d3
07c922 bsr.w      $7c9f2
07c926 rts        
07c928 addi.w     #$a0, d1
07c92c move.w     d1, $2ee4(a3)
07c930 move.w     d2, $2ee6(a3)
07c934 move.w     $2ee8(a3), d0
07c938 lsr.w      #$4, d0
07c93a move.w     d0, $2eea(a3)
07c93e lsr.w      $2eea(a3)
07c942 add.w      d0, d0
07c944 lea.l      -$4048(a3), a0
07c948 move.w     (a0, d0.w), d0
07c94c move.w     d0, $2ee8(a3)
07c950 move.w     $3026(a3), $302c(a3)
07c956 move.w     $2ee4(a3), d4
07c95a sub.w      $2ee8(a3), d4
07c95e move.w     $2ee6(a3), d5
07c962 move.w     $2eea(a3), d0
07c966 move.w     d5, d3
07c968 sub.w      d0, d3
07c96a move.w     d4, d2
07c96c lsr.w      #$3, d0
07c96e sub.w      d0, d2
07c970 bsr.w      $7c9f2
07c974 move.w     $3026(a3), $302c(a3)
07c97a move.w     $2ee4(a3), d2
07c97e add.w      $2ee8(a3), d2
07c982 move.w     $2ee6(a3), d5
07c986 move.w     $2eea(a3), d0
07c98a move.w     d5, d3
07c98c sub.w      d0, d3
07c98e move.w     d2, d4
07c990 lsr.w      #$3, d0
07c992 add.w      d0, d4
07c994 bsr.b      $7c9f2
07c996 move.w     $3028(a3), $302c(a3)
07c99c cmpi.w     #$7a, $2fac(a3)
07c9a2 beq.b      $7c9aa
07c9a4 move.w     $302a(a3), $302c(a3)
07c9aa move.w     $2eea(a3), d0
07c9ae lsr.w      #$3, d0
07c9b0 move.w     $2ee4(a3), d2
07c9b4 sub.w      $2ee8(a3), d2
07c9b8 sub.w      d0, d2
07c9ba move.w     $2ee4(a3), d4
07c9be add.w      $2ee8(a3), d4
07c9c2 add.w      d0, d4
07c9c4 move.w     $2ee6(a3), d5
07c9c8 move.w     $2eea(a3), d0
07c9cc sub.w      d0, d5
07c9ce move.w     d5, d3
07c9d0 lsr.w      #$1, d0
07c9d2 sub.w      d0, d3
07c9d4 move.w     d3, d0
07c9d6 add.w      d5, d0
07c9d8 lsr.w      #$1, d0
07c9da move.w     d0, $2f9e(a3)
07c9de cmpi.w     #$fd, $2fac(a3)
07c9e4 bne.b      $7c9ee
07c9e6 move.w     $2f14(a3), d3
07c9ea andi.w     #$ff, d3
07c9ee bsr.b      $7c9f2
07c9f0 rts        
07c9f2 tst.w      d2
07c9f4 bpl.b      $7c9f8
07c9f6 clr.w      d2
07c9f8 cmp.w      #$140, d4
07c9fc bmi.b      $7ca02
07c9fe move.w     #$140, d4
07ca02 tst.w      d3
07ca04 bpl.b      $7ca08
07ca06 clr.w      d3
07ca08 cmp.w      $2f34(a3), d5
07ca0c bmi.b      $7ca12
07ca0e move.w     $2f34(a3), d5
07ca12 cmp.w      d4, d2
07ca14 bpl.w      $7cada
07ca18 cmp.w      d5, d3
07ca1a bpl.w      $7cada
07ca1e move.w     d5, d7
07ca20 sub.w      d3, d7
07ca22 move.w     d4, d1
07ca24 lsr.w      #$4, d1
07ca26 move.w     d2, d0
07ca28 lsr.w      #$4, d0
07ca2a sub.w      d0, d1
07ca2c beq.b      $7ca36
07ca2e cmp.w      #$1, d1
07ca32 beq.b      $7ca60
07ca34 bra.b      $7ca90
07ca36 move.w     d2, d0
07ca38 andi.w     #$f, d0
07ca3c add.w      d0, d0
07ca3e move.w     d4, d1
07ca40 andi.w     #$f, d1
07ca44 add.w      d1, d1
07ca46 lea.l      $7ce72(pc), a1
07ca4a move.w     (a1, d0.w), d0
07ca4e lea.l      $7ce52(pc), a1
07ca52 and.w      (a1, d1.w), d0
07ca56 move.w     d2, d1
07ca58 lsr.w      #$4, d1
07ca5a bsr.w      $7cadc
07ca5e rts        
07ca60 lea.l      $7ce72(pc), a1
07ca64 move.w     d2, d0
07ca66 andi.w     #$f, d0
07ca6a add.w      d0, d0
07ca6c move.w     (a1, d0.w), d0
07ca70 move.w     d2, d1
07ca72 lsr.w      #$4, d1
07ca74 bsr.b      $7cadc
07ca76 lea.l      $7ce52(pc), a1
07ca7a move.w     d4, d0
07ca7c andi.w     #$f, d0
07ca80 beq.b      $7ca8e
07ca82 add.w      d0, d0
07ca84 move.w     (a1, d0.w), d0
07ca88 move.w     d4, d1
07ca8a lsr.w      #$4, d1
07ca8c bsr.b      $7cadc
07ca8e rts        
07ca90 lea.l      $7ce72(pc), a1
07ca94 move.w     d2, d0
07ca96 andi.w     #$f, d0
07ca9a beq.b      $7caa8
07ca9c add.w      d0, d0
07ca9e move.w     (a1, d0.w), d0
07caa2 move.w     d2, d1
07caa4 lsr.w      #$4, d1
07caa6 bsr.b      $7cadc
07caa8 lea.l      $7ce52(pc), a1
07caac move.w     d4, d0
07caae andi.w     #$f, d0
07cab2 beq.b      $7cac0
07cab4 add.w      d0, d0
07cab6 move.w     (a1, d0.w), d0
07caba move.w     d4, d1
07cabc lsr.w      #$4, d1
07cabe bsr.b      $7cadc
07cac0 move.w     d4, d0
07cac2 lsr.w      #$4, d0
07cac4 move.w     d2, d1
07cac6 addi.w     #$f, d1
07caca lsr.w      #$4, d1
07cacc sub.w      d1, d0
07cace move.w     d2, d1
07cad0 addi.w     #$f, d1
07cad4 lsr.w      #$4, d1
07cad6 bsr.w      $7cb62
07cada rts        
07cadc move.l     a2, -(a7)
07cade move.w     #$7, (a4)+
07cae2 move.w     d0, (a4)+
07cae4 move.w     d3, d6
07cae6 add.w      d6, d6
07cae8 lea.l      -$3d6a(a3), a1
07caec adda.w     (a1, d6.w), a2
07caf0 adda.w     d1, a2
07caf2 adda.w     d1, a2
07caf4 adda.l     $2f74(a3), a2
07caf8 addq.w     #$2, a2
07cafa move.w     d7, d6
07cafc asl.w      #$6, d6
07cafe addq.w     #$1, d6
07cb00 move.w     $302c(a3), d1
07cb04 move.w     #$20d0, d0
07cb08 move.w     #$9fc, (a4)+
07cb0c lsr.w      #$1, d1
07cb0e bcs.b      $7cb16
07cb10 move.w     #$930, -$2(a4)
07cb16 move.l     a2, (a4)+
07cb18 move.l     a2, (a4)+
07cb1a move.w     d6, (a4)+
07cb1c adda.w     d0, a2
07cb1e move.w     #$9fc, (a4)+
07cb22 lsr.w      #$1, d1
07cb24 bcs.b      $7cb2c
07cb26 move.w     #$930, -$2(a4)
07cb2c move.l     a2, (a4)+
07cb2e move.l     a2, (a4)+
07cb30 move.w     d6, (a4)+
07cb32 adda.w     d0, a2
07cb34 move.w     #$9fc, (a4)+
07cb38 lsr.w      #$1, d1
07cb3a bcs.b      $7cb42
07cb3c move.w     #$930, -$2(a4)
07cb42 move.l     a2, (a4)+
07cb44 move.l     a2, (a4)+
07cb46 move.w     d6, (a4)+
07cb48 adda.w     d0, a2
07cb4a move.w     #$9fc, (a4)+
07cb4e lsr.w      #$1, d1
07cb50 bcs.b      $7cb58
07cb52 move.w     #$930, -$2(a4)
07cb58 move.l     a2, (a4)+
07cb5a move.l     a2, (a4)+
07cb5c move.w     d6, (a4)+
07cb5e movea.l    (a7)+, a2
07cb60 rts        
07cb62 move.l     a2, -(a7)
07cb64 move.w     #$6, (a4)+
07cb68 moveq      #$15, d6
07cb6a sub.w      d0, d6
07cb6c add.w      d6, d6
07cb6e move.w     d6, (a4)+
07cb70 move.w     d3, d6
07cb72 add.w      d6, d6
07cb74 lea.l      -$3d6a(a3), a1
07cb78 adda.w     (a1, d6.w), a2
07cb7c adda.w     d1, a2
07cb7e adda.w     d1, a2
07cb80 adda.l     $2f74(a3), a2
07cb84 addq.w     #$2, a2
07cb86 move.w     d7, d6
07cb88 asl.w      #$6, d6
07cb8a add.w      d0, d6
07cb8c move.w     $302c(a3), d1
07cb90 move.w     #$20d0, d0
07cb94 move.w     #$1ff, (a4)+
07cb98 lsr.w      #$1, d1
07cb9a bcs.b      $7cba2
07cb9c move.w     #$100, -$2(a4)
07cba2 move.l     a2, (a4)+
07cba4 move.w     d6, (a4)+
07cba6 adda.w     d0, a2
07cba8 move.w     #$1ff, (a4)+
07cbac lsr.w      #$1, d1
07cbae bcs.b      $7cbb6
07cbb0 move.w     #$100, -$2(a4)
07cbb6 move.l     a2, (a4)+
07cbb8 move.w     d6, (a4)+
07cbba adda.w     d0, a2
07cbbc move.w     #$1ff, (a4)+
07cbc0 lsr.w      #$1, d1
07cbc2 bcs.b      $7cbca
07cbc4 move.w     #$100, -$2(a4)
07cbca move.l     a2, (a4)+
07cbcc move.w     d6, (a4)+
07cbce adda.w     d0, a2
07cbd0 move.w     #$1ff, (a4)+
07cbd4 lsr.w      #$1, d1
07cbd6 bcs.b      $7cbde
07cbd8 move.w     #$100, -$2(a4)
07cbde move.l     a2, (a4)+
07cbe0 move.w     d6, (a4)+
07cbe2 movea.l    (a7)+, a2
07cbe4 rts        
07cbe6 btst.l     d0, d1
07cbe8 btst.l     d0, d1
07cbea movep.w    $909(a1), d0
07cbee movep.w    $202(a1), d4
07cbf2 andi.b     #$0, d2
07cbf6 .byte      0x00, 0x0d
07cbf8 movep.w    $d01(a5), d6
07cbfc btst.l     d0, d1
07cbfe movep.w    $909(a1), d0
07cc02 btst.l     d4, d2
07cc04 andi.b     #$2, d2
07cc08 ori.b      #$0, d0
07cc0c .byte      0x0a, 0x0a
07cc0e eori.b     #$9, d2
07cc12 movep.w    $e0d(a6), d4
07cc16 btst.l     d6, d1
07cc18 movep.w    $909(a1), d0
07cc1c movep.w    $e0e(a6), d4
07cc20 .byte      0x0e, 0x0d
07cc22 movep.w    $d01(a5), d6
07cc26 btst.l     d0, d1
07cc28 btst.l     d0, d1
07cc2a .byte      0xff, 0xc0
07cc2c ori.w      #$ff80, d0
07cc30 ori.b      #$80, d0
07cc34 ori.b      #$80, d0
07cc38 ori.b      #$80, d0
07cc3c ori.b      #$80, d0
07cc40 ori.b      #$80, d0
07cc44 ori.b      #$80, d0
07cc48 ori.b      #$80, d0
07cc4c ori.b      #$c0, d0
07cc50 ori.w      #$0, d0
07cc54 and.b      d0, d5
07cc56 ori.b      #$0, d1
07cc5a ori.b      #$0, d1
07cc5e ori.b      #$0, d1
07cc62 ori.b      #$0, d2
07cc66 ori.b      #$0, d2
07cc6a ori.b      #$0, d2
07cc6e ori.b      #$0, d3
07cc72 ori.b      #$0, d3
07cc76 ori.b      #$0, d4
07cc7a ori.b      #$0, d4
07cc7e ori.b      #$0, d4
07cc82 ori.b      #$0, d5
07cc86 ori.b      #$0, d5
07cc8a ori.b      #$0, d5
07cc8e ori.b      #$0, d6
07cc92 ori.b      #$0, d6
07cc96 ori.b      #$0, d7
07cc9a ori.b      #$0, d7
07cc9e ori.b      #$0, d7
07cca2 .byte      0xff, 0xff
07cca4 .byte      0xff, 0xff
07cca6 .byte      0xff, 0xff
07cca8 .byte      0xff, 0xff
07ccaa .byte      0xff, 0xff
07ccac move.b     (a0), d0
07ccae movep.w    $e0e(a7), d7
07ccb2 movep.w    $d0d(a5), d6
07ccb6 .byte      0x0c, 0x0c
07ccb8 .byte      0x0c, 0x0c
07ccba movep.w    $b0b(a3), d5
07ccbe .byte      0x0a, 0x0a
07ccc0 .byte      0x0a, 0x0a
07ccc2 movep.w    $909(a1), d4
07ccc6 movep.w    $909(a1), d4
07ccca .byte      0x08, 0x08
07cccc .byte      0x08, 0x08
07ccce .byte      0x08, 0x08
07ccd0 .byte      0x08, 0x08
07ccd2 btst.l     d3, d7
07ccd4 btst.l     d3, d7
07ccd6 btst.l     d3, d7
07ccd8 btst.l     d3, d7
07ccda addi.b     #$6, d6
07ccde addi.b     #$6, d6
07cce2 btst.l     d2, d5
07cce4 btst.l     d2, d5
07cce6 btst.l     d2, d5
07cce8 btst.l     d2, d5
07ccea btst.l     d2, d5
07ccec btst.l     d2, d5
07ccee btst.l     d2, d5
07ccf0 btst.l     d2, d5
07ccf2 subi.b     #$4, d4
07ccf6 subi.b     #$4, d4
07ccfa subi.b     #$4, d4
07ccfe subi.b     #$4, d4
07cd02 btst.l     d1, d3
07cd04 btst.l     d1, d3
07cd06 btst.l     d1, d3
07cd08 btst.l     d1, d3
07cd0a btst.l     d1, d3
07cd0c btst.l     d1, d3
07cd0e btst.l     d1, d3
07cd10 btst.l     d1, d3
07cd12 andi.b     #$2, d2
07cd16 andi.b     #$2, d2
07cd1a andi.b     #$2, d2
07cd1e andi.b     #$2, d2
07cd22 btst.l     d0, d1
07cd24 btst.l     d0, d1
07cd26 btst.l     d0, d1
07cd28 btst.l     d0, d1
07cd2a btst.l     d0, d1
07cd2c btst.l     d0, d1
07cd2e btst.l     d0, d1
07cd30 btst.l     d0, d1
07cd32 btst.l     d0, d1
07cd34 btst.l     d0, d1
07cd36 btst.l     d0, d1
07cd38 btst.l     d0, d1
07cd3a btst.l     d0, d1
07cd3c btst.l     d0, d1
07cd3e btst.l     d0, d1
07cd40 btst.l     d0, d1
07cd42 ori.b      #$0, d0
07cd46 ori.b      #$0, d0
07cd4a ori.b      #$0, d0
07cd4e ori.b      #$0, d0
07cd52 ori.b      #$0, d0
07cd56 ori.b      #$0, d0
07cd5a ori.b      #$0, d0
07cd5e ori.b      #$0, d0
07cd62 ori.b      #$0, d0
07cd66 ori.b      #$0, d0
07cd6a ori.b      #$0, d0
07cd6e ori.b      #$0, d0
07cd72 ori.b      #$0, d0
07cd76 ori.b      #$0, d0
07cd7a ori.b      #$0, d0
07cd7e ori.b      #$0, d0
07cd82 .byte      0xff, 0xff
07cd84 .byte      0xff, 0xff
07cd86 .byte      0xff, 0xff
07cd88 .byte      0xff, 0xff
07cd8a .byte      0xff, 0xff
07cd8c .byte      0xff, 0xff
07cd8e .byte      0xff, 0xff
07cd90 .byte      0xff, 0xff
07cd92 .byte      0xff, 0xff
07cd94 .byte      0xff, 0xff
07cd96 .byte      0xff, 0xff
07cd98 .byte      0xff, 0xff
07cd9a .byte      0xff, 0xff
07cd9c .byte      0xff, 0xff
07cd9e .byte      0xff, 0xff
07cda0 .byte      0xff, 0xff
07cda2 or.b       d0, d0
07cda4 or.b       d0, d0
07cda6 or.b       d0, d0
07cda8 or.b       d0, d0
07cdaa or.b       d0, d0
07cdac or.b       d0, d0
07cdae or.b       d0, d0
07cdb0 or.b       d0, d0
07cdb2 and.b      d0, d0
07cdb4 and.b      d0, d0
07cdb6 and.b      d0, d0
07cdb8 and.b      d0, d0
07cdba and.b      d0, d0
07cdbc and.b      d0, d0
07cdbe or.b       d0, d0
07cdc0 negx.b     d0
07cdc2 and.b      d0, d0
07cdc4 and.b      d0, d0
07cdc6 and.b      d0, d0
07cdc8 and.b      d0, d0
07cdca or.b       d0, d0
07cdcc negx.b     d0
07cdce and.b      d0, d0
07cdd0 and.b      d0, d0
07cdd2 asr.b      #$8, d0
07cdd4 negx.b     d0
07cdd6 and.b      d0, d0
07cdd8 bra.w      $7adda
07cddc asr.b      #$8, d0
07cdde and.b      d0, d0
07cde0 bra.w      $7ade2
07cde4 asr.b      #$8, d0
07cde6 asr.b      #$8, d0
07cde8 asr.b      #$8, d0
07cdea asr.b      #$8, d0
07cdec asr.b      #$8, d0
07cdee asr.b      #$8, d0
07cdf0 asr.b      #$8, d0
07cdf2 negx.b     d0
07cdf4 asr.b      #$8, d0
07cdf6 bra.w      $78df8
07cdfa and.b      d0, d0
07cdfc bra.w      $7adfe
07ce00 asr.b      #$8, d0
07ce02 bra.w      $7ee04
07ce06 negx.b     d0
07ce08 bra.w      $82e0a
07ce0c bra.w      $78e0e
07ce10 move.w     d0, d0
07ce12 dc.w       $f000
07ce14 moveq      #$0, d0
07ce16 asr.b      #$8, d0
07ce18 dc.w       $f000
07ce1a dc.w       $f000
07ce1c dc.w       $f000
07ce1e asr.b      #$8, d0
07ce20 moveq      #$0, d0
07ce22 dc.w       $f000
07ce24 dc.w       $f000
07ce26 dc.w       $f000
07ce28 moveq      #$0, d0
07ce2a asr.b      #$8, d0
07ce2c dc.w       $f000
07ce2e moveq      #$0, d0
07ce30 asr.b      #$8, d0
07ce32 bra.w      $82e34
07ce36 bra.w      $7ee38
07ce3a negx.b     d0
07ce3c bra.w      $7fe3e
07ce40 and.b      d0, d0
07ce42 or.b       d0, d0
07ce44 or.b       d0, d0
07ce46 or.b       d0, d0
07ce48 or.b       d0, d0
07ce4a or.b       d0, d0
07ce4c or.b       d0, d0
07ce4e or.b       d0, d0
07ce50 or.b       d0, d0
07ce52 ori.b      #$0, d0
07ce56 and.b      d0, d0
07ce58 asr.b      #$8, d0
07ce5a dc.w       $f000
07ce5c dc.w       $f800
07ce5e dc.w       $fc00
07ce60 dc.w       $fe00
07ce62 .byte      0xff, 0x00
07ce64 .byte      0xff, 0x80
07ce66 .byte      0xff, 0xc0
07ce68 .byte      0xff, 0xe0
07ce6a .byte      0xff, 0xf0
07ce6c .byte      0xff, 0xf8
07ce6e .byte      0xff, 0xfc
07ce70 .byte      0xff, 0xfe
07ce72 .byte      0xff, 0xff
07ce74 .byte      0x7f, 0xff
07ce76 .byte      0x3f, 0xff
07ce78 .byte      0x1f, 0xff
07ce7a .byte      0x0f, 0xff
07ce7c .byte      0x07, 0xff
07ce7e .byte      0x03, 0xff
07ce80 .byte      0x01, 0xff
07ce82 .byte      0x00, 0xff
07ce84 .byte      0x00, 0x7f
07ce86 .byte      0x00, 0x3f
07ce88 ori.b      #$f, (a7)+
07ce8c ori.b      #$3, d7
07ce90 ori.b      #$1, d1
07ce94 andi.b     #$5, d3
07ce98 addi.b     #$9, d7
07ce9c movep.w    $a0b(a2), d4
07cea0 .byte      0x0c, 0x0c
07cea2 movep.w    $e0e(a5), d6
07cea6 movep.w    $1011(a7), d7
07ceaa move.b     (a2), -(a0)
07ceac move.b     (a3), d1
07ceae move.b     (a4), -(a1)
07ceb0 move.b     (a5), d2
07ceb2 move.b     (a6), d3
07ceb4 move.b     (a7), -(a3)
07ceb6 move.b     (a0)+, d4
07ceb8 move.b     (a1)+, -(a4)
07ceba move.b     (a3)+, d5
07cebc move.b     (a4)+, -(a5)
07cebe move.b     (a5)+, d6
07cec0 move.b     (a5)+, -(a6)
07cec2 move.b     (a6)+, d7
07cec4 move.b     (a7)+, d7
07cec6 move.b     (a7)+, -(a7)
07cec8 move.l     -(a0), d0
07ceca move.l     -(a1), d0
07cecc move.l     -(a1), -(a0)
07cece move.l     -(a2), d1
07ced0 move.l     -(a3), d1
07ced2 move.l     -(a3), -(a1)
07ced4 move.l     -(a4), d2
07ced6 move.l     -(a5), d2
07ced8 move.l     -(a5), -(a2)
07ceda move.l     -(a6), d3
07cedc move.l     -(a7), d3
07cede move.l     -(a7), -(a3)
07cee0 move.l     $282b(a0), d4
07cee4 move.l     $2a2a(a3), -(a5)
07cee8 move.l     $2929(a1), d5
07ceec move.l     $2e2d(a6), d7
07cef0 move.l     $2c2c(a5), -(a6)
07cef4 move.l     ([$3030302f, a1, d3.w]), d6
07cefc move.l     $3434(a7), -(a7)
07cf00 move.w     ([$32323237, a3, d3.w * 2], $37373636), d2
07cf0c move.w     ([$3a3a3a39, a5], d3.w * 4), d3
07cf14 move.w     $3838383d.l, -(a4)
07cf1a .byte      0x3d, 0x3d
07cf1c move.w     #$3c3b, d6
07cf20 move.w     $7cf60(pc, d3.l), -(a5)
07cf24 .byte      0x3e, 0x3e
07cf26 .byte      0x3e, 0x3e
07cf28 .byte      0x3e, 0x3e
07cf2a move.w     d2, d7
07cf2c andi.b     #$1, d2
07cf30 btst.l     d0, d0
07cf32 ori.b      #$5, d0
07cf36 btst.l     d2, d4
07cf38 subi.b     #$3, d4
07cf3c movep.w    $808(a0), d1
07cf40 btst.l     d3, d7
07cf42 btst.l     d3, d6
07cf44 addi.b     #$b, d6
07cf48 movep.w    $a0a(a2), d5
07cf4c movep.w    $90e(a1), d4
07cf50 .byte      0x0e, 0x0e
07cf52 movep.w    $d0c(a5), d6
07cf56 .byte      0x0c, 0x0c
07cf58 move.b     (a1), -(a0)
07cf5a move.b     (a0), -(a0)
07cf5c move.b     (a0), d0
07cf5e movep.w    $f14(a7), d7
07cf62 move.b     (a4), d2
07cf64 move.b     (a3), -(a1)
07cf66 move.b     (a2), -(a1)
07cf68 move.b     (a2), d1
07cf6a move.b     (a7), -(a3)
07cf6c move.b     (a6), -(a3)
07cf6e move.b     (a6), d3
07cf70 move.b     (a5), -(a2)
07cf72 move.b     (a2)+, -(a2)
07cf74 move.b     (a2)+, d5
07cf76 move.b     (a1)+, -(a4)
07cf78 move.b     (a0)+, -(a4)
07cf7a move.b     (a0)+, d4
07cf7c move.b     (a5)+, -(a6)
07cf7e move.b     (a4)+, -(a6)
07cf80 move.b     (a4)+, d6
07cf82 move.b     (a3)+, -(a5)
07cf84 move.b     -(a0), -(a5)
07cf86 move.l     -(a0), d0
07cf88 move.b     (a7)+, -(a7)
07cf8a move.b     (a6)+, -(a7)
07cf8c move.b     (a6)+, d7
07cf8e move.l     -(a3), -(a1)
07cf90 move.l     -(a2), -(a1)
07cf92 move.l     -(a2), d1
07cf94 move.l     -(a1), -(a0)
07cf96 move.l     -(a6), -(a0)
07cf98 move.l     -(a6), d3
07cf9a move.l     -(a5), -(a2)
07cf9c move.l     -(a4), -(a2)
07cf9e move.l     -(a4), d2
07cfa0 move.l     $2928(a1), -(a4)
07cfa4 move.l     $2727(a0), d4
07cfa8 move.l     $2c2c(a4), -(a3)
07cfac move.l     $2b2a(a3), -(a5)
07cfb0 move.l     $2f2f(a2), d5
07cfb4 move.l     $2e2e(a6), -(a7)
07cfb8 move.l     $2d30(a5), -(a6)
07cfbc move.w     $30(a0, d3.w), d0
07cfc0 move.w     $30(a0, d3.w), d0
07cfc4 .byte      0xf9, 0xf0
07cfc6 .byte      0xe9, 0xf0
07cfc8 adda.l     $b9f0a9f0(invalid.w), a4
07cfd0 suba.l     $79f069f0(invalid.w), a4
07cfd8 svs.b      $39f029f0(invalid.w)
07cfe0 .byte      0x19, 0xf0
07cfe2 bset.b     d4, $ffffffff(a0, invalid.w)
07cfea ori.w      #$2d5d, d4
07cfee ori.w      #$6700, (a4)
07cff2 bclr.b     d0, $3d7c(a2)
07cff6 ori.b      #$66, d2
07cffa move.l     #$1000000, $40(a6)
07d002 move.l     #$7d016, $6c.w
07d00a move.w     #$40, $9c(a6)
07d010 move.w     (a5)+, $58(a6)
07d014 rte        
07d016 move.l     (a5)+, $54(a6)
07d01a move.l     #$7d02e, $6c.w
07d022 move.w     #$40, $9c(a6)
07d028 move.w     (a5)+, $58(a6)
07d02c rte        
07d02e move.w     #$2, $66(a6)
07d034 move.l     (a5)+, $54(a6)
07d038 bmi.b      $7d09c
07d03a move.l     #$7d04e, $6c.w
07d042 move.w     #$40, $9c(a6)
07d048 move.w     (a5)+, $58(a6)
07d04c rte        
07d04e move.l     (a5)+, $54(a6)
07d052 move.l     #$7d066, $6c.w
07d05a move.w     #$40, $9c(a6)
07d060 move.w     (a5)+, $58(a6)
07d064 rte        
07d066 move.l     (a5)+, $54(a6)
07d06a move.w     #$1ff, $40(a6)
07d070 move.l     #$7d084, $6c.w
07d078 move.w     #$40, $9c(a6)
07d07e move.w     (a5)+, $58(a6)
07d082 rte        
07d084 move.l     (a5)+, $54(a6)
07d088 move.l     #$7d09c, $6c.w
07d090 move.w     #$40, $9c(a6)
07d096 move.w     (a5)+, $58(a6)
07d09a rte        
07d09c clr.w      $66(a6)
07d0a0 clr.w      $42(a6)
07d0a4 move.w     #$4e, $64(a6)
07d0aa move.l     (a5)+, $54(a6)
07d0ae bmi.b      $7d120
07d0b0 move.l     (a5)+, $50(a6)
07d0b4 move.w     (a5)+, $40(a6)
07d0b8 move.l     #$7d0cc, $6c.w
07d0c0 move.w     #$40, $9c(a6)
07d0c6 move.w     (a5)+, $58(a6)
07d0ca rte        
07d0cc move.l     (a5)+, $54(a6)
07d0d0 move.l     (a5)+, $50(a6)
07d0d4 move.l     #$7d0e8, $6c.w
07d0dc move.w     #$40, $9c(a6)
07d0e2 move.w     (a5)+, $58(a6)
07d0e6 rte        
07d0e8 move.l     (a5)+, $54(a6)
07d0ec move.l     (a5)+, $50(a6)
07d0f0 move.l     #$7d104, $6c.w
07d0f8 move.w     #$40, $9c(a6)
07d0fe move.w     (a5)+, $58(a6)
07d102 rte        
07d104 move.l     (a5)+, $54(a6)
07d108 move.l     (a5)+, $50(a6)
07d10c move.l     #$7d120, $6c.w
07d114 move.w     #$40, $9c(a6)
07d11a move.w     (a5)+, $58(a6)
07d11e rte        
07d120 move.w     #$2, $66(a6)
07d126 move.l     #$1000000, $40(a6)
07d12e move.l     (a5)+, $54(a6)
07d132 bmi.b      $7d19c
07d134 move.l     #$7d148, $6c.w
07d13c move.w     #$40, $9c(a6)
07d142 move.w     (a5)+, $58(a6)
07d146 rte        
07d148 move.l     (a5)+, $54(a6)
07d14c move.l     #$7d160, $6c.w
07d154 move.w     #$40, $9c(a6)
07d15a move.w     (a5)+, $58(a6)
07d15e rte        
07d160 move.l     (a5)+, $54(a6)
07d164 move.w     #$1ff, $40(a6)
07d16a move.l     #$7d17e, $6c.w
07d172 move.w     #$40, $9c(a6)
07d178 move.w     (a5)+, $58(a6)
07d17c rte        
07d17e move.w     #$100, $40(a6)
07d184 move.l     (a5)+, $54(a6)
07d188 move.l     #$7d19c, $6c.w
07d190 move.w     #$40, $9c(a6)
07d196 move.w     (a5)+, $58(a6)
07d19a rte        
07d19c tst.w      (a5)+
07d19e beq.w      $7d7da
07d1a2 cmpi.w     #$1, -$2(a5)
07d1a8 beq.b      $7d204
07d1aa cmpi.w     #$2, -$2(a5)
07d1b0 beq.w      $7d234
07d1b4 cmpi.w     #$3, -$2(a5)
07d1ba beq.w      $7d2cc
07d1be cmpi.w     #$4, -$2(a5)
07d1c4 beq.w      $7d368
07d1c8 cmpi.w     #$5, -$2(a5)
07d1ce beq.w      $7d408
07d1d2 cmpi.w     #$6, -$2(a5)
07d1d8 beq.w      $7d4a8
07d1dc cmpi.w     #$7, -$2(a5)
07d1e2 beq.w      $7d52a
07d1e6 cmpi.w     #$a, -$2(a5)
07d1ec beq.w      $7d5c4
07d1f0 cmpi.w     #$b, -$2(a5)
07d1f6 beq.w      $7d676
07d1fa cmpi.w     #$c, -$2(a5)
07d200 beq.w      $7d728
07d204 move.l     (a5)+, $40(a6)
07d208 move.l     (a5)+, $60(a6)
07d20c move.l     (a5)+, $64(a6)
07d210 move.w     (a5)+, $46(a6)
07d214 move.l     (a5)+, $50(a6)
07d218 move.l     (a5)+, $48(a6)
07d21c move.l     (a5)+, $54(a6)
07d220 move.l     #$7d19c, $6c.w
07d228 move.w     #$40, $9c(a6)
07d22e move.w     (a5)+, $58(a6)
07d232 rte        
07d234 move.l     (a5)+, $40(a6)
07d238 move.l     (a5)+, $60(a6)
07d23c move.l     (a5)+, $64(a6)
07d240 move.w     (a5)+, $46(a6)
07d244 move.l     (a5)+, $50(a6)
07d248 move.l     (a5)+, $4c(a6)
07d24c move.l     (a5)+, $48(a6)
07d250 move.l     (a5)+, $54(a6)
07d254 move.l     #$7d268, $6c.w
07d25c move.w     #$40, $9c(a6)
07d262 move.w     (a5)+, $58(a6)
07d266 rte        
07d268 move.w     (a5)+, $40(a6)
07d26c move.l     (a5)+, $50(a6)
07d270 move.l     (a5)+, $48(a6)
07d274 move.l     (a5)+, $54(a6)
07d278 move.l     #$7d28c, $6c.w
07d280 move.w     #$40, $9c(a6)
07d286 move.w     (a5)+, $58(a6)
07d28a rte        
07d28c move.l     (a5)+, $50(a6)
07d290 move.l     (a5)+, $48(a6)
07d294 move.l     (a5)+, $54(a6)
07d298 move.l     #$7d2ac, $6c.w
07d2a0 move.w     #$40, $9c(a6)
07d2a6 move.w     (a5)+, $58(a6)
07d2aa rte        
07d2ac move.l     (a5)+, $50(a6)
07d2b0 move.l     (a5)+, $48(a6)
07d2b4 move.l     (a5)+, $54(a6)
07d2b8 move.l     #$7d19c, $6c.w
07d2c0 move.w     #$40, $9c(a6)
07d2c6 move.w     (a5)+, $58(a6)
07d2ca rte        
07d2cc move.l     (a5)+, $40(a6)
07d2d0 move.l     (a5)+, $60(a6)
07d2d4 move.l     (a5)+, $64(a6)
07d2d8 move.w     (a5)+, $46(a6)
07d2dc move.l     (a5)+, $50(a6)
07d2e0 move.l     (a5)+, $4c(a6)
07d2e4 move.l     (a5)+, $48(a6)
07d2e8 move.l     (a5)+, $54(a6)
07d2ec move.l     #$7d300, $6c.w
07d2f4 move.w     #$40, $9c(a6)
07d2fa move.w     (a5)+, $58(a6)
07d2fe rte        
07d300 move.l     (a5)+, $50(a6)
07d304 move.l     (a5)+, $4c(a6)
07d308 move.l     (a5)+, $48(a6)
07d30c move.l     (a5)+, $54(a6)
07d310 move.l     #$7d324, $6c.w
07d318 move.w     #$40, $9c(a6)
07d31e move.w     (a5)+, $58(a6)
07d322 rte        
07d324 move.w     (a5)+, $40(a6)
07d328 move.l     (a5)+, $50(a6)
07d32c move.l     (a5)+, $48(a6)
07d330 move.l     (a5)+, $54(a6)
07d334 move.l     #$7d348, $6c.w
07d33c move.w     #$40, $9c(a6)
07d342 move.w     (a5)+, $58(a6)
07d346 rte        
07d348 move.l     (a5)+, $50(a6)
07d34c move.l     (a5)+, $48(a6)
07d350 move.l     (a5)+, $54(a6)
07d354 move.l     #$7d19c, $6c.w
07d35c move.w     #$40, $9c(a6)
07d362 move.w     (a5)+, $58(a6)
07d366 rte        
07d368 move.l     (a5)+, $40(a6)
07d36c move.l     (a5)+, $60(a6)
07d370 move.l     (a5)+, $64(a6)
07d374 move.w     (a5)+, $46(a6)
07d378 move.l     (a5)+, $50(a6)
07d37c move.l     (a5)+, $4c(a6)
07d380 move.l     (a5)+, $48(a6)
07d384 move.l     (a5)+, $54(a6)
07d388 move.l     #$7d39c, $6c.w
07d390 move.w     #$40, $9c(a6)
07d396 move.w     (a5)+, $58(a6)
07d39a rte        
07d39c move.l     (a5)+, $50(a6)
07d3a0 move.l     (a5)+, $4c(a6)
07d3a4 move.l     (a5)+, $48(a6)
07d3a8 move.l     (a5)+, $54(a6)
07d3ac move.l     #$7d3c0, $6c.w
07d3b4 move.w     #$40, $9c(a6)
07d3ba move.w     (a5)+, $58(a6)
07d3be rte        
07d3c0 move.l     (a5)+, $50(a6)
07d3c4 move.l     (a5)+, $4c(a6)
07d3c8 move.l     (a5)+, $48(a6)
07d3cc move.l     (a5)+, $54(a6)
07d3d0 move.l     #$7d3e4, $6c.w
07d3d8 move.w     #$40, $9c(a6)
07d3de move.w     (a5)+, $58(a6)
07d3e2 rte        
07d3e4 move.w     (a5)+, $40(a6)
07d3e8 move.l     (a5)+, $50(a6)
07d3ec move.l     (a5)+, $48(a6)
07d3f0 move.l     (a5)+, $54(a6)
07d3f4 move.l     #$7d19c, $6c.w
07d3fc move.w     #$40, $9c(a6)
07d402 move.w     (a5)+, $58(a6)
07d406 rte        
07d408 move.l     (a5)+, $40(a6)
07d40c move.l     (a5)+, $60(a6)
07d410 move.l     (a5)+, $64(a6)
07d414 move.w     (a5)+, $46(a6)
07d418 move.l     (a5)+, $50(a6)
07d41c move.l     (a5)+, $4c(a6)
07d420 move.l     (a5)+, $48(a6)
07d424 move.l     (a5)+, $54(a6)
07d428 move.l     #$7d43c, $6c.w
07d430 move.w     #$40, $9c(a6)
07d436 move.w     (a5)+, $58(a6)
07d43a rte        
07d43c move.l     (a5)+, $50(a6)
07d440 move.l     (a5)+, $4c(a6)
07d444 move.l     (a5)+, $48(a6)
07d448 move.l     (a5)+, $54(a6)
07d44c move.l     #$7d460, $6c.w
07d454 move.w     #$40, $9c(a6)
07d45a move.w     (a5)+, $58(a6)
07d45e rte        
07d460 move.l     (a5)+, $50(a6)
07d464 move.l     (a5)+, $4c(a6)
07d468 move.l     (a5)+, $48(a6)
07d46c move.l     (a5)+, $54(a6)
07d470 move.l     #$7d484, $6c.w
07d478 move.w     #$40, $9c(a6)
07d47e move.w     (a5)+, $58(a6)
07d482 rte        
07d484 move.l     (a5)+, $50(a6)
07d488 move.l     (a5)+, $4c(a6)
07d48c move.l     (a5)+, $48(a6)
07d490 move.l     (a5)+, $54(a6)
07d494 move.l     #$7d19c, $6c.w
07d49c move.w     #$40, $9c(a6)
07d4a2 move.w     (a5)+, $58(a6)
07d4a6 rte        
07d4a8 move.l     #$ffffffff, $44(a6)
07d4b0 move.w     (a5)+, $66(a6)
07d4b4 move.w     #$0, $42(a6)
07d4ba move.w     (a5)+, $40(a6)
07d4be move.l     (a5)+, $54(a6)
07d4c2 move.l     #$7d4d6, $6c.w
07d4ca move.w     #$40, $9c(a6)
07d4d0 move.w     (a5)+, $58(a6)
07d4d4 rte        
07d4d6 move.w     (a5)+, $40(a6)
07d4da move.l     (a5)+, $54(a6)
07d4de move.l     #$7d4f2, $6c.w
07d4e6 move.w     #$40, $9c(a6)
07d4ec move.w     (a5)+, $58(a6)
07d4f0 rte        
07d4f2 move.w     (a5)+, $40(a6)
07d4f6 move.l     (a5)+, $54(a6)
07d4fa move.l     #$7d50e, $6c.w
07d502 move.w     #$40, $9c(a6)
07d508 move.w     (a5)+, $58(a6)
07d50c rte        
07d50e move.w     (a5)+, $40(a6)
07d512 move.l     (a5)+, $54(a6)
07d516 move.l     #$7d19c, $6c.w
07d51e move.w     #$40, $9c(a6)
07d524 move.w     (a5)+, $58(a6)
07d528 rte        
07d52a move.l     #$ffffffff, $44(a6)
07d532 move.w     #$0, $42(a6)
07d538 move.w     (a5)+, $72(a6)
07d53c move.l     #$280028, $64(a6)
07d544 move.w     (a5)+, $40(a6)
07d548 move.l     (a5)+, $54(a6)
07d54c move.l     (a5)+, $50(a6)
07d550 move.l     #$7d564, $6c.w
07d558 move.w     #$40, $9c(a6)
07d55e move.w     (a5)+, $58(a6)
07d562 rte        
07d564 move.w     (a5)+, $40(a6)
07d568 move.l     (a5)+, $54(a6)
07d56c move.l     (a5)+, $50(a6)
07d570 move.l     #$7d584, $6c.w
07d578 move.w     #$40, $9c(a6)
07d57e move.w     (a5)+, $58(a6)
07d582 rte        
07d584 move.w     (a5)+, $40(a6)
07d588 move.l     (a5)+, $54(a6)
07d58c move.l     (a5)+, $50(a6)
07d590 move.l     #$7d5a4, $6c.w
07d598 move.w     #$40, $9c(a6)
07d59e move.w     (a5)+, $58(a6)
07d5a2 rte        
07d5a4 move.w     (a5)+, $40(a6)
07d5a8 move.l     (a5)+, $54(a6)
07d5ac move.l     (a5)+, $50(a6)
07d5b0 move.l     #$7d19c, $6c.w
07d5b8 move.w     #$40, $9c(a6)
07d5be move.w     (a5)+, $58(a6)
07d5c2 rte        
07d5c4 move.l     #$ffffffff, $44(a6)
07d5cc move.w     #$0, $42(a6)
07d5d2 clr.w      $64(a6)
07d5d6 move.w     (a5)+, $66(a6)
07d5da move.w     (a5)+, $62(a6)
07d5de move.w     #$dfc, $40(a6)
07d5e4 move.l     (a5)+, $54(a6)
07d5e8 move.l     (a5)+, $4c(a6)
07d5ec move.l     (a5)+, $50(a6)
07d5f0 move.l     #$7d604, $6c.w
07d5f8 move.w     #$40, $9c(a6)
07d5fe move.w     (a5)+, $58(a6)
07d602 rte        
07d604 move.w     #$d0c, $40(a6)
07d60a move.l     (a5)+, $54(a6)
07d60e move.l     (a5)+, $4c(a6)
07d612 move.l     (a5)+, $50(a6)
07d616 move.l     #$7d62a, $6c.w
07d61e move.w     #$40, $9c(a6)
07d624 move.w     (a5)+, $58(a6)
07d628 rte        
07d62a move.w     #$dfc, $40(a6)
07d630 move.l     (a5)+, $54(a6)
07d634 move.l     (a5)+, $4c(a6)
07d638 move.l     (a5)+, $50(a6)
07d63c move.l     #$7d650, $6c.w
07d644 move.w     #$40, $9c(a6)
07d64a move.w     (a5)+, $58(a6)
07d64e rte        
07d650 move.w     #$d0c, $40(a6)
07d656 move.l     (a5)+, $54(a6)
07d65a move.l     (a5)+, $4c(a6)
07d65e move.l     (a5)+, $50(a6)
07d662 move.l     #$7d19c, $6c.w
07d66a move.w     #$40, $9c(a6)
07d670 move.w     (a5)+, $58(a6)
07d674 rte        
07d676 move.l     #$ffffffff, $44(a6)
07d67e move.w     #$0, $42(a6)
07d684 clr.w      $64(a6)
07d688 move.w     (a5)+, $66(a6)
07d68c move.w     (a5)+, $62(a6)
07d690 move.w     #$dfc, $40(a6)
07d696 move.l     (a5)+, $54(a6)
07d69a move.l     (a5)+, $4c(a6)
07d69e move.l     (a5)+, $50(a6)
07d6a2 move.l     #$7d6b6, $6c.w
07d6aa move.w     #$40, $9c(a6)
07d6b0 move.w     (a5)+, $58(a6)
07d6b4 rte        
07d6b6 move.w     #$dfc, $40(a6)
07d6bc move.l     (a5)+, $54(a6)
07d6c0 move.l     (a5)+, $4c(a6)
07d6c4 move.l     (a5)+, $50(a6)
07d6c8 move.l     #$7d6dc, $6c.w
07d6d0 move.w     #$40, $9c(a6)
07d6d6 move.w     (a5)+, $58(a6)
07d6da rte        
07d6dc move.w     #$dfc, $40(a6)
07d6e2 move.l     (a5)+, $54(a6)
07d6e6 move.l     (a5)+, $4c(a6)
07d6ea move.l     (a5)+, $50(a6)
07d6ee move.l     #$7d702, $6c.w
07d6f6 move.w     #$40, $9c(a6)
07d6fc move.w     (a5)+, $58(a6)
07d700 rte        
07d702 move.w     #$dfc, $40(a6)
07d708 move.l     (a5)+, $54(a6)
07d70c move.l     (a5)+, $4c(a6)
07d710 move.l     (a5)+, $50(a6)
07d714 move.l     #$7d19c, $6c.w
07d71c move.w     #$40, $9c(a6)
07d722 move.w     (a5)+, $58(a6)
07d726 rte        
07d728 move.l     #$ffffffff, $44(a6)
07d730 move.w     #$0, $42(a6)
07d736 clr.w      $64(a6)
07d73a move.w     (a5)+, $66(a6)
07d73e move.w     (a5)+, $62(a6)
07d742 move.w     #$dfc, $40(a6)
07d748 move.l     (a5)+, $54(a6)
07d74c move.l     (a5)+, $4c(a6)
07d750 move.l     (a5)+, $50(a6)
07d754 move.l     #$7d768, $6c.w
07d75c move.w     #$40, $9c(a6)
07d762 move.w     (a5)+, $58(a6)
07d766 rte        
07d768 move.w     #$dfc, $40(a6)
07d76e move.l     (a5)+, $54(a6)
07d772 move.l     (a5)+, $4c(a6)
07d776 move.l     (a5)+, $50(a6)
07d77a move.l     #$7d78e, $6c.w
07d782 move.w     #$40, $9c(a6)
07d788 move.w     (a5)+, $58(a6)
07d78c rte        
07d78e move.w     #$d0c, $40(a6)
07d794 move.l     (a5)+, $54(a6)
07d798 move.l     (a5)+, $4c(a6)
07d79c move.l     (a5)+, $50(a6)
07d7a0 move.l     #$7d7b4, $6c.w
07d7a8 move.w     #$40, $9c(a6)
07d7ae move.w     (a5)+, $58(a6)
07d7b2 rte        
07d7b4 move.w     #$dfc, $40(a6)
07d7ba move.l     (a5)+, $54(a6)
07d7be move.l     (a5)+, $4c(a6)
07d7c2 move.l     (a5)+, $50(a6)
07d7c6 move.l     #$7d19c, $6c.w
07d7ce move.w     #$40, $9c(a6)
07d7d4 move.w     (a5)+, $58(a6)
