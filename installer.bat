@echo off
startcd==%cd%
:start
del /F /Q mods.zip
rmdir /S /Q mods 
echo MKalamod installer v1.2
title MKalamod installer - Menu
echo ==================================================
echo Please select a release.
echo Type the version number EXACTLY!
echo Latest versions:
ec "v10.0a - 1.21.3 (Latest ALPHA release)" C7
ec "v9.1b - 1.21 (Latest Stable-release)" A7
echo Older versions:
ec "v9.0b - 1.21" 27
ec "v8.0b - 1.20.4 (Pre-release)" C7
ec "v7.1b - 1.20.2" 27
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
if "%ver%" == "v10.0a" (
    set mcver=1.21.3
) else if "%ver%" == "v9.1b" (
    set mcver=1.21.1
) else if "%ver%" == "v9.0b" (
    set mcver=1.21
) else if "%ver%" == "v8.0b" (
    set mcver=1.20.4
) else if "%ver%" == "v7.1b" (
    set mcver=1.20.2
) else if "%ver%" == "v7.0b" (
    set mcver=1.20.2
) else if "%ver%" == "v6.1.1b" (
    set mcver=1.20.1
) else if "%ver%" == "v6.1b" (
    set mcver=1.20.1
) else if "%ver%" == "v6.0b" (
    set mcver=1.20.1
) else if "%ver%" == "v5.2b" (
    set mcver=1.19.4
) else if "%ver%" == "v5.1b" (
    set mcver=1.19.4
) else if "%ver%" == "v5.0b" (
    set mcver=1.19.4
) else if "%ver%" == "v4.0b" (
    set mcver=1.19.4
) else if "%ver%" == "v3.1b" (
    set mcver=1.19.3
) else if "%ver%" == "v3.0b" (
    set mcver=1.19.3
) else if "%ver%" == "v2.1b" (
    set mcver=1.19.3
) else if "%ver%" == "v2.0.1b" (
    set mcver=1.19.3
) else if "%ver%" == "v2.0b" (
    set mcver=1.19.3
) else if "%ver%" == "v1.0b" (
    set mcver=1.19.2
) else goto versionselecterror



echo Selected version: %ver% (%mcver%)
echo ==================================================
title Install location
echo Where do you want the mods to be put? Please enter the full path!
echo Leave empty for default minecraft install location. (Will delete your current mods!)
set /p location=Install location:
echo ==================================================
if "%location%" == "" (
    echo Using default minecraft install location.
    echo ==================================================
) else if "%location%" == "default" (
    echo Using legacy default minecraft install location.
    echo ==================================================
) else (
    echo Istall location set to: %location%
    echo ==================================================
    goto download
)



:fabricinstallquestion
echo Do you have Fabric for minecraft version %mcver% installed?
set /p fabricinstall=Yes/No/Back:
if "%fabricinstall%" == "Yes" (
    goto download
) else if "%fabricinstall%" == "No" (
    goto fabricinstall
) else goto fabricinstallquestion



:fabricinstall
echo Please wait. Installing Fabric.
title MKalamod - Installing Fabric
java -jar fabric-installer-1.0.1.jar client -mcversion %mcver%
if %ERRORLEVEL%==0 goto fabricinstallsuccess
echo.
echo SOMETHING WENT WRONG WITH FABRIC! PLEASE OPEN A TICKET ON GITHUB!
echo ERROR %ERRORLEVEL%! PRESS ANY KEY TO CONTINUE INSTALL WITHOUT FABRIC!
pause >nul
:fabricinstallsuccess
echo ==================================================
echo Successfully installed Fabric!
echo ==================================================
:download
title Downloading MKalamod %ver%
echo Downloading MKalamod %ver%
if %ver%==v10.0a wget https://github.com/KEVINIIE123/MKalamod/releases/download/v10.0a/mods.zip -q --show-progress -O mods.zip
if %ver%==v9.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v9.0b/mods.zip -q --show-progress -O mods.zip
if %ver%==v8.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v8.0b/mods.zip -q --show-progress -O mods.zip
if %ver%==v7.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v7.1b/mods.zip -q --show-progress -O mods.zip
if %ver%==v7.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v7.0b/mods.zip -q --show-progress -O mods.zip
if %ver%==v6.1.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v6.1.1b/mods.zip -q --show-progress -O mods.zip
if %ver%==v6.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v6.1b/mods.zip -q --show-progress -O mods.zip
if %ver%==v6.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v6.0b/mods.zip -q --show-progress -O mods.zip
if %ver%==v5.2b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v5.2b/mods.zip -q --show-progress -O mods.zip
if %ver%==v5.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v5.1b/mods.zip -q --show-progress -O mods.zip
if %ver%==v5.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v5.0b/mods.zip -q --show-progress -O mods.zip
if %ver%==v4.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/v4.0b/mods.zip -q --show-progress -O mods.zip
if %ver%==v3.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/3.1b/mods.zip -q --show-progress -O mods.zip
if %ver%==v3.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/3.0b/mods.zip -q --show-progress -O mods.zip
if %ver%==v2.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/2.1b/mods.zip -q --show-progress -O mods.zip
if %ver%==v2.0.1b wget https://github.com/KEVINIIE123/MKalamod/releases/download/2.0.1b/mods.zip -q --show-progress -O mods.zip
if %ver%==v2.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/1.19.3/mods.zip -q --show-progress -O mods.zip
if %ver%==v1.0b wget https://github.com/KEVINIIE123/MKalamod/releases/download/beta/mods.zip -q --show-progress -O mods.zip
if %ERRORLEVEL% == 0 goto extract
echo.
echo SOMETHING WENT WRONG WITH DOWNLOADING! PLEASE CHECK YOUR INTERNET CONNECTION OR OPEN A TICKET ON GITHUB!
echo ERROR %ERRORLEVEL%! PRESS ANY KEY TO CONTINUE INSTALL WITHOUT DOWNLOADING!
pause >nul
:extract
echo ==================================================
title Extracting MKalamod
ec "Download completed. Extracting." 27
powershell Expand-Archive mods.zip
ec "Extracting completed" 27
:install
title Moving files
if %location%==default goto defaultinstall
echo Installing...
xcopy "%cd%/mods" "%location%" /Q
echo ==================================================
goto Sucess
:defaultinstall
IF exist "%appdata%\.minecraft\mods" ( echo Minecraft mods directory found! Deleting other mods. ) ELSE ( goto nodefaultdirectory )
echo Installing...
del /F /Q "%appdata%\.minecraft\mods" >nul
xcopy "%cd%\mods\*" "%appdata%\.minecraft\mods" /q >nul
goto Success

:nodefaultdirectory
ec "ERROR: You don't have a mods folder! Please create one at" C7
ec "%appdata%\.minecraft\mods!" C7
goto install

:Success
title Sucessfully installed MKalamod
echo ==================================================
ec "MKalamod installed succesfully!" 27
echo Cleaning up files...
del /F /Q mods.zip
rmdir /S /Q mods
del /F /Q .wget-hsts
ec "File cleanup completed sucessfully!" 27
echo Press any key to exit . . .
pause >nul
exit

:versionselecterror
echo Selected version does NOT exist. Please type the version EXACLY!
echo EXAMPLE: v10.0a
pause
cls
goto start