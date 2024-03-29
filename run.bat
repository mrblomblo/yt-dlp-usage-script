@echo OFF

REM Loading of VARS.txt
SETLOCAL EnableDelayedExpansion
set N=^
set CONTENT=
for /f "delims=" %%x in ('type %~dp0EXE\VARS.txt') do set "CONTENT=!CONTENT!%%x!N!"

REM Start of dependency check
title Dependency check

REM Checks if necesssary folders exist and creates them if they don't exist
for %%d in (EXE Downloads Downloads\Audio Downloads\Video Downloads\Music) do (
  if not exist "%~dp0%%d" (
    mkdir "%~dp0%%d"
    echo %%~nd folder not found, so I created it for you.
  )
)

REM Gives the user a warning if the necessary files can't be found
for %%f in (VARS.txt yt-dlp.exe ffplay.exe ffprobe.exe ffmpeg.exe) do (
  if not exist "%~dp0EXE\%%f" (
    echo Error: %%f not found, please place it in the EXE folder or download it.
    goto e
  )
)
REM End of dependency check

title intro

REM Skips the intro if you have typed "y" in the corresponding place in VARS.txt
if "%skipintro%"=="y" goto s

REM Intro
REM [Intro code goes here when I have gotten permission to use it or if I write it myself]

cls

:s

title Enter URL to Download

REM User input for URL
set /p URL=URL: 

REM Gives the user a warning if the URL input was empty
IF "%URL%"=="" (
  echo You must enter a URL!
  goto s
)

REM Gives the user a warning if the URL input doesn't contain "http", "https" or "www"
IF NOT "%URL:~0,4%"=="http" IF NOT "%URL:~0,5%"=="https" (
  IF NOT "%URL:~0,4%"=="www" (  
    echo Invalid URL format. Please use http://, https://, or www.
    goto s
  )
)

cls

title Enter File Format

:a

REM User input for what file format to download
set /p format=MP3 (a), MP4 (v) or FLAC (m)?: 

cls

REM Checks if file format input is valid
if %format%==a goto d
if %format%==v goto d
if %format%==m goto d
echo Error: Invalid format. Please enter MP3 (a), MP4 (v), or FLAC (m). && goto a

:d

cls

title Downloading...

REM Downloads from the URL input with the file format that the user selected
if %format%==a %~dp0EXE\yt-dlp.exe -P %~dp0Downloads\Audio %aargs% -x --audio-format "mp3" -S acodec:%acodec% --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w %URL% && @echo %date%: Audio - %URL%>>%~dp0log.txt
if %format%==v %~dp0EXE\yt-dlp.exe -P %~dp0Downloads\Video %vargs% -f "bv[ext=mp4]+ba[ext=m4a]/b[ext=mp4]/b" -S vcodec:%vcodec% --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w %URL% && @echo %date%: Video - %URL%>>%~dp0log.txt
if %format%==m %~dp0EXE\yt-dlp.exe -P %~dp0Downloads\Music %margs% --sponsorblock-remove "music_offtopic" --ppa "ffmpeg:-c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\"" -f "140" -x --audio-format "flac" -S acodec:%mcodec% --embed-metadata --embed-thumbnail --convert-thumbnails "jpg" --ppa "thumbnailsconvertor:-qmin 1 -q:v 1" -o "%%(uploader)s - %%(title)s.%%(ext)s" -w %URL% && @echo %date%: Music - %URL%>>%~dp0log.txt

cls

title Download more?

:l

REM User input for if they want to download more
set /p more=Do you want to download more? Yes (y) or No (n): 

REM Restarts the script if the user chose yes (y), otherwise goes to next section
if %more%==y start run.bat && exit
if %more%==n goto b
REM Gives he user a warning if the input is invalid
echo Error: Invalid input, please choose either Yes (y) or No (n) && goto l

:e
REM Part of the script that the dependency check skips to
title Dependency check
pause

cls

:b

REM Opens the corresponding downloads folder depending on which file format the user chose
if %format%==m explorer %~dp0Downloads\Music
if %format%==a explorer %~dp0Downloads\Audio
if %format%==v explorer %~dp0Downloads\Video

REM Stops the script
ENDLOCAL
exit
