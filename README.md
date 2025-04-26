# YT-DLP Easy Usage Script
This script is made to make usage of YT-DLP easier. It is based on [version 1](https://www.youtube.com/watch?v=HpAnrQbZoC4), which required a much more difficult setup while having fewer options, worse stability, and worse user experience. It was very unpolished, and in my opinion, it was unfit for release. This new version is much easier to set up and use as it requires no configuration of the *run.bat* file, along with the new music option, and better compatibility with editing software by using more common codecs and formats.

The supported sites aren't anything that I have control over, but please check [here](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md) to see which sites YT-DLP can download from. (May contain names of NSFW/L websites)

If you want to see planned features and other ideas for this project, you can check the [project plan](https://github.com/users/mrblomblo/projects/2) out!

**IMPORTANT NOTE:** I have switched to Linux, which means that the latest version (2.10.x) is likely going to be the last Windows version. That is due to *bat* files being Windows-only, making development and testing difficult. I won't make any promises, but I am toying with the idea of making a version for Linux. In case I do make a Linux version, it will be released under another repo or branch, which will be linked here.
 
## Setup (Windows)
If you, like me, prefer video instructions over text instructions; you should watch my [tutorial video](https://www.youtube.com/watch?v=nAeNApj0WGw) on it! The tutorial is on an older version, but the steps listed in it are still applicable for all v2.x(.x) versions.
1. Create a folder and name it whatever you want, this is where all the files will be (*From now on, I'll call it the main folder*)
2. Download the [run.bat](https://github.com/mrblomblo/yt-dlp-usage-script/releases/latest/download/run.bat) file and place it in the main folder. *The link auto-downloads the latest Windows version of *run.bat**. If you get a SmartScreen warning; [check the wiki](https://github.com/mrblomblo/yt-dlp-usage-script/wiki/What-to-do-if-you-get-safety-warnings)! 
3. Run the *run.bat* file. You will see that the script has created five folders, in the main folder you'll see **EXE** and **Downloads**. In the **Downloads** folder it'll have created three folders, **Audio**, **Video** & **Music** . If you get a SmartScreen warning; [check the wiki](https://github.com/mrblomblo/yt-dlp-usage-script/wiki/What-to-do-if-you-get-safety-warnings)!
4. Download the [VARS.txt](https://github.com/mrblomblo/yt-dlp-usage-script/releases/latest/download/VARS.txt) file from the latest release and place it in your **EXE** folder. *The link auto-downloads the latest Windows version of *VARS.txt**
5. Download the latest [YT-DLP FFmpeg build](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip) and the latest [YT-DLP](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe) version. *The links auto-download the latest Windows version of the respective files*
6. Unzip the FFmpeg ZIP file, then go into **bin** and move the three files to the **EXE** folder. Now you can delete the FFmpeg folder and the ZIP that you downloaded (The one named *ffmpeg-master-latest-win64-gpl*)
7. Move the *yt-dlp.exe* file to the **EXE** folder that the script created earlier
8. Make sure that your folders and files match the photos below (*Ignore log.txt as it gets created automatically after the first download*):

 <img width="640" src="https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/942dfc46-6505-4449-ab0e-a4b07d3b6149">

 ^^ *Main folder*

 <img width="640" src="https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/7a71e4bd-4552-49a6-aa84-b891f731d285">

 ^^ ***EXE** folder*

 <img width="640" src="https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/4f21140c-5d9b-4fca-96dc-bfb61334a100">

 ^^ ***Downloads** folder*

10. Done, now you can try it out!
 
### Usage
1. Run the script
2. Input the URL of the video or audio that you wish to download
3. Select either audio (mp3) with “a”, video (mp4) with “v”, or music (FLAC) with “m”
4. YT-DLP should now start downloading the desired content with your choices in mind
5. If you want to download more, type “y”, otherwise type “n”
6. If you want to download more, the script will restart. If you don't want to download more, the script will shut down, and the folder that your latest download type was will open
 
## Features
* Audio downloads (mp3) *(see photo below)*
* Video downloads (mp4) *(see photo below)*
* Music downloads (FLAC) *(see photo below)*

<img width="360" src="https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/e65f116e-83fb-44e3-9463-f17ffe302d82">

* Semi-automatic setup (automatic creation of folders and log file) *(see photo below)*
* Detection of missing dependencies *(see photo below)*

<img width="640" src="https://github.com/mrblomblo/yt-dlp-usage-script/assets/63555404/01ff747c-0fb3-4870-9c33-03aad84007e6">

* Detection of invalid URL format and invalid user inputs
* Easy [customization](https://github.com/mrblomblo/yt-dlp-usage-script#customization) with YT-DLP CLI args in VARS.txt
* Easy updates with [update.bat](https://github.com/mrblomblo/yt-dlp-usage-script#updates)
* Manual resolution picker (*Disabled by default, but can be enabled in VARS.txt*)

**NOTE:** The FLAC files that get downloaded with this script are most likely not going to be “true" FLACs, since they get re-encoded from (most likely) M4A or OPUS.
It does however sound marginally better than the regular mp3 file that you get from the script, but that may just be a placebo.

### Customization
If you want to customize the script, you can edit the *VARS.txt* file. There you will see these variables and their default values:
* acodec:mp3
* vcodec:h264
* mcodec:flac
* alocation:Downloads\Audio
* vlocation:Downloads\Video
* mlocation:Downloads\Music
* reschooser:no
* aargs:--embed-chapters --embed-metadata --embed-thumbnail
* vargs:--embed-chapters --embed-metadata --embed-thumbnail
* margs: --sponsorblock-remove "music_offtopic"
 
The three "\*codec" ones are for the codecs the script uses when downloading the content. The three "\*args" ones are extra args for YT-DLP to use when downloading the content. The three "\*location" ones are for changing the download location. *reschooser* allows you to manually select the resolution of the downloaded video. 

Please only change these if you know what you are doing! I cannot guarantee that I will be able to give support if something goes wrong and you've changed these. 

**Tip:** *Change the changed vars and args back to their default values and see if the issue persists!*

I will **NOT** give support to you if you have changed anything in *run.bat* or *update.bat*, or if you are using a fork of my script(s).

If you, for example, want to download paid or otherwise account-required content; you'll most likely not be able to download the content without adding *--cookies-from-browser **your-browser*** to *vargs*

It'd look like this if you are a chrome user:

vargs:--embed-chapters --embed-metadata --embed-thumbnail --cookies-from-browser chrome

## Updates
If you want to easily download updates, you can use [update.bat](https://github.com/mrblomblo/yt-dlp-usage-script/releases/latest/download/update.bat).

To use it; download it and place it in the **EXE** folder.
When you use launch it, you'll see a menu which allows you to choose what you want to update. As of now, the available choices are:
* YT-dlp
* run.bat
* VARS.txt (overwrites your args & choices, but creates a backup)
* update.bat (itself)

It features error checks and dependency checks just like *run.bat*, as well as warnings for updating *VARS.txt* and itself in order to make it as easy as possible to use!
I also made it so that it creates a backup of *VARS.txt* when you choose to update it, since it overwrites it during the update process!

Keep in mind that it isn't guaranteed that an update has been released, so use it sparingly in order to lessen the load on the file hosts.

## Why did I create this?
When I first started using YT-DLP, I found it a bit cumbersome, as manually entering all the details every time I wanted to use it was annoying and time-consuming.
This project was originally developed for my private use, but I decided to release it to the public because I hadn’t come across anything like it. (Though I didn't look very hard :P)

The initial public version ([version 1](https://github.com/mrblomblo/yt-dlp-usage-script/releases/tag/Legacy)), although better than the bare-bones YT-DLP experience, was difficult to set up, and was easy to mess up as well as being a bit “featureless” in my eyes.

I therefore created version 2 to make the setup process easier and to provide a more streamlined and easy-to-use experience.

## Known Issues
- **Run.bat** | *reschooser* — You are shown the error "Error: Invalid input. This was most likely a false positive, ignore it and try again" even if you have selected a valid input. When you select a valid input again, it does not show the error.

### Troubleshooting
If you're having problems; please [check the wiki](https://github.com/mrblomblo/yt-dlp-usage-script/wiki/Troubleshooting) before creating an issue or writing a comment on the tutorial video!

## Disclaimer
This script is a wrapper for YT-DLP, a command-line tool for downloading videos. What you do with the downloaded content is up to you, but please use it responsibly and legally. Downloading copyrighted content without permission is illegal.
This script is intended for personal use, and for downloading content that is freely available online. I am not responsible for any misuse of this script or the downloaded content. The script itself is unable to download the videos itself, that part is handled by YT-DLP.
This script is provided “as is” without warranty of any kind.

This script is licensed under the Unlicense license, so I don't expect you to follow this. But for moral reasons; please don't turn the script into malware or anything like that. Though, as the license states, you are free to do whatever you want with it.
 
 
## Credits
The following people, groups, projects, AIs, etc. have had a hand in making this project better. I may have either used entire code blocks or snippets of code that they've written, or I may have taken inspiration from their code. 
They may also have helped debug problems, given me ideas for features, fixes, etc. whether they know it or not:

* Usage of *%~dp0* in the script - [AUTOMATIC1111 Stable Diffusion web UI](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
* Loading the *VARS.txt* file in to the *run.bat* file - [Erik Erikson](https://stackoverflow.com/a/66714820)
* Most of the args used for the music command - [YTDLnis](https://github.com/deniscerri/ytdlnis)
* URL check - [Google Gemini](https://gemini.google.com)
* Improved dependency check - [Google Gemini](https://gemini.google.com)
* Help with troubleshooting VARS.txt not loading properly - [Microsoft Copilot](https://copilot.microsoft.com/)
* Discovery that lead to a bug being fixed - [FrostyMangg](https://www.youtube.com/@FrostyMangg)
* Getting the current directory (for update.bat) - [Tamara Wijsman](https://superuser.com/a/160712)
* Discovering a safety warning & providing the image for the wiki - [Z.N Gaming](https://www.youtube.com/@z.ngaming2681)
