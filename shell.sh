#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

ZSH_DIR="$HOME/.oh-my-zsh"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH_DIR/custom}"

# --- oh-my-zsh ---
if [ -d "$ZSH_DIR" ]; then
  echo "oh-my-zsh is already installed."
else
  echo "Installing oh-my-zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# --- zsh plugins (cloned into ZSH_CUSTOM so the plugins=() list resolves) ---
clone_plugin() {
  local name="$1" repo="$2" dest="$ZSH_CUSTOM/plugins/$1"
  if [ -d "$dest" ]; then
    echo "$name is already installed."
  else
    echo "Installing $name..."
    git clone --depth 1 "$repo" "$dest"
  fi
}
clone_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git"
clone_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"

# --- SDKMAN ---
if [ -d "$HOME/.sdkman" ]; then
  echo "SDKMAN is already installed."
else
  echo "Installing SDKMAN..."
  curl -s "https://get.sdkman.io" | bash
fi

# --- zshrc ---
if [ -f "$HOME/.zshrc" ]; then
  echo "Backing up existing ~/.zshrc to ~/.zshrc.bak"
  cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi
echo "Installing configured zshrc..."
cp ./zshrc "$HOME/.zshrc"

# --- Working directories ---
mkdir -p "$HOME/projects" "$HOME/tmp"

echo "Shell configuration complete."
