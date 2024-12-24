#!/bin/bash

# Directories
DOWNLOADS_DIR="/Users/rikkibelle/Downloads"
HOME_DIR="/Users/rikkibelle"
DEST_DIR="$HOME_DIR/Kobo Books"
KEPUBIFY_PATH="/usr/local/bin/kepubify-darwin-arm64"
LOG_FILE="$HOME_DIR/move_epubs.log"

# Log file output setup
exec >> "$LOG_FILE" 2>&1

echo "$(date): Script started."

# Process each .epub file in the Downloads folder
for file in "$DOWNLOADS_DIR"/*.epub; do
  # Skip if no files match
  if [[ ! -e "$file" ]]; then
    echo "$(date): No .epub files found in $DOWNLOADS_DIR."
    break
  fi

  # Skip files already ending in .kepub.epub or .kepub_converted.epub
  if [[ "$file" == *.kepub.epub || "$file" == *_converted.kepub.epub ]]; then
    echo "$(date): Skipping already converted file $file."
    continue
  fi

  echo "$(date): Found file $file. Processing with kepubify..."

  # Run kepubify on the .epub file
  "$KEPUBIFY_PATH" "$file"

  if [ $? -eq 0 ]; then
    echo "$(date): kepubify completed for $file."
  else
    echo "$(date): Error running kepubify on $file!"
    continue
  fi

  # Locate the converted file in the Home folder
  CONVERTED_FILE="$HOME_DIR/$(basename "$file" .epub)_converted.kepub.epub"
  if [ -e "$CONVERTED_FILE" ]; then
    mv "$CONVERTED_FILE" "$DEST_DIR"
    echo "$(date): Moved $CONVERTED_FILE to $DEST_DIR."
    
    # Now that conversion is complete, move the original .epub file to the Trash
    mv "$file" ~/.Trash/
    echo "$(date): Moved $file to Trash."
  else
    echo "$(date): Converted file not found at $CONVERTED_FILE!"
  fi
done

echo "$(date): Script finished."
