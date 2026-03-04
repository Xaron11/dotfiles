# 🛠️ My Dotfiles

This repository contains my personal configuration files (dotfiles) for setting up a consistent and efficient development environment across machines.

## 📦 What's Included

- **Shell** (Zsh)
  - `.bashrc`, `.zshrc`
  - `.profile`, `.bash_profile`
  - `.zshrc.zni`
  - `.p10k.zsh`

- **Git**
  - `.config/git/config`

- **Neovim Editor**
  - `.config/nvim/` (current: custom LazyVim setup, previously: minimal Vim configuration)

- **Terminal** (Alacritty)
  - `.config/alacritty/alacritty.toml`

- **Init**
  - `.xinitrc`

- **System Keybinds** (not much used now)
  - `.config/sxhkd/sxhkdrc`

- **Window Manager**
  - `.config/i3/` (**NEW**)
  - ~~`.config/awesome/`~~ (based on: [Awesome Copycats](https://github.com/lcpz/awesome-copycats) by [@lcpz](https://github.com/lcpz)) (*OUTDATED*)
    *Requires*: awesome-freedesktop, lain, deficient

- **Status Bar**
  - `.config/i3/i3blocks.conf` (**NEW**)
  - ~~`.config/awesome/`~~ (*OUTDATED*)
  - ~~`.config/polybar/`~~ (*OLD*)

- **Appearance**
  - `.Xresources`
  - `.config/Kvantum/`
  - `.fonts.conf`
  - `.gtkrc-2.0`, `.config/gtk-2.0/`, `.config/gtk-3.0/`, `.config/gtk-4.0/` (GTK)
  - `.config/qt5ct/`, `.config/qt6ct` (Qt)
  - `.config/picom/picom.conf` (picom)

- **Rofi Menus**
  - `.config/rofi/`

- **Scripts**
  - `.Scripts/` (custom scripts)

- **Others**
  - `.config/fastfetch/config.jsonc` (fastfetch)
  - `.config/btop/btop.conf` (btop)
  - `.alsoftrc` (OpenAL)
  - `.tool-versions` (asdf)
  - `.config/` for other apps

## 🚀 Setup Instructions

To clone and use these dotfiles on a new machine:

```bash
# Clone as a bare repository
git clone --bare git@github.com:Xaron11/dotfiles.git $HOME/.dotfiles

# Define a git alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Hide untracked files
dotfiles config --local status.showUntrackedFiles no

# Check out your dotfiles into $HOME
dotfiles checkout
```
To make the alias permanent, add this to your .bashrc or .zshrc:

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
