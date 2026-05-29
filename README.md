# Mac-Setup

An Ansible playbook and a small set of shell scripts to set up a fresh Mac
for development. Works on both Apple Silicon and Intel Macs.

## What it does

`main.sh` runs the bootstrap scripts in order and then applies the playbook:

1. **`xcode.sh`** — installs the Xcode Command Line Tools (idempotent).
2. **`homebrew.sh`** — installs [Homebrew](https://brew.sh) using the current
   installer and puts `brew` on the `PATH`.
3. **`ansible.sh`** — installs Ansible via Homebrew and the
   `community.general` collection.
4. **`playbook.yaml`** — installs the packages/apps below and configures the shell.

## Usage

```sh
./main.sh
```

> The Xcode Command Line Tools step opens a macOS dialog; click **Install** and
> accept the licence. The script waits until the install finishes before
> continuing.

## Homebrew formulae (`playbook.yaml`)

awscli · bitwarden-cli · docker · elinks · ettercap · git · htop · lsd · nmap ·
speedtest-cli · thefuck · tree · zsh

## Homebrew cask applications (`playbook.yaml`)

brave-browser · google-chrome · charles · ferdium · spotify · intellij-idea ·
firefox · iterm2 · visual-studio-code · sourcetree · tableplus

## Shell configuration

The playbook installs [oh-my-zsh](https://ohmyz.sh), the
`zsh-autosuggestions` and `zsh-syntax-highlighting` plugins, and
[SDKMAN](https://sdkman.io), then copies `zshrc` to `~/.zshrc`.
