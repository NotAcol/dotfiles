# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/NotAcol/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

## Zsh

```
$ pacman -S zsh
```
#### zap

in zsh terminal

```
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
```

# APPS

### General
```
paru -S thefuck tealdear fzf bat exa zoxide s yewtube glow epy epv mpv mpd ncmpcpp \
peaclock duf tmux tmux-plugin-manager nvchad-git  zathura zathura-pdf-mupdf \
ttf-jetbrains-mono-nerd gimp pamixer pipewire gst-plugin-pipewire pipewire-alsa \
pipewire-audio pipewire-jack pipewire-pulse wireplumber cava nwg-look kvantum \
kvantum-theme-catppuccin-git qalculate-gtk btop spotify-adblock yazi ventoy \
grub-theme-bsol-git less gef fastfetch qbittorrent silicon webcord trashy \
lld pass ripgrep fd noise-suppression-for-voice update-grub ninja papirus-icon-theme \
qutebrowser polkit thunar thunar-archive-plugin viewnior perl-image-exiftool
```

### Hyprland
```
paru -S hyprnotify hyprcursor hyprlock hypridle hyprpaper \
xdg-desktop-portal-hyprland waybar rofi-lbonn-wayland-git wl-clip \
polkit-kde-agent qt5-wayland qt6-wayland qtct libva-nvdia-driver-git \
grimblast-git wf-record 
