@echo OFF

title Enter URL to Download

set /p URL=URL: 

cls

title Enter File Format

set /p format=MP3 (a), MP4 (v) or FLAC (m)?: 

cls

title Downloading...

%~dp0EXE\yt-dlp.exe -U

if %format%==a %~dp0EXE\yt-dlp.exe -P %~dp0Downloads\Audio -f "140" -x --audio-format "mp3" -S acodec:opus --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w %URL% && @echo %date%: Audio - %URL%>>%~dp0log.txt

if %format%==v %~dp0EXE\yt-dlp.exe -P %~dp0Downloads\Video -f "bv[ext=mp4]+ba[ext=m4a]/b[ext=mp4]/b" --embed-metadata --embed-thumbnail -o "%%(title)s.%%(ext)s" -w %URL% && @echo %date%: Video - %URL%>>%~dp0log.txt

if %format%==m %~dp0EXE\yt-dlp.exe -P %~dp0Downloads\Music --sponsorblock-remove "music_offtopic" --ppa "ffmpeg:-c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\"" -f "140" -x --audio-format "flac" -S acodec:opus --embed-metadata --embed-thumbnail --convert-thumbnails "jpg" --ppa "thumbnailsconvertor:-qmin 1 -q:v 1" -o "%%(uploader)s - %%(title)s.%%(ext)s" -w %URL% && @echo %date%: Music - %URL%>>%~dp0log.txt

cls

title Download more?

set /p more=Do you want to download more? Yes (y) or No (n): 

if %more%==y start run.bat && exit

if %more%==n goto b

cls

:b

if %format%==m explorer %~dp0Downloads\Music
if %format%==a explorer %~dp0Downloads\Audio
if %format%==v explorer %~dp0Downloads\Video

exit