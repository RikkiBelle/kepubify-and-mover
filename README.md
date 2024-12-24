
# Auto EPUB Mover and Kepubify Converter

This project automates the process of converting `.epub` files to `.kepub.epub` format and moves them to a designated folder on your Mac. It includes:

- A script to move `.epub` files from the Downloads folder to a specified directory (`Kobo Books`).
- Automatic conversion of `.epub` files using the [Kepubify](https://github.com/DavidWinter/kePubify) tool.
- A `launchd` job to make the script run automatically on startup.

## Prerequisites

Before using the script, ensure that you have the following installed on your Mac:

1. **Homebrew**: A package manager for macOS.
2. **Kepubify**: A command-line tool to convert `.epub` to `.kepub.epub`.
3. **Git**: To clone the repository.

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

3. Ensure that you have Git installed:
   ```bash
   git --version
   ```

---

## Setup Instructions

### 1. Clone This Repository

Clone this repository to your Mac:

```bash
git clone https://github.com/rikkibelle/kepubify-and-mover.git
cd kepubify-and-mover
```

### 2. Add the Script to `/usr/local/bin`

- Move the `move_epubs.sh` script to `/usr/local/bin` (or any directory in your `PATH`).
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

