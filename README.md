# 🛠️ Shell Script Toolbox

A lightweight collection of bash scripts designed to simplify and automate common tasks across Linux systems. Each script is standalone, well-documented, and focused on streamlining repetitive operations—from media downloading to system maintenance and permission management.

---

## 📋 Table of Contents

- [Available Scripts](#-available-scripts)
- [Installation](#-installation)
- [Tested Environments](#-tested-environments)
- [Contributing](#-contributing)

---

## 📜 Available Scripts

### 1. YouTube Audio/Video Downloader (`dl.sh`)

Automates content downloading from YouTube with an interactive prompt to select between audio-only or full video downloads.

**Requirements:**
- [`yt-dlp`](https://github.com/yt-dlp/yt-dlp)

**Installation:**
```bash
sudo apt update && sudo apt install yt-dlp
```
*For other operating systems, refer to [yt-dlp's installation guide](https://github.com/yt-dlp/yt-dlp#installation).*

**Usage:**
```bash
chmod +x dl.sh
./dl.sh
```
You'll be prompted to enter a URL and choose between audio or video format.

---

### 2. Bulk Image Downloader (`gdl.sh`)

Downloads one or more images from provided URLs and automatically converts them to PNG format.

**Requirements:**
- `ImageMagick`
- `gallery-dl`

**Installation:**
```bash
sudo apt update && sudo apt install imagemagick gallery-dl
```

**Usage:**
```bash
chmod +x gdl.sh
./gdl.sh
```
Enter image URLs when prompted. All downloads will be converted to `.png` format.

---

### 3. Reboot Status Checker (`reboot-required-check.sh`)

Checks whether your Linux system requires a reboot by detecting the presence of `/var/run/reboot-required`.

**Requirements:**
- None (uses standard Linux utilities)

**Usage:**
```bash
chmod +x reboot-required-check.sh
./reboot-required-check.sh
```

---

### 4. Shared Directory Permission Manager (`set-share-permissions.sh`)

Automatically sets consistent ownership and group permissions for shared directories. Particularly useful for Samba and NFS shared folders.

**Requirements:**
- Root or sudo privileges

**Configuration:**

Before running, edit the script to customize:
```bash
OWNER="your_owner"
GROUP="your_group"
```
Update the directory paths to match your shared directories.

**Usage:**
```bash
chmod +x set-share-permissions.sh
sudo ./set-share-permissions.sh
```

---

### 5. Samba Share Automator (`SambaInitialConfig.sh`)

Automates the creation of Samba share directories and user accounts with proper permissions.

**Requirements:**
- Samba installed and configured
- Root or sudo privileges

**Configuration:**

Before running, edit the script to customize:
```bash
ShareDir="/path/to/share"
FileOwner="owner_name"
ShareUser="samba_user"
ShareGroup="samba_group"
```

**Usage:**
```bash
chmod +x SambaInitialConfig.sh
sudo ./SambaInitialConfig.sh
```

---

## 📂 Installation

Clone this repository:
```bash
git clone https://github.com/CesarR70/Random-Linux-Scripts
cd Random-Linux-Scripts
```

Make scripts executable:
```bash
chmod +x *.sh
```

---

## 🐧 Tested Environments

- **Primary:** Debian 12 (Bookworm)
- **Compatibility:** Most Unix-like systems (Ubuntu, Fedora, Arch, etc.)

---

## 📝 Notes

- Each script is designed to be simple, readable, and easily customizable
- Scripts requiring configuration have clearly marked variables at the top
- Always review scripts before running with elevated privileges
- Contributions and improvements are welcome!

---

## 🤝 Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

---

## 📄 License

This project is open source and available under the MIT License.