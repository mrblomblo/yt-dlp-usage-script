@echo OFF
setlocal

REM If you don't want run.bat to be automatically updated, please remove the code UNDER "yt-dlp.exe -U", but leave "title Updates done" and the code under it alone. This script should still end with "pause" and "exit".

REM Update YT-DLP
title Updating YT-DLP...

yt-dlp.exe -U 

REM Update run.bat
title Updating run.bat...

echo .
echo You may notice a large chunk of red text under this text, which you can ignore. I recommend updating run.bat through the actual releases on GitHub, this is just for your convenience. 
echo If you don't want run.bat to be automatically updated when you update YT-DLP, please edit this file and follow the instructions there. 
echo .

powershell -executionpolicy Bypass -Command "& { Write-Output (Get-Location).Path.Split('\\')[-2] }" > tmp_folder.txt
if exist tmp_folder.txt (
  set /p folder_name=< tmp_folder.txt
  powershell -executionpolicy Bypass -Command "Invoke-WebRequest -Uri https://github.com/mrblomblo/yt-dlp-usage-script/releases/latest/download/run.bat -OutFile ..\%folder_name%\run.bat"
  del tmp_folder.txt
  echo run.bat has been updated.
) else (
  echo Error: Couldn't determine which folder run.bat is in.
)

title Updates done

pause
exit
