:: A simple script that downloads a Minecraft modpack from a URL and installs it to the Minecraft directory.
@echo off

echo Minecraft Modpack Installer by baldo3000
echo:
cd %UserProfile%\AppData\Roaming\.minecraft
rd /s /q mods >nul 2>&1
del mods.zip >nul 2>&1

echo Getting download link...
curl https://www.mediafire.com/file/c92qrxiof2m2gf9/mods.zip/file -o modpack-url >nul 2>&1

set "File=modpack-url"
set /a count=0
SETLOCAL enabledelayedexpansion
for /F "tokens=* delims=" %%a in ('Type "%File%"') do (
         Set /a count+=1
         Set "output[!count!]=%%a"
         if !count! == 570 (
            set "url=%%a" 
            set "url=!url:~17,-31!"
         ) 
)

del file >nul 2>&1 
echo:
echo Downloading mods...
curl !url! -o mods.zip 

echo:
echo Unpacking mods...
tar -xf mods.zip >nul 2>&1
echo:
echo Cleaning up...
del mods.zip >nul 2>&1

echo:
echo Done^^! The modpack has been installed.
echo:
pause