# Mac-Setup

A native shell-based bootstrap to set up a fresh Mac for development.
No Ansible — just Homebrew (`brew bundle`) and plain scripts. Works on both
Apple Silicon and Intel Macs.

## What it does

`main.sh` runs the steps in order:

1. **`xcode.sh`** — installs the Xcode Command Line Tools (idempotent).
2. **`homebrew.sh`** — installs [Homebrew](https://brew.sh) and puts `brew` on
   the `PATH` for both Apple Silicon (`/opt/homebrew`) and Intel (`/usr/local`).
3. **`brew bundle`** — installs everything declared in the [`Brewfile`](Brewfile).
4. **`shell.sh`** — installs [oh-my-zsh](https://ohmyz.sh), the
   `zsh-autosuggestions` and `zsh-syntax-highlighting` plugins, and
   [SDKMAN](https://sdkman.io); copies `zshrc` to `~/.zshrc` (backing up any
   existing one); and creates `~/projects` and `~/tmp`.

Every step is idempotent, so `main.sh` is safe to re-run.

## Usage

```sh
./main.sh
```

> The Xcode Command Line Tools step opens a macOS dialog; click **Install** and
> accept the licence. The script waits until the install finishes before
> continuing.

## Customising the packages

Edit the [`Brewfile`](Brewfile) to add or remove tools and apps, then run:

```sh
brew bundle --file=Brewfile
```

### Command-line tools

awscli · bitwarden-cli · docker · elinks · ettercap · git · htop · lsd · nmap ·
speedtest-cli · thefuck · tree · zsh

### Applications

brave-browser · google-chrome · charles · ferdium · spotify · intellij-idea ·
firefox · iterm2 · visual-studio-code · sourcetree · tableplus
