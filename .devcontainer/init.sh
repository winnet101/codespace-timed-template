#!/usr/bin/env bash
set -e

# Move to /opt
cd /opt

# Get the latest release tag from GitHub API
LATEST_URL=$(curl -s https://api.github.com/repos/wpilibsuite/vscode-wpilib/releases/latest \
  | grep "browser_download_url" \
  | grep ".vsix" \
  | cut -d '"' -f 4)

# Extract filename
FILENAME=$(basename "$LATEST_URL")

echo "Downloading latest WPILib VS Code extension: $FILENAME"
wget -q "$LATEST_URL" -O "$FILENAME"

# Optional: install globally for VS Code in Codespaces
code --install-extension "/opt/$FILENAME" --force