@echo off
cd /d "%~dp0"
if exist "Lotus2-Amiga-HD-v3.8.exe" (
  start "" "Lotus2-Amiga-HD-v3.8.exe"
) else if exist "Lotus2-Amiga-HD.exe" (
  start "" "Lotus2-Amiga-HD.exe"
) else (
  python game.py
  if errorlevel 1 pause
)
