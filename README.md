# 🛠️ Shell Script Toolbox

A lightweight collection of bash scripts created to simplify and automate common, repetitive tasks across Linux systems. Each script is standalone and designed to help streamline small but frequent jobs, from media downloading to system checks and permission management.

---

## 📜 Available Scripts

### 1. `dl.sh` — YouTube Audio/Video Downloader
Automates the process of downloading content from YouTube by prompting the user to choose between audio or full video downloads.

 🔧 Requirements:
- [`yt-dlp`](https://github.com/yt-dlp/yt-dlp)

 💡 Installation:
sudo apt update && sudo apt install yt-dlp

(For other OSes, refer to yt-dlp's installation instructions)

🧪 Usage
./dl.sh

You'll be prompted to choose audio or video after passing the URL.

### 2. 'gdl.sh' (Gallery Downloader) — Bulk Image Downloader & PNG Converter

Takes one or more image URLs and downloads them, converting each to .png format.

🔧 Requirements:
    ImageMagick

💡 Installation:
sudo apt update && sudo apt install imagemagick

🧪 Usage
./gdl.sh

### 3. 'reboot-required-check.sh' — Reboot Status Notifier
Checks if your Linux system requires a reboot (specifically looks for /var/run/reboot-required).

🧪 Usage
./reboot-required-check.sh

### 4. 'set-share-permissions.sh' — File/Directory Permission Automator
Sets consistent ownership and group permissions for shared directories. Especially useful for Samba/NFS shared folders.

⚙️ Customization:
    Update paths in the script to match your shared directories.

    Modify OWNER= and GROUP= variables to suit your specific ownership and permission model.
    
🧪 Usage
./set-share-permissions.sh

📂 Clone This Repo:

git clone https://github.com/CesarR70/Random-Linux-Scripts

cd Random-Linux-Scripts

🧼 Note:
    Each script is meant to be simple, readable, and easily modifiable.
    
    Ensure you mark the scripts as executable before running: chmod +x scriptname.sh

🐧 Tested On
    Debian 12 Bookworm

    Should be compatible with most Unix-like environments
