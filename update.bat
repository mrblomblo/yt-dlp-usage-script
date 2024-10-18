@echo OFF
setlocal

REM Gives the user a warning if update.bat isn't in the EXE folder
title v2.1.1: Dependency check
for %%I in (.) do set CurrDirName=%%~nxI
if NOT "%CurrDirName%" == "EXE" (
  color 04
  echo Please place update.bat in the EXE folder!
  timeout 4 /NOBREAK >NUL
  color 07
  cls
  goto d
)

REM Update selection screen
:s
cls
title v2.1.1: Update selection

echo Select what you want to update
echo (1) YT-DLP
echo (2) run.bat
echo (3) VARS.txt
echo (4) update.bat
echo (e) Exit

REM User input for what to update
set /p "selection=Enter selection: "

cls

REM Checks if selection input is valid
if "%selection%"=="1" (
  goto y
)
if "%selection%"=="2" (
  goto r
)
if "%selection%"=="3" (
  goto v
)
if "%selection%"=="4" (
  goto u
)
if "%selection%"=="e" (
  goto d
)

REM Gives the user a warning if the input is invalid
cls
color 04
echo Error: Invalid input. Please enter either YT-DLP (1), run.bat (2), VARS.txt (3), update.bat (4), or Exit (e).
timeout 2 /NOBREAK >NUL
cls
color 07
goto s

REM Update YT-DLP
:y
cls
title v2.1.1: Updating YT-DLP...

yt-dlp.exe -U 
echo YT-DLP has been updated!
timeout 2 /NOBREAK >NUL
cls
goto s

REM Update run.bat
:r
cls
title v2.1.1: Updating run.bat...

powershell -executionpolicy Bypass -Command "& { Write-Output (Get-Location).Path.Split('\\')[-2] }" > tmp_folder.txt
if exist tmp_folder.txt (
  set /p folder_name=< tmp_folder.txt
  powershell -executionpolicy Bypass -Command "Invoke-WebRequest -Uri https://github.com/mrblomblo/yt-dlp-usage-script/releases/latest/download/run.bat -OutFile ..\%folder_name%\run.bat"
  del tmp_folder.txt
  echo run.bat has been updated!
  timeout 2 /NOBREAK >NUL
  cls
  goto s
) else (
  cls
  color 04
  echo Error: Couldn't determine which folder run.bat is in. (Update failed)
  pause
  cls
  color 07
  goto s
)

REM Give warning before updating VARS.txt
:v
cls
title v2.1.1: Warning!

color 04
echo WARNING: This will overwrite all args and other changes that you've done to VARS.txt!
echo Default settings may also have changed, which may sometimes be unwanted.
echo A backup will be created. To restore it, remove .bak from the file name of the backup.
pause
cls
color 07
echo If you still want to update it, please type "y".
set /p "VARSwarn=Otherwise, type "n" to go back to the selection screen: "

REM Checks if input is valid
if "%VARSwarn%"=="y" (
  goto w
)
if "%VARSwarn%"=="n" (
  goto s
)

REM Gives the user a warning if the input is invalid
cls
color 04
echo Error: Invalid input. Please enter either Yes (y) or No (n).
timeout 2 /NOBREAK >NUL
cls
color 07
goto v

REM Update VARS.txt
:w
cls
title v2.1.1: Updating VARS.txt...

echo Creating a backup...
type VARS.txt > VARS.txt.bak
echo Backup created!

powershell -executionpolicy Bypass -Command "Invoke-WebRequest -Uri https://github.com/mrblomblo/yt-dlp-usage-script/releases/latest/download/vars.txt -OutFile VARS.txt"
echo VARS.txt has been updated!
timeout 2 /NOBREAK >NUL
cls
goto s

REM Give warning before updating update.bat 
:u
cls
title v2.1.1: Warning!

color 04
echo OBS: This will likely cause update.bat to suddenly exit after having updated itself!
pause
cls
color 07
echo If you still want to update it, please type "y".
set /p "updatewarn=Otherwise, type "n" to go back to the selection screen: "

REM Checks if input is valid
if "%updatewarn%"=="y" (
  goto i
)
if "%updatewarn%"=="n" (
  goto s
)

REM Gives the user a warning if the input is invalid
cls
color 04
echo Error: Invalid input. Please enter either Yes (y) or No (n).
timeout 2 /NOBREAK >NUL
cls
color 07
goto u

REM Update update.bat
:i
cls
title v2.1.1: Updating update.bat...

powershell -executionpolicy Bypass -Command "Invoke-WebRequest -Uri https://github.com/mrblomblo/yt-dlp-usage-script/releases/latest/download/update.bat -OutFile update.bat"
echo update.bat has been updated!
timeout 2 /NOBREAK >NUL
cls
goto s

REM End of update script
:d
title v2.1.1: Exiting...
echo Exiting!
timeout 1 /NOBREAK >NUL
ENDLOCAL
exit
