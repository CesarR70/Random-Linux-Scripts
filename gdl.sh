#!/bin/bash

DownloadOutput="$HOME/Downloads"

count=1
while [ $count -gt 0 ]
do 

# Prompt the user to enter a URL
read -p "Please enter a URL: " user_url

# Check if the input is empty
[ -z "$user_url" ] && echo -e "\nNo URL entered" && read -p "Please try again: " user_url

# Create the download directory if it doesn't exist & Pass URL for download
mkdir -p "$DownloadOutput"
    	cd  "$DownloadOutput"
    	echo -e "\nFetching content from: $user_url"
gallery-dl "$user_url"

# Convert images that are not in PNG format
echo -e "\nConverting downloaded files to .png"
find "$DownloadOutput" -type f ! -name "*.png" \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" -o -iname "*.gif" -o -iname "*.bmp" \) | while read file; 
do
    new_file="${file%.*}.png"
    convert "$file" "$new_file" && rm "$file"
    echo "Converted: $file -> $new_file"
done
        
# Ask if the user is done
echo -e "\nProcess complete." && read -p "Would you like to enter another URL? (y/n)" MORE

if [[ "$MORE" =~ ^[Yy]$ ]]; then
        count=$(( $count + 1 ))
    else
        echo -e "\nExiting"
        count=$(( $count == 0 ))
fi
done