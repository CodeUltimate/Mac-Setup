#!/bin/sh

set -e
# Running all necessary scripts.
sh xcode.sh
sh homebrew.sh
sh ansible.sh

# Running ansible playbook
echo "Running ansible playbook to install Homebrew packages..." echo
ansible-playbook -i localhost playbook.yaml -vvvv

echo "Ansible playbook sucessfully executed" echo