#!/usr/bin/env bash
set -euo pipefail

# Run from the directory this script lives in so relative paths resolve.
cd "$(dirname "$0")"

# Run all of the bootstrap scripts in order.
bash xcode.sh
bash homebrew.sh
bash ansible.sh

# Make `brew` available to this session (Apple Silicon or Intel) so the
# playbook's homebrew tasks can find it.
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

echo "Running the Ansible playbook to install Homebrew packages..."
ansible-playbook -i localhost playbook.yaml

echo "Ansible playbook successfully executed."
