# YT-DLP Easy Usage Script
This script is made to make usage of YT-DLP easier. It is based on [version 1](https://www.youtube.com/watch?v=HpAnrQbZoC4), which required a much more difficult setup, and had fewer options. This new version is much easier to set up and use as it requires no configuration of the *run.bat* file, along with the new music option, and better compatibility with editing software by using more common codecs and formats.

The supported sites aren't anything that I have control over, but please check [here](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md) to see which sites YT-DLP can download from. (May contain names of mature and NSFW/L websites)
 
## Setup (Windows)
If you prefer video instructions over text (like me), you should watch my [tutorial video](https://www.youtube.com/watch?v=nAeNApj0WGw) on it!
1. Create a folder and name it whatever you want, this is where all the files will be. (From now on, I'll call it the main folder)
2. Download the [run.bat](https://github.com/mrblomblo/yt-dlp-usage-script/releases/latest/download/run.bat) file and place it in the main folder. *The link auto-downloads the latest Windows version*. If you get a SmartScreen warning; [check the wiki](https://github.com/mrblomblo/yt-dlp-usage-script/wiki/What-to-do-if-you-get-safety-warnings)! 
3. Run the *run.bat* file. You will see that the script has created five folders, **EXE**, **Downloads** and **Audio**, **Video** & **Music** in the **Downloads** folder. If you get a SmartScreen warning; [check the wiki](https://github.com/mrblomblo/yt-dlp-usage-script/wiki/What-to-do-if-you-get-safety-warnings)!
4. Download the [VARS.txt](https://github.com/mrblomblo/yt-dlp-usage-script/releases/latest/download/VARS.txt) file from the latest release and place it in your **EXE** folder. *The link auto-downloads the latest Windows version*
5. Download the latest [YT-DLP FFmpeg build](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip) and the latest [YT-DLP](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe) versions. *These links auto-download the latest Windows versions*
6. Unzip the FFmpeg ZIP file, then go into **bin** and move the three files to the **EXE** folder. Now you can delete the FFmpeg folder and the ZIP that you downloaded (The one named *ffmpeg-master-latest-win64-gpl*).
7. Move the *yt-dlp.exe* file to the **EXE** folder that the script created earlier.
8. Make sure that your folders and files match the photos below (*Ignore log.txt as it gets created automatically after the first download*):

 <img width="640" src="https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/942dfc46-6505-4449-ab0e-a4b07d3b6149">

 ^^ *Main folder*

 <img width="640" src="https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/7a71e4bd-4552-49a6-aa84-b891f731d285">

 ^^ *EXE folder*

 <img width="640" src="https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/4f21140c-5d9b-4fca-96dc-bfb61334a100">

 ^^ *Downloads folder*

10. Done, now you can try it out!
 
### Usage
1. Run the script.
2. Input the URL of the video or audio that you wish to download.
3. Select either audio (mp3) with “a”, video (mp4) with “v”, or music (FLAC) with “m”.
4. The script should now start downloading the video or audio.
5. If you want to download more, type “y”, otherwise type “n”.
6. If you wanted to download more, the script will restart, and you will be prompted for the URL. If you didn't want to download more, the script will shut down and the folder that your latest download type was will open.

* If you need to update YT-DLP; download the [update.bat](https://github.com/mrblomblo/yt-dlp-usage-script/releases/download/Update/update.bat) file and place it in your **EXE** folder, then run it once. *The link auto-downloads the latest Windows version*
 
## Features
* Audio downloads (mp3) *(see photo below)*
* Video downloads (mp4) *(see photo below)*
* Music downloads (FLAC) *(see photo below)*

<img width="360" src="https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/e65f116e-83fb-44e3-9463-f17ffe302d82">

* Semi-automatic setup (automatic creation of folders and log file) *(see photo below)*
* Detection of missing dependencies *(see photo below)*

<img width="640" src="https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/01ff747c-0fb3-4870-9c33-03aad84007e6">

* Detection of invalid URL format & Detection of invalid user inputs
* Easy customization with YT-DLP CLI args in VARS.txt *see below*

**NOTE:** The FLAC files that get downloaded with this script are most likely not going to be “true" FLACs, since they get re-encoded from (most likely) M4A or OPUS.
It does however sound marginally better than the regular mp3 file that you get from the script, but that may just be a placebo.

### Customization
If you want to customize the script (mainly by changing the codecs & adding custom args), you can edit the *VARS.txt* file. There you will see these variables:
* set acodec=mp3
* set vcodec=h264
* set mcodec=flac
* set aargs=--embed-chapters
* set vargs=--embed-chapters
* set margs=
 
The first three are for the codecs the script uses when downloading the content. The last three are extra args for YT-DLP to use when downloading the content.
Please only change these if you know what you are doing! I cannot guarantee that I will be able to give support if something goes wrong, and you've changed these.

### Troubleshooting
If you're having problems; please [check the wiki](https://github.com/mrblomblo/yt-dlp-usage-script/wiki/Troubleshooting)!

## Why did I create this?
When I first started using YT-DLP, I found it a bit cumbersome, as manually entering all the details every time I wanted to use it was annoying and time-consuming.
This project was originally developed for my private use, but I decided to release it to the public because I hadn’t come across anything like it. (Though I didn't look very hard :P)

The initial public version ([version 1](https://github.com/mrblomblo/yt-dlp-usage-script/releases/tag/Legacy)), although better than the bare-bones YT-DLP experience, was difficult to set up, and was easy to mess up as well as being a bit “featureless” in my eyes.

I therefore created version 2 to make the setup process easier and to provide a more streamlined and easy-to-use experience. 
 
## Disclaimer
This script is a wrapper for YT-DLP, a command-line tool for downloading videos. What you do with the downloaded content is up to you, but please use it responsibly and legally. Downloading copyrighted content without permission is illegal.
This script is intended for personal use, and for downloading content that is freely available online. I am not responsible for any misuse of this script or the downloaded content. The script itself is also unable to actually download the videos, that part is made possible by YT-DLP.
This script is provided “as is” without warranty of any kind.

This script is licensed under the Unlicense license, so I don't expect you to follow this. But for moral reasons; please don't turn the script into malware or anything like that. Though, as the license states, you are free to do whatever you want with it.
 
 
## Credits
* Usage of *%~dp0* in the script - [AUTOMATIC1111 Stable Diffusion web UI](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
* Loading the *VARS.txt* file in to the *run.bat* file - [https://stackoverflow.com/a/66714820](https://stackoverflow.com/a/66714820)
* Most of the args used for the music command - [YTDLnis](https://github.com/deniscerri/ytdlnis)
* URL check - [Google Gemini](https://gemini.google.com)
* Improved dependency check - [Google Gemini](https://gemini.google.com)
