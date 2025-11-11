# Tasks

## Apps and Media

### Browsing the Internet

`qutebrowser` - keyboard centric, Vi-like, scriptable, adblock

### Email

`thunderbird` - general mail client

### Videos

#### Watching

- `mpv` - simple, keyboard centric
- `vlc` - GUI

#### Editing

- `Kdenlive` - video editing
- `ffmpeg` - CLI, cut, convert
- `Handbrake` - GUI, convert

### Music

#### Listening

- `spotify` - music streaming

- `mpd` - music player daemon, CLI controlled
- `ncmpc` - TUI, mpd client, keyboard centric

#### Editing

- `audacity` - audio editor

### Files

- `thunar` - GUI, lightweight
- `yazi` - TUI, keyboard centric

### Notes

- `obsidian` - Markdown, linkable notes, Vim plugin, file sync
- `featherpad` - GUI notepad

### Images & Graphics

- `feh` - CLI, image viewer, wallpaper setter, lightweight, keyboard centric
- `gimp` - image editor, Photoshop-like

### Documents/PDF

- `libreoffice` / `onlyoffice` - office suite
- `zathura` - PDF viewer, Vim-like, keyboard centric, simple

- `texstudio` - LaTeX editor
- `texlive` - LaTeX distribution

### Communication, Social media

- `discord`
- `slack`

## Desktop Utilities

### Screenshots/Screen Recording

- `Alt+Print` - take screenshot of the whole screen and save to ~/Screenshots

- `Print` - take screenshot of selected area and save to ~/Screenshots
- `Shift+Print` - take screenshot of selected area and copy to clipboard

- `Ctrl+Print` - take screenshot using `flameshot` GUI tool and save to ~/Screenshots
- `Ctrl+Shift+Print` - take screenshot using `flameshot` GUI tool and copy to clipboard

- `scrot` - CLI, screenshot tool
- `flameshot` - GUI, screenshot tool, annotation
- `gnome-screenshot` - GUI, screenshot tool, window/area/fullscreen

- `obs-studio` - GUI, screen recording, streaming
- `simplescreenrecorder` - GUI, screen recording

### Notifications

- `notify-send` - CLI, send desktop notifications
- `dunst` - notification daemon, view, customizable

### Keys/Passwords

- `bitwarden` - password manager
- `bitwarden-cli` (`bw`) - CLI for Bitwarden
- `qute-bitwarden` - Bitwarden integration for qutebrowser

- `gpg` - CLI, encryption/signing
- `ssh-keygen` - CLI, generate SSH keys
- `ssh-add` - CLI, manage SSH keys

- `gnome-keyring` - key management system
- `seahorse` - GUI, manage SSH/GPG keys

### Wallpaper

- `xwallpaper` - set wallpaper

### Screen Lock

- `Super+Alt+L` - lock screen
- `i3lock` - blurred background lock screen

### Screen Saver

- `xscreensaver` - screen saver and locker

### Screen Layout

- `xrandr` - CLI, manage screen resolution, orientation, layout
- `arandr` - GUI, manage screen resolution, orientation, layout

### Keyboard shortcuts

- `Super+F1` - search keyboard shortcuts

## System Maintenance

### Package Management

- `pacman` - Arch repositories
- `yay` - AUR repository
- pacscripts (`pacin`, `pacupd`, `pacupg`, `yain`) - helpful aliases

#### Update system

- `pacman -Syu`
- `yay -Syu`

#### Install package

- `pacman -S <package_name>`
- `yay -S <package_name>`

#### Remove package

- `pacman -R <package_name>`
- `yay -R <package_name>`

#### Search package

- `pacman -Ss <search_term>`
- `yay -Ss <search_term>`

#### View package info

- `pacman -Si <package_name>`
- `yay -Si <package_name>`

#### Monitor system resources

