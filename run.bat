@echo OFF

SETLOCAL EnableDelayedExpansion
set N=^
set CONTENT=
for /f "delims=" %%x in ('type %~dp0EXE\VARS.txt') do set "CONTENT=!CONTENT!%%x!N!"

title Dependency check

if not exist "%~dp0EXE" mkdir %~dp0EXE && echo EXE folder not found, so I created it for you.
if not exist "%~dp0Downloads" mkdir %~dp0Downloads && echo Downloads folder not found, so I created it for you.
if not exist "%~dp0Downloads\Audio" mkdir %~dp0Downloads\Audio && echo Audio downloads folder not found, so I created it for you.
if not exist "%~dp0Downloads\Video" mkdir %~dp0Downloads\Video && echo Video downloads folder not found, so I created it for you.
if not exist "%~dp0Downloads\Music" mkdir %~dp0Downloads\Music && echo Music downloads folder not found, so I created it for you.
if not exist "%~dp0EXE\VARS.txt" echo Error: VARS.txt not found, please place it in the EXE folder or download it. && goto e
if not exist "%~dp0EXE\yt-dlp.exe" echo Error: yt-dlp.exe not found, please place it in the EXE folder or download it. && goto e
if not exist "%~dp0EXE\ffplay.exe" echo Error: ffplay.exe not found, please place it in the EXE folder or download it. && goto e
if not exist "%~dp0EXE\ffprobe.exe" echo Error: ffprobe.exe not found, please place it in the EXE folder or download it. && goto e
if not exist "%~dp0EXE\ffmpeg.exe" echo Error: ffmpeg.exe not found, please place it in the EXE folder or download it. && goto e


title Enter URL to Download

set /p URL=URL: 

cls

title Enter File Format

:a

set /p format=MP3 (a), MP4 (v) or FLAC (m)?: 

cls

if %format%==a goto d
if %format%==v goto d
if %format%==m goto d

echo Error: Invalid format. Please enter MP3, MP4, or FLAC. && goto a

:d

cls

title Downloading...

%~dp0EXE\yt-dlp.exe -U

if %format%==a %~dp0EXE\yt-dlp.exe -P %~dp0Downloads\Audio %aargs% -f "140" -x --audio-format "mp3" -S acodec:%acodec% --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w %URL% && @echo %date%: Audio - %URL%>>%~dp0log.txt

if %format%==v %~dp0EXE\yt-dlp.exe -P %~dp0Downloads\Video %vargs% -f "bv[ext=mp4]+ba[ext=m4a]/b[ext=mp4]/b" -S vcodec:%vcodec% --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w %URL% && @echo %date%: Video - %URL%>>%~dp0log.txt

if %format%==m %~dp0EXE\yt-dlp.exe -P %~dp0Downloads\Music %margs% --sponsorblock-remove "music_offtopic" --ppa "ffmpeg:-c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\"" -f "140" -x --audio-format "flac" -S acodec:%mcodec% --embed-metadata --embed-thumbnail --convert-thumbnails "jpg" --ppa "thumbnailsconvertor:-qmin 1 -q:v 1" -o "%%(uploader)s - %%(title)s.%%(ext)s" -w %URL% && @echo %date%: Music - %URL%>>%~dp0log.txt


cls

title Download more?

set /p more=Do you want to download more? Yes (y) or No (n): 

if %more%==y start run.bat && exit

if %more%==n goto b

:e
title Dependency check
pause

cls

:b

if %format%==m explorer %~dp0Downloads\Music
if %format%==a explorer %~dp0Downloads\Audio
if %format%==v explorer %~dp0Downloads\Video

ENDLOCAL
exit
