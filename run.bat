@echo OFF
setlocal enabledelayedexpansion

REM Start of dependency check
title v2.9: Dependency check

REM Checks if necesssary folders exist and creates them if they don't exist
for %%d in (EXE Downloads Downloads\Audio Downloads\Video Downloads\Music) do (
  if NOT exist "%~dp0%%d" (
    mkdir "%~dp0%%d"
    color 06
    echo %%~nd folder not found, so I created it for you.
    timeout 1 /NOBREAK >NUL
    color 07
  )
)

cls

REM Gives the user a warning if the necessary files can't be found
for %%f in (VARS.txt yt-dlp.exe ffplay.exe ffprobe.exe ffmpeg.exe) do (
  if NOT exist "%~dp0EXE\%%f" (
    color 04
    echo Error: %%f not found, please place it in the EXE folder or download it.
    goto e
  )
)
REM End of dependency check

cls

REM Loading of VARS.txt

for /f "usebackq tokens=1,* delims=:" %%A in ("%~dp0EXE\VARS.txt") do (
    set "key=%%A"
    set "value=%%B"
    REM Set the variables to the ones in VARS.txt
    if "!key!"=="acodec" set "acodec=!value!"
    if "!key!"=="vcodec" set "vcodec=!value!"
    if "!key!"=="mcodec" set "mcodec=!value!"
    if "!key!"=="reschooser" set "reschooser=!value!"
    if "!key!"=="aargs" set "aargs=!value!"
    if "!key!"=="vargs" set "vargs=!value!"
    if "!key!"=="margs" set "margs=!value!"
)

:s

title v2.9: Enter URL to Download

REM User input for URL

set /p "URL=URL: "

REM Gives the user a warning if the URL input was empty
if "%URL%"=="" (
  cls
  color 04
  echo You must enter a URL
  timeout 2 /NOBREAK >NUL
  cls
  color 07
  goto s
)
REM Gives the user a warning if the URL input doesn't contain "http", "https" or "www"
if NOT "%URL:~0,4%"=="http" if NOT "%URL:~0,5%"=="https" ( 
  if NOT "%URL:~0,4%"=="www" (
    cls
    color 04
    echo Invalid URL format. Please use http://, https://, or www.
    timeout 2 /NOBREAK >NUL
    cls
    color 07
    goto s
  )
)

cls

title v2.9: Enter File Format

:a

REM User input for what file format to download
set /p "format=MP3 (a), MP4 (v) or FLAC (m)?: "

cls

REM Checks if file format input is valid
if "%format%"=="a" (
  goto d
)
if "%reschooser%"=="no" if "%format%"=="v" (
  goto d
)
if "%format%"=="m" (
  goto d
)
if "%reschooser%"=="yes" if "%format%"=="v" (
  REM Resolution selection screen
  :s2
  cls
  title v2.9: Resolution selection

  echo Select which resolution you wish to download.
  echo It will fail if the selected resolution isn't available.
  echo 1 - 4320p
  echo 2 - 2160p
  echo 3 - 1440p
  echo 4 - 1080p
  echo 5 - 720p
  echo 6 - 480p

  REM User input for what to update
  set /p "selection=Enter selection: "

  cls

  REM Checks if selection input is valid
  if "%selection%"=="1" (
    cls
    goto 8k
  ) else (
    if "%selection%"=="2" (
      cls
      goto 4k
    ) else (
      if "%selection%"=="3" (
        cls
        goto 1440
      ) else (
        if "%selection%"=="4" (
          cls
          goto 1080
        ) else (
          if "%selection%"=="5" (
            cls
            goto 720
          ) else (
            if "%selection%"=="6" (
              cls
              goto 480
            )
          )
        )
      )
    )
  )
)

REM Gives the user a warning if the input is invalid
if NOT "%selection%"=="1" OR if NOT "%selection%"=="2" OR if NOT "%selection%"=="3" OR if NOT "%selection%"=="4" OR if NOT "%selection%"=="5" OR if NOT "%selection%"=="6" (
  cls
  color 04
  echo Error: Invalid input. This was most likely a false positive, ignore it and try again
  timeout 2 /NOBREAK >NUL
  cls
  color 07
  goto s2
)

REM Gives the user a warning if the format input was empty
if "%format%"=="" (
  cls
  color 04
  echo You must enter a format
  timeout 2 /NOBREAK >NUL
  cls
  color 07
  goto a
)

REM Gives the user a warning if the format input is invalid
if NOT "%format%"=="a" OR "%format%"=="v" OR "%format%"=="m" (
  cls
  color 04
  echo Error: Invalid format. Please enter MP3 (a), MP4 (v), or FLAC (m).
  timeout 2 /NOBREAK >NUL
  cls
  color 07
  goto a
)

cls

:8k
title v2.9: Downloading...
if "%format%"=="v" "%~dp0EXE\yt-dlp.exe" -P "%~dp0Downloads\Video" "%vargs%" -f "bestvideo[height=4320]+bestaudio" --merge-output-format mp4 -S vcodec:"%vcodec%" -S acodec:"%acodec%" --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w "%URL%" && @echo %date%: Video - "%URL%">>"%~dp0log.txt"
goto l 
 
:4k 
title v2.9: Downloading... 
if "%format%"=="v" "%~dp0EXE\yt-dlp.exe" -P "%~dp0Downloads\Video" "%vargs%" -f "bestvideo[height=2160]+bestaudio" --merge-output-format mp4 -S vcodec:"%vcodec%" -S acodec:"%acodec%" --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w "%URL%" && @echo %date%: Video - "%URL%">>"%~dp0log.txt"
goto l 
 