- `ps` - CLI, view running processes`
- `btop` - TUI, system resource monitor: CPU, RAM, disk, network, processes

#### System Information

- `lshw` - CLI, detailed hardware info
- `inxi` - CLI, comprehensive system info

#### Disk & Storage Management

- `df` - CLI, view disk space usage
- `duf` - TUI, view disk space usage

- `du` - CLI, view directory size
- `dust` - TUI, view directory size
- `gparted` - GUI, manage disk partitions
- `fdisk` - CLI, manage disk partitions

- `lsblk` - CLI, view block devices
- `blkid` - CLI, view block device info

#### System Logs

- `journalctl` - CLI, view system logs
- `dmesg` - CLI, view kernel logs

#### Graphics Card

- `nvidia-smi` - CLI, NVIDIA GPU monitoring tool
- `nvidia-settings` - GUI, NVIDIA GPU settings

## Remote Access

### SSH and File Transfer

- `ssh` - CLI, secure shell for remote access
- `openssh` - SSH server for remote access

- `scp` - CLI, secure file copy over SSH
- `rsync` - CLI, remote file synchronization

### Remote Desktop

- `tiger-vnc-viewer` - GUI, VNC client for remote desktop access

### VPN

- `wireguard` - VPN for secure remote access
- `wg-quick` - CLI tool to manage WireGuard VPN connections

### Firewall

- `ufw` - CLI, uncomplicated firewall for managing firewall rules

## Development

### Terminal

- `alacritty` - GPU accelerated, simple, keyboard centric
- `tmux` - terminal multiplexer, split panes, sessions, keyboard centric
- `tmuxinator` - CLI, manage tmux sessions
- `zsh` + `oh-my-zsh` - shell, plugins, themes, aliases
- `fzf` - CLI, fuzzy finder
- `bat` - CLI, cat clone with syntax highlighting
- `eza` (aliased to `ls`) - CLI, modern ls with icons, colors
- `zoxide` (`z`, aliased to `cd`) - CLI, smart directory jumper

### Code Editor

- `nvim` (LazyVim) - TUI, Vim-like, highly customizable, plugins, code completion, text search, git integration, LSP support, formatter, linter, file explorer, terminal, AI code completion & chat
- `VSCode` - GUI, extensions, git integration, LSP support, formatter, linter, file explorer, terminal, AI agent

### Version Control

- `git` - CLI + aliases
- `lazygit` - TUI git client
- `tig` - another TUI git client
- `nvim` plugins: `gitsigns`, `fugitive`, `mini.git`, `mini.diff` - git integration

### Containers/Virtualization

- `docker` - containerization platform
- `lazydocker` - TUI for managing Docker containers
- `apptainer` - containerization platform
- `qemu` - hardware virtualization
- `libvirt` - virtualization API
- `virt-manager` - GUI for managing virtual machines

### Infrastructure

- `opentofu` - infrastructure as code tool

## Window/Workspace Management

- `i3` - tiling window manager

### App/Window Menu

- `rofi` - application launcher, window switcher, dmenu replacement

### Search/Open application

- `Super+D` - application menu
- `Super+T` - open web browser
- `Super+N` - open file manager
- `Super+Enter` - open terminal

### Switch between windows

- `Super+W` - window switcher

### Close current window

- `Super+q`

### Refresh desktop

- `Super+Shirt+R`

### Window management

- move window to another workspace with `Super+Shift+<workspace_number>`
- go to workspace with `Super+<workspace_number>`

- move focus to another window with `Super+H/J/K/L`
- switch between windows with `Super+Tab`

- fullscreen window toggle with `Super+F`
- split window horizontally/vertically with `Super+B` / `Super+V`

- floating window toggle with `Super+Shift+Space`
- move floating window with `Super+Left Click Drag`

- resize window mode toggle with `Super+R`, resize with `H/J/K/L` keys
- exit resize mode with `Esc`

- window information: `xprop` - get window properties, `xwininfo` - get window geometry

## Status Bar

- `i3bar` (`i3blocks`) - status bar for i3: workspaces, quick apps; CPU, RAM, disk usage, temperature, network bandwidth, battery, volume, power profile, date/time, power menu

### Status Bar Indicators

- Network status: `iwgtk` (Wi-Fi, GUI), `iwctl` (Wi-Fi, TUI) - connect/disconnect, view networks
- Volume: `pavucontrol` (GUI) - adjust volume, input/output devices; mute/unmute (right-click); volume control (scroll)
- Power profile: `powerprofilesctl` (CLI) - view/switch power profiles, `scripts/power-profiles` (GUI) - rofi menu for power profiles
- Power menu: `rofi/powermenu.sh` (GUI) - rofi menu for power options

### Status Bar Applets (Tray Icons)

- Battery/Power: `powerkit` (GUI) - battery status, screen brightness
- Bluetooth: `blueman` (GUI) - manage Bluetooth devices
- Screenshot: `flameshot` (GUI) - screenshot tool

## Power Management

### Power Menu

- `Super+Shift+E` - open power menu: logout, reboot, shutdown, suspend, lock screen, reboot to Windows (dual-boot)

### Power Profiles

- `Super+Shift+P` - switch power profiles: performance, balanced, power saver

## Audio Management

- `pavucontrol` - GUI, PulseAudio volume control
- `amixer` - CLI, ALSA mixer

- `Super+P` - switch audio output devices
