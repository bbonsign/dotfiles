#!/usr/bin/env bash

# Script to create symlinks to all dotfiles

echo "===== Symlinking dotfiles ====="
DOTFILES="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
BIN_DIR="$HOME/.local/bin"

create_symlink() {
  local src="$1"
  local dest="$2"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    trash put "$dest"
  fi
  ln -sf "${DOTFILES}/${src}" "${dest}"
}

# create_symlink "justfile" "$HOME/justfile"
create_symlink rsync_excludes "$HOME/rsync_excludes"

create_symlink symlink.sh "$BIN_DIR/.f"

create_symlink direnv/direnvrc "$CONFIG_DIR/direnv/direnvrc"
create_symlink dunst/ "$CONFIG_DIR/dunst"
# create_symlink dygma/               "$CONFIG_DIR/dygma"
create_symlink foot "$CONFIG_DIR/foot"
create_symlink fuzzel "$CONFIG_DIR/fuzzel"
create_symlink ghostty "$CONFIG_DIR/ghostty"
# create_symlink kanata "$CONFIG_DIR/kanata"
# create_symlink keyd "$CONFIG_DIR/keyd"
# create_symlink litecli "$CONFIG_DIR/litecli"
create_symlink niri "$CONFIG_DIR/niri"
create_symlink nushell/scripts "$CONFIG_DIR/nushell/scripts"
create_symlink nvim "$CONFIG_DIR/nvim"
create_symlink rofi "$CONFIG_DIR/rofi"
create_symlink sway "$CONFIG_DIR/sway"
create_symlink swaylock/ "$CONFIG_DIR/swaylock"
create_symlink television/ "$CONFIG_DIR/television"
# create_symlink tridactyl/ "$CONFIG_DIR/tridactyl"
create_symlink waybar "$CONFIG_DIR/waybar"
create_symlink wlr-which-key "$CONFIG_DIR/wlr-which-key"
create_symlink libinput-gestures.conf "$CONFIG_DIR/libinput-gestures.conf"

echo "===== Finished symlinking to dotfiles ====="