:1440 
title v2.9: Downloading... 
if "%format%"=="v" "%~dp0EXE\yt-dlp.exe" -P "%~dp0Downloads\Video" "%vargs%" -f "bestvideo[height=1440]+bestaudio" --merge-output-format mp4 -S vcodec:"%vcodec%" -S acodec:"%acodec%" --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w "%URL%" && @echo %date%: Video - "%URL%">>"%~dp0log.txt"
goto l 
 
:1080 
title v2.9: Downloading... 
if "%format%"=="v" "%~dp0EXE\yt-dlp.exe" -P "%~dp0Downloads\Video" "%vargs%" -f "bestvideo[height=1080]+bestaudio" --merge-output-format mp4 -S vcodec:"%vcodec%" -S acodec:"%acodec%" --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w "%URL%" && @echo %date%: Video - "%URL%">>"%~dp0log.txt"
goto l 
 
:720 
title v2.9: Downloading... 
if "%format%"=="v" "%~dp0EXE\yt-dlp.exe" -P "%~dp0Downloads\Video" "%vargs%" -f "bestvideo[height=720]+bestaudio" --merge-output-format mp4 -S vcodec:"%vcodec%" -S acodec:"%acodec%" --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w "%URL%" && @echo %date%: Video - "%URL%">>"%~dp0log.txt"
goto l 
 
:480 
title v2.9: Downloading... 
if "%format%"=="v" "%~dp0EXE\yt-dlp.exe" -P "%~dp0Downloads\Video" "%vargs%" -f "bestvideo[height=480]+bestaudio" --merge-output-format mp4 -S vcodec:"%vcodec%" -S acodec:"%acodec%" --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w "%URL%" && @echo %date%: Video - "%URL%">>"%~dp0log.txt"
goto l

cls
:d
title v2.9: Downloading...

REM Downloads from the URL input with the file format that the user selected
if "%format%"=="a" "%~dp0EXE\yt-dlp.exe" -P "%~dp0Downloads\Audio" "%aargs%" -f "ba/b" -x --audio-format "mp3" -S acodec:"%acodec%" --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w "%URL%" && @echo %date%: Audio - "%URL%">>"%~dp0log.txt"
if "%format%"=="v" "%~dp0EXE\yt-dlp.exe" -P "%~dp0Downloads\Video" "%vargs%" -f "bv*[height>=4320]+ba/b[height>=4320] / bv*[height>=2160]+ba/b[height>=2160] / bv*[height>=1440]+ba/b[height>=1440] / bv*[height>=1080]+ba/b[height>=1080] / bv+ba/b" --merge-output-format mp4 -S vcodec:"%vcodec%" -S acodec:"%acodec%" --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w "%URL%" && @echo %date%: Video - "%URL%">>"%~dp0log.txt"
if "%format%"=="m" "%~dp0EXE\yt-dlp.exe" -P "%~dp0Downloads\Music" "%margs%" --sponsorblock-remove "music_offtopic" --ppa "ffmpeg:-c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\"" -f "ba/b" -x --audio-format "flac" -S acodec:"%mcodec%" --embed-metadata  --parse-metadata "%%(title)s:%%(title)s" --parse-metadata "%%(uploader,channel,creator,artist|null)s:%%(uploader)s" --parse-metadata "artist:(?P<meta_album_artist>[^,]+)" --parse-metadata "%%(album_artist,meta_album_artist,uploader)s:%%(album_artist)s" --parse-metadata "%%(release_year,release_date>%%Y,upload_date>%%Y)s:%%(meta_date)s" --parse-metadata "%%(album,title)s:%%(meta_album)s" --embed-thumbnail --convert-thumbnails "jpg" --ppa "thumbnailsconvertor:-qmin 1 -q:v 1" -o "%%(uploader)s - %%(title)s.%%(ext)s" -w "%URL%" && @echo %date%: Music - "%URL%">>"%~dp0log.txt"
goto l

:l

cls

title v2.9: Download more?

REM User input for if they want to download more
set /p "more=Do you want to download more? Yes (y) or No (n): "

REM Restarts the script if the user chose yes (y), otherwise goes to next section
if /i "%more%"=="y" (
  start run.bat
  exit
)
if /i "%more%"=="n" (
  goto b
)

REM Gives the user a warning if the DL more input was empty
if "%more%"=="" (
  cls
  color 04
  echo You must choose either Yes or No
  timeout 2 /NOBREAK >NUL
  cls
  color 07
  goto s
)
REM Gives the user a warning if the DL more input is invalid
if NOT "%more%"=="y" OR if NOT "%more%"=="n" (
  cls
  color 04
  echo Error: Invalid input, please choose either Yes (y) or No (n)
  timeout 2 /NOBREAK >NUL
  cls
  color 07
  goto l
)

:e
REM Part of the script that the dependency check skips to
title v2.9: Dependency check
pause

cls

:b

REM Opens the corresponding downloads folder depending on which file format the user chose
if "%format%"=="m" (
  explorer "%~dp0Downloads\Music"
)
if "%format%"=="a" (
  explorer "%~dp0Downloads\Audio"
)
if "%format%"=="v" (
  explorer "%~dp0Downloads\Video"
)

REM Stops the script
ENDLOCAL
exit
