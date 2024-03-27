# YT-DLP Easy Usage Script by Blomblo
This script is made to make usage of YT-DLP easier. It is based on v1, which required much more manual setup and had less options. This new version is much easier to setup and use as it requires no configuration of the *run.bat* file, along with the new music option, and better compatibility with editing software by using more common codecs and formats. 

### SETUP (Windows)
1. Create a folder and name it whatever you want, this is where all of the files will be. (From now on I'll call it the main folder)
2. Create two folders inside of the main folder; one called **EXE** and one called **Downloads**. It is very important that you name the folders exactly like that, otherwise the script won't work.
3. Download the *run.bat* file from this project and place it in the main folder.
4. Download the *VARS.txt* file from the **EXE** folder in this project and place it in your **EXE** folder.
5. Download the latest [YT-DLP FFmpeg build](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip) and the latest [YT-DLP](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe) versions.
6. Unzip the FFmpeg ZIP file, then go in to **bin** and move the three files to the **EXE** folder you made earlier. Now you can delete the FFmpeg folder and ZIP that you downloaded (The one named *ffmpeg-master-latest-win64-gpl*).
7. Move the *yt-dlp.exe* file to the **EXE** folder that you made earlier.
8. Create three folders in the **Downloads** folder, **Audio**, **Video** and **Music**. It is very important that you name the folders exactly like that, otherwise the script won't work.
9. Create a text file called *log.txt* (not *log.txt.txt*) in the main folder.
10. Make sure that your main folder and subfolders along with the files, (except the example files, they are only there so that I could upload the folders), match the ones that I provided in this project (**EXE** and **Downloads** along with the three folders in the *Downloads* folder). 
11. Done, now you can try it out!

### Usage
1. Run the script.
2. Input the URL of the video or audio that you wish to download.
3. Select either audio (mp3) with "a", video (mp4) with "v", or music (flac) with "m".
4. The script should now start downloading the video or audio.
5. If you want to download more type "y", otherwise type "n".
6. If you wanted to download more, the script will restart, and you will be prompted for the URL. If you didn't want to download more, the script will shut down and the folder that your latest download type was will open.
7. What you do with the downloaded content is up to you, but please use it responsibly and not in an illegal way.

### Customization
If you want to customize the script (mainly by changing the codecs & adding custom args), you have to edit the *VARS.txt* file. there you will see these variables:
* set acodec=mp3
* set vcodec=h264 
* set mcodec=flac 
* set aargs= 
* set vargs= 
* set margs= 

The first three are for the codecs the script uses when downloading the content. The last three are extra args for YT-DLP to use when downloading the content.
Please only change these if you know what you are doing! I cannot guarantee that I will be able to give support if something goes wrong and you've changed these.


NOTE: The FLAC files that get downloaded with this script are modt likely not gonna be "true" FLACs (re-encoded from a lossy format to FLAC =/= lossless audio).
It may just be a placebo, but it does however sound marginally better than the regular mp3 file that you get from the script.


### Credits
* Loading the *VARS.txt* file in to the *run.bat* file - https://stackoverflow.com/a/66714820
* Most of the args used for the music command - [YTDLnis](https://github.com/deniscerri/ytdlnis)
