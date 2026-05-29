#!/usr/bin/env bash
set -euo pipefail

# Run from the directory this script lives in so relative paths resolve.
cd "$(dirname "$0")"

# 1. Xcode Command Line Tools
bash xcode.sh

# 2. Homebrew
bash homebrew.sh

# Make `brew` available to this session (Apple Silicon or Intel).
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# 3. Install everything declared in the Brewfile
echo "Installing packages and applications from the Brewfile..."
brew bundle --file=Brewfile

# 4. Shell configuration (oh-my-zsh, plugins, SDKMAN, zshrc, directories)
bash shell.sh

echo "Mac setup complete."
