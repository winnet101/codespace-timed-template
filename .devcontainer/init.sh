#!/usr/bin/env bash
set -e
# break instantly on errors

# Move to /opt
cd /opt

# Get the latest release tag from GitHub API
LATEST_URL=$(curl -s https://api.github.com/repos/wpilibsuite/vscode-wpilib/releases/latest \
  | grep "browser_download_url" \ 
  | grep ".vsix" \
  | cut -d '"' -f 4)
  # -d: delimit by char "
  # -f: fields

# Extract filename
FILENAME=$(basename "$LATEST_URL")

echo "Downloading latest WPILib VS Code extension: $FILENAME"
wget -q "$LATEST_URL" -O "$FILENAME"
# -q quiet mode
# -O download to file named "$FILENAME"

code --install-extension "/$FILENAME" --force