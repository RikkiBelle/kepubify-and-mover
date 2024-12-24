# Auto EPUB Mover and Kepubify Converter

This project automates the process of converting `.epub` files to `.kepub.epub` format and moves them to a designated folder on your Mac. It includes:

- A script to move `.epub` files from the Downloads folder to a specified directory (`Kobo Books`).
- Automatic conversion of `.epub` files using the [Kepubify](https://github.com/DavidWinter/kePubify) tool.
- A `launchd` job to make the script run automatically on startup.

## Prerequisites

Before using the script, ensure that you have the following installed on your Mac:

1. **Homebrew**: A package manager for macOS.
2. **Kepubify**: A command-line tool to convert `.epub` to `.kepub.epub`.

### Install Dependencies

1. Install Homebrew (if not installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Install **Kepubify**:
   - Install [Kepubify](https://github.com/DavidWinter/kePubify) via Homebrew:
     ```bash
     brew install --cask kepubify
     ```

---

## Setup Instructions

### 1. Download Files

Download the following files from this repository:

- `move_epubs.sh`: The script to automatically move `.epub` files and run `kepubify`.
- `com.rikkibelle.moveepubs.plist`: The `launchd` job file to run the script automatically on startup.

You can download these files directly from the repository page on GitHub.

### 2. Add the Script to `/usr/local/bin`

Move the `move_epubs.sh` script to `/usr/local/bin` (or any directory in your `PATH`).

```bash
sudo mv move_epubs.sh /usr/local/bin/
```

- You can run the script manually or automate it with `launchd`.

### 3. Set Up `launchd` to Run on Startup

- Copy the `com.rikkibelle.moveepubs.plist` file to the `LaunchAgents` directory:
  ```bash
  cp com.rikkibelle.moveepubs.plist ~/Library/LaunchAgents/
  ```

- Load the `launchd` job to run the script on startup:
  ```bash
  launchctl load ~/Library/LaunchAgents/com.rikkibelle.moveepubs.plist
  ```

This will make the script run automatically every time you start your Mac.

---

## How It Works

1. **File Detection**: The script checks for new `.epub` files in your `Downloads` folder.
2. **File Conversion**: When a new `.epub` file is detected, it automatically runs `kepubify` to convert it to `.kepub.epub` format.
3. **File Movement**: The converted `.kepub.epub` file is then moved to the `Kobo Books` folder inside your home directory (`/Users/username/Kobo Books`).

---

## Customizing the Script

You can customize the folder paths and other settings in the script to suit your needs:

- Change the destination folder for the converted files in the script.
- Modify the file types or add additional file extensions to track.

Edit the `move_epubs.sh` script with any text editor:

```bash
nano ~/auto-epub-mover/move_epubs.sh
```

---

## Troubleshooting

If you encounter any issues:

- Check the logs by reviewing the `move_epubs.log` file, which is created each time the script runs.
- Ensure that `Kepubify` is correctly installed and accessible from the terminal.
- Ensure that `launchd` is running and the plist file is loaded properly.

---
