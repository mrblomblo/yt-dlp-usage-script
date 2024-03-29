# YT-DLP Easy Usage Script
This script is made to make usage of YT-DLP easier. It is based on [version 1](https://www.youtube.com/watch?v=HpAnrQbZoC4), which required a much more difficult setup, and had less options. This new version is much easier to setup and use as it requires no configuration of the *run.bat* file, along with the new music option, and better compatibility with editing software by using more common codecs and formats.
 
## Setup (Windows)
1. Create a folder and name it whatever you want, this is where all of the files will be. (From now on I'll call it the main folder)
2. Download the *run.bat* file from this project and place it in the main folder.
3. Run the *run.bat* file. You will see that the script has created five folders, **EXE**, **Downloads** and **Audio**, **Video** & **Music** in the **Downloads** folder.
4. Download the *VARS.txt* file from the **EXE** folder in this project and place it in your **EXE** folder.
5. Download the latest [YT-DLP FFmpeg build](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip) and the latest [YT-DLP](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe) versions.
6. Unzip the FFmpeg ZIP file, then go in to **bin** and move the three files to the **EXE** folder you made earlier. Now you can delete the FFmpeg folder and the ZIP that you downloaded (The one named *ffmpeg-master-latest-win64-gpl*).
7. Move the *yt-dlp.exe* file to the **EXE** folder that you made earlier.
8. Create three folders in the **Downloads** folder, **Audio**, **Video** and **Music**. It is very important that you name the folders exactly like that, otherwise the script won't work.
9. Create a text file called *log.txt* (not *log.txt.txt*) in the main folder.
10. Make sure that your main folder and subfolders along with the files, (except the example files, they are only there so that I could upload the folders), match the ones that I provided in this project (**EXE** and **Downloads** along with the three folders in the *Downloads* folder). 
11. Done, now you can try it out!
 
### Usage
1. Run the script.
2. Input the URL of the video or audio that you wish to download.
3. Select either audio (mp3) with "a", video (mp4) with "v", or music (FLAC) with "m".
4. The script should now start downloading the video or audio.
5. If you want to download more type "y", otherwise type "n".
6. If you wanted to download more, the script will restart, and you will be prompted for the URL. If you didn't want to download more, the script will shut down and the folder that your latest download type was will open.
 
## Features
* Audio downloads (mp3) *(see photo below)*
* Video downloads (mp4) *(see photo below)*
* Music downloads (FLAC) *(see photo below)*

![image](https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/e65f116e-83fb-44e3-9463-f17ffe302d82)
* Semi-automatic setup (automatic creation of folders and log file) *(see photo below)*
* Detection of missing dependencies *(see photo below)*

![image](https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/01ff747c-0fb3-4870-9c33-03aad84007e6)
* Easy customization with YT-DLP CLI args in VARS.txt *see below*

### Customization
If you want to customize the script (mainly by changing the codecs & adding custom args), you have to edit the *VARS.txt* file. there you will see these variables:
* set skipintro=n [this currently does nothing, but it will when or if an intro gets added]
* set acodec=mp3
* set vcodec=h264
* set mcodec=flac
* set aargs=--embed-chapters --write-sub --write-auto-sub
* set vargs=--embed-chapters --write-sub --write-auto-sub
* set margs=
 
The first three are for the codecs the script uses when downloading the content. The last three are extra args for YT-DLP to use when downloading the content.
Please only change these if you know what you are doing! I cannot guarantee that I will be able to give support if something goes wrong and you've changed these.
 
 
**NOTE:** The FLAC files that get downloaded with this script are most likely not going to be "true" FLACs (re-encoded from a lossy format to FLAC =/= lossless audio).
It does however sound marginally better than the regular mp3 file that you get from the script, but that may just be a placebo.
 
## Disclaimer
This script is a wrapper for YT-DLP, a command-line tool for downloading videos. What you do with the downloaded content is up to you, but please use it responsibly and legally. Downloading copyrighted content without permission is illegal.
This script is intended for personal use, and for downloading content that is freely available online. I am not responsible for any misuse of this script or the downloaded content.
This script is provided "as is" without warranty of any kind.
 
 
### Credits
* Usage of *%~dp0* in the script - [AUTOMATIC1111 Stable Diffusion web UI](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
* Loading the *VARS.txt* file in to the *run.bat* file - [https://stackoverflow.com/a/66714820](https://stackoverflow.com/a/66714820)
* Most of the args used for the music command - [YTDLnis](https://github.com/deniscerri/ytdlnis)
* URL check - [Google Gemini](https://gemini.google.com)
* Improved dependency check - [Google Gemini](https://gemini.google.com)
