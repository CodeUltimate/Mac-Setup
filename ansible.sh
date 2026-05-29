#!/usr/bin/env bash
set -euo pipefail

# Install Ansible via Homebrew (skips if already installed).
if command -v ansible-playbook >/dev/null 2>&1; then
  echo "Ansible is already installed."
else
  echo "Installing Ansible..."
  brew install ansible
  echo "Ansible installation complete."
fi

# The playbook uses the homebrew/homebrew_cask modules, which live in the
# community.general collection. Install it if it is missing.
echo "Ensuring the community.general Ansible collection is present..."
ansible-galaxy collection install community.general
