@echo off
startcd==%cd%
:start
del /F /Q mods.zip >nul
rmdir /S /Q mods
cls
echo MKalamod installer v1.0
title MKalamod installer - Menu
echo ==================================================
echo Please select a release.
echo Type the version number EXACLY!
echo Leatest versions:
ec "v8.0b - 1.20.4 (Leatest Pre-release)" C7
ec "v7.1b - 1.20.2 (Leatest Stable-release)" A7
echo Older versions:
ec "v7.0b - 1.20.2 (Pre-release)" C7
ec "v6.1.1b - 1.20.1" 27
ec "v6.1b - 1.20.1 (Pre-release)" C7
ec "v6.0b - 1.20.1 (Pre-release)" C7
ec "v5.2b - 1.19.4" 27
ec "v5.1b - 1.19.4 (Pre-release)" C7
ec "v5.0b - 1.19.4 (Pre-release)" C7
ec "v4.0b - 1.19.4 (Pre-release)" C7
ec "v3.1b - 1.19.3 (Do not use)" C7
ec "v3.0b - 1.19.3" 27
ec "v2.1b - 1.19.3" 27
ec "v2.0.1b - 1.19.3 (Pre-release)" C7
ec "v2.0b - 1.19.3 (Pre-release)" C7
ec "v1.0b - 1.19.2" 27
echo For older versions and to get notified on a new release join our discord server:
echo https://discord.gg/dkJDcMDz6T
set /p ver=Version:
echo ==================================================
echo Selected version: %ver%
echo Type "Back" to go back to the previous menu
:fabricinstall
echo Do you have Fabric for the specific minecraft version installed?
set /p fabricinstall=Yes/No/Back:
if %fabricinstall%==Yes goto download
if %fabricinstall%==No goto nofabric
if %fabricinstall%==Back goto start
goto fabricinstall
:nofabric
echo Please wait. Installing Fabric.
title MKalamod - Installing Fabric
if %ver%==v8.0b set mcver=1.20.4
if %ver%==v7.1b set mcver=1.20.2
if %ver%==v7.0b set mcver=1.20.2
if %ver%==v6.1.1b set mcver=1.20.1
if %ver%==v6.1b set mcver=1.20.1
if %ver%==v6.0b set mcver=1.20.1
if %ver%==v5.2b set mcver=1.19.4
if %ver%==v5.1b set mcver=1.19.4
if %ver%==v5.0b set mcver=1.19.4
if %ver%==v4.0b set mcver=1.19.4
if %ver%==v3.1b set mcver=1.19.3
if %ver%==v3.0b set mcver=1.19.3
if %ver%==v2.1b set mcver=1.19.3
if %ver%==v2.0.1b set mcver=1.19.3
if %ver%==v2.0b set mcver=1.19.3
if %ver%==v1.0b set mcver=1.19.2
java -jar fabric-installer-0.11.2.jar client -mcversion %mcver%
echo ==================================================
echo Successfully installed Fabric!
echo ==================================================
:download
echo Downloading MKalamod %ver%
if %ver%==v8.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v8.0b/mods.zip -q --show-progress
if %ver%==v7.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v7.1b/mods.zip -q --show-progress
if %ver%==v7.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v7.0b/mods.zip -q --show-progress
if %ver%==v6.1.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v6.1.1b/mods.zip -q --show-progress
if %ver%==v6.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v6.1b/mods.zip -q --show-progress
if %ver%==v6.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v6.0b/mods.zip -q --show-progress
if %ver%==v5.2b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v5.2b/mods.zip -q --show-progress
if %ver%==v5.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v5.1b/mods.zip -q --show-progress
if %ver%==v5.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v5.0b/mods.zip -q --show-progress
if %ver%==v4.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v4.0b/mods.zip -q --show-progress
if %ver%==v3.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/3.1b/mods.zip -q --show-progress
if %ver%==v3.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/3.0b/mods.zip -q --show-progress
if %ver%==v2.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/2.1b/mods.zip -q --show-progress
if %ver%==v2.0.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/2.0.1b/mods.zip -q --show-progress
if %ver%==v2.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/1.19.3/mods.zip -q --show-progress
if %ver%==v1.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/beta/mods.zip -q --show-progress
echo ==================================================
echo Download completed. Extracting.
powershell Expand-Archive mods.zip
:install
echo ==================================================
echo Where do you want the mods to be put?
echo default = normal minecraft install location. (will delete your current mods)
set /p location=Install location:
echo ==================================================
echo Installing...
if %location%==default goto defaultinstall
cd %location%
xcopy %startcd%/mods %cd%
goto Sucess
:defaultinstall
IF exist %appdata%/.minecraft/mods ( echo Minecraft mods directory found! Deleting other mods. ) ELSE ( goto nodefaultdirectory )
del /F /Q %appdata%\.minecraft\mods\* >nul
xcopy %startcd%/mods %cd%

:nodefaultdirectory
ec "ERROR: You don't have a mods folder! Please create one at" C7
ec "%appdata%/.minecraft/mods!" C7
goto install

:Success
echo ==================================================
echo MKalamod installed succesfully!
pause