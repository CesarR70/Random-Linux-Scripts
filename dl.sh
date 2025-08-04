#!/bin/bash

count=1
while [ $count -gt 0 ]
do 
#Get the user specified URL
    echo "Please enter the URL you would like to download"
    read URL

#Ask if the user wants audio only
    echo "Remove Video? (y/n)"
    read MODE

#Download URL (audio only mode)
if [ "$MODE" == "y" ] || [ "$MODE" == "Y" ]; 
	then
    	mkdir -p ~/Desktop/Output-Audio
    	cd ~/Desktop/Output-Audio
    	yt-dlp -x --audio-quality 0 "$URL"
fi
#Download URL (Normal mode)
if [ "$MODE" == "n" ] || [ "$MODE" == "N" ]; 
	then
    	mkdir -p ~/Desktop/Output-Video
    	cd ~/Desktop/Output-Video
   		yt-dlp "$URL"
fi
#Catch Miss input
if [ "$MODE" != "Y" ] && [ "$MODE" != "y" ] && [ "$MODE" != "n" ] && [ "$MODE" != "N" ];
	then echo "Miss Input Detected. Nothing to download. Exiting..."
	count=$(( $count == 0 )) 
	exit
fi

#Ask if the user is done
    echo "Download Complete, would you like to enter another URL? (y/n)"
    read MORE
if [ "$MORE" == "y" ] || [ "$MORE" == "Y" ]; 
    then
        count=$(( $count + 1 ))
    else
        echo "Okay than"
        count=$(( $count == 0 ))
fi
done
