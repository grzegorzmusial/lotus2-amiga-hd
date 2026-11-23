$ErrorActionPreference = 'Stop'
$gameRoot = $PSScriptRoot
$gameBuild = Join-Path $gameRoot '_build'
$packagerSource = Join-Path $gameBuild 'pyinstaller'
New-Item -ItemType Directory -Force -Path $gameBuild | Out-Null
if (-not (Test-Path -LiteralPath (Join-Path $packagerSource 'bootloader\waf'))) {
    git clone --depth 1 --branch v6.20.0 https://github.com/pyinstaller/pyinstaller.git $packagerSource
    if ($LASTEXITCODE -ne 0) { throw 'Cannot acquire PyInstaller source' }
}
Push-Location (Join-Path $packagerSource 'bootloader')
try {
    python .\waf all --no-cfg
    if ($LASTEXITCODE -ne 0) { throw 'Bootloader build failed; MSVC build tools are required' }
} finally { Pop-Location }
$previousPythonPath = $env:PYTHONPATH
try {
    $env:PYTHONPATH = $packagerSource
    python -m PyInstaller --noconfirm --onefile --windowed --name Lotus2-Amiga-HD-v3.8 --collect-all unicorn --add-data "$(Join-Path $gameRoot 'assets');assets" --distpath $gameRoot --workpath (Join-Path $gameBuild 'build') --specpath $gameBuild (Join-Path $gameRoot 'game.py')
    if ($LASTEXITCODE -ne 0) { throw 'Game package build failed' }
} finally { $env:PYTHONPATH = $previousPythonPath }
