#!/usr/bin/env bash
set -euo pipefail

# Install the Xcode Command Line Tools (skips if already present).
if xcode-select -p >/dev/null 2>&1; then
  echo "Xcode Command Line Tools are already installed."
  exit 0
fi

echo "Installing Xcode Command Line Tools..."
xcode-select --install || true

# Wait for the installer to finish before continuing.
echo "Waiting for the Command Line Tools installation to complete..."
until xcode-select -p >/dev/null 2>&1; do
  sleep 10
  echo "Still installing..."
done

echo "Xcode Command Line Tools installation complete."
