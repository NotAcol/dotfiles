# Dotfiles

![](_assets/firefox.png)

![](_assets/screenshot.png)

### Git

```console
$ pacman -S git
```
### Stow

```console
$ pacman -S stow
```

## Installation
Grab [paru](https://github.com/Morganamilo/paru) -> Install all apps bellow ->
clone this repo and stow -> do settings described below 

>If you want to game do "$ paru -S arch-gaming-meta" after being done with everything else

### Clone and stow

```console
$ git clone https://github.com/NotAcol/dotfiles.git
$ cd dotfiles
```

Stow to create symlinks

```console
$ stow .
```

If stow doesnt work


```console
$ git add .
$ stow --adopt .
$ git restore .
```


# APPS

## General

```console
$ paru -S thefuck tealdeer fzf bat exa zoxide atuin \
zsh neovim tmux yazi trashy ripgrep fd unarchiver duf gdu \
man bat-extras man-pages pass btop peaclock zathura jq poppler \
zathura-pdf-mupdf s glow epy-ereader-git dunst \
gimp cava qalculate-gtk spotify-launcher ventoy fastfetch \
qbittorrent silicon webcord update-grub polkit thunar \
thunar-archive-plugin nomacs perl-image-exiftool \
python-pygments spicetify-cli zip p7zip brightnessctl \
ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji waybar \
rofi-lbonn-wayland-git wl-clipboard polkit-kde-agent \
qt5-wayland qt6-wayland qt5ct wf-recorder \
hyprcursor hyprlock hypridle hyprpaper grimblast-git \
xdg-desktop-portal-hyprland ffmpegthumbnailer
```

## Audio

```console
$ paru -S pipewire gst-plugin-pipewire pipewire-alsa \
pamixer pipewire-audio pipewire-jack pipewire-pulse \
wireplumber pavucontrol playerctl mpv mpd ncmpcpp \
noise-suppression-for-voice
```
## Network

```console
$ paru -S networkmanager
$ sudo systemctl enable --now NetworkManager.service
```

>$ nmtui

## Bluetooth

```console
$ paru -S bluez bluez-utils bluetuith
$ sudo systemctl enable --now bluetooth.service
```

## Obs 

```console
$ paru -S obs-studio-rc ffmpeg-obs cef-minimal-obs-rc-bin
```

### Using obs for virtual cam

```console
$ paru -S linux-headers v4l2loopback-dkms
$ sudo touch /etc/modules-load.d/v4l2loopback.conf
$ sudo nvim /etc/modules-load.d/v4l2loopback.conf
```

add

```text
v4l2loopback
```

>Will work after reboot


## Zsh with zap

in zsh terminal

```console
$ zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
```

>This might backup and replace .zshrc if it does switch them back to this repo's version

```console
$ zap update all
$ chsh -s /usr/bin/zsh
$ atuin import auto
```

better use trashy instead of rm

zsh is set to vi keybinds if you want emac change it at ~/.zshrc line 48

If you want to sync search history across machines with end to end encryption you can trivially do it [here](https://docs.atuin.sh/guide/sync/)

## Nvim setup

```console
$ nvim
```

- :Lazy sync
- :MasonInstallAll

## Tmux

#### Tmux plugins

```console
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$ tmux source ~/.tmux.conf
```

press "ctrl+space I" in tmux window to download plugins 

#### Tmux changed keybinds

- Prefix = Ctrl + space
- Prefix + v/h/x to make vertical/horizontal/kill pane
- Ctrl + vim keys to move around panes
- Alt + h/l to move to prev/next window
- Alt + j/k to create/kill window
- Prefix + r to rename session
- Prefix + X to kill session

## Paru 

```console
$ sudo nvim /etc/pacman.conf
```

- Uncomment: Color

```console
$ sudo nvim /etc/paru.conf
```

- Uncomment: BottomUp
- Uncomment: SudoLoop
- Uncomment: NewsOnUpgrade

```console
$ paru --gendb
```

Add a pacman hook to clear old cache

```console
$ sudo touch /etc/pacman.d/hooks/paccache.hook
$ sudo nvim /etc/pacman.d/hooks/paccache.hook
```

```text
[Trigger]
Operation = Remove
Operation = Install
Operation = Upgrade
Type = Package
Target = *

[Action]
Description = Keep the last cache and the currently installed.
When = PostTransaction
Exec = /usr/bin/paccache -rvk2
```

## Update tealdeer manpages

```console
$ tldr --update
```

## Catppuccinification

```console
$ paru -S catppuccin-mocha-grub-theme-git catppuccin-gtk-theme-mocha \
papirus-icon-theme kvantum nwg-look kvantum-theme-catppuccin-git 
```

Set up nwg-look and kvantum to catppuccin-mocha-flamingo

## Bat theme

```console
$ wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
$ bat cache --build
```

## Grub theme

```console
$ sudo cp -r /usr/share/grub/themes/catppuccin-mocha/ /boot/grub/themes/
$ sudo nvim /etc/default/grub
```

GRUB_THEME="/boot/grub/themes/catppuccin-mocha/theme.txt"

```console
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
```

>Can skip making the config here if nvidia gpu

## Firefox

[Grab betterfox](https://github.com/yokoffing/Betterfox)

### Addons

[Ublock Origin](https://github.com/yokoffing/Betterfox), [Tridactyl](https://addons.mozilla.org/en-US/firefox/addon/tridactyl-vim/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search), [Dark Reader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/), [Youtube Dislike](https://addons.mozilla.org/en-US/firefox/addon/return-youtube-dislikes/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search), [Auto Tab Discard](https://addons.mozilla.org/en-US/firefox/addon/auto-tab-discard/)

Add [blocklists](https://github.com/yokoffing/filterlists#guidelines)

### Rice

Add [Catppuccin theme](https://github.com/catppuccin/firefox)

- about:config
- toolkit.legacyUserProfileCustomizations.stylesheets -> true
- about:profiles -> Root Directory

```console
$ pkill -f firefox
$ cp -r ~/dotfiles/_firefox/startpage ./
$ start firerfox and it should work
```

>Big thanks to [this](https://github.com/Haruzona/penguinFox) repo for the css files

### Custom Home Page

- Settings -> Home -> New Windows and Tabs
- Custom URLs...
- file:///home/YOUR-USERNAME/dotfiles/_firefox/startpage/index.html

you can edit the home page to whatever

## Spotify

#### Spotify wayland fix

```console
$ sudo nvim /etc/spotify-launcher.conf
```
uncomment: extra_arguments = ["--enable-features=UseOzonePlatform", "--ozone-platform=wayland"]


#### Spotify theme

Login to spotify

```console
$ nvim ~/dotfiles/.config/spicetify/config-xpui.ini
```

Edit path to use correct user name

```console
$ spicetify apply
```

#### Block spotify ads

```console
$ sudo nvim /etc/hosts
```

```text
127.0.0.1 media-match.com
127.0.0.1 adclick.g.doublecklick.net
127.0.0.1 www.googleadservices.com
127.0.0.1 open.spotify.com
127.0.0.1 pagead2.googlesyndication.com
127.0.0.1 desktop.spotify.com
127.0.0.1 googleads.g.doubleclick.net
127.0.0.1 pubads.g.doubleclick.net
127.0.0.1 audio2.spotify.com
127.0.0.1 www.omaze.com
127.0.0.1 omaze.com
127.0.0.1 bounceexchange.com
# 127.0.0.1 spclient.wg.spotify.com
127.0.0.1 securepubads.g.doubleclick.net
127.0.0.1 8.126.154.104.bc.googleusercontent.com
127.0.0.1 104.154.126.8
```

# NVIDIA

```console
$ paru -S nvidia-dkms nvidia-utils nvidia-settings \
libva-nvidia-driver libva-utils  lib32-nvidia-utils \
linux-headers vdpauinfo 
```

```console
$ sudo nvim /etc/default/grub
```

```text
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia.NVreg_PreserveVideoMemoryAllocations=1 nvidia_drm.modeset=1 amd_pstate=active"
```

>Remove amd_pstate=active if no amd cpu

```console
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
$ sudo nvim /etc/mkinitcpio.conf
```
```text
MODULES=(btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

```console
$ sudo mkinitcpio -p linux
$ sudo mkdir /etc/pacman.d/hooks/ 
$ sudo touch /etc/pacman.d/hooks/nvidia.hook
$ sudo nvim /etc/pacman.d/hooks/nvidia.hook
```
```text
[Trigger]

Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
### Uncomment the installed NVIDIA package
Target=nvidia
#Target=nvidia-open
#Target=nvidia-lts
### If running a different kernel, modify below to match
Target=linux

[Action]
Description=Updating NVIDIA module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case rg in linux*) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```

Tests after reboot

```console
$ vdpauinfo
$ vainfo
```

VAEntrypointEncVLD good 👍

```console
$ sudo systemctl enable nvidia-suspend.service
$ sudo systemctl enable nvidia-hibernate.service
$ sudo systemctl enable nvidia-resume.service
```

>Maybe install xorg-xwayland-explicit-sync-git if flickerig persists after reboot

# Dev stuff

```console
$ sudo pacman -S vulkan-devel vulkan-icd-loader \
lib32-vulkan-icd-loader glm glfw benchmark \
clang llvm ninja pwndbg lld gitui openssh python-pygments \
```

GDB

>In ~/.gdbinit change path in second line to correct username

![](_assets/gdb.png)

## Scripts 

> Monitors a file for changes and outputs assembly
- monitor [cpp file in current dir]

> Disassembles and prints syntax highlighted assembly with bat
- disassemble [file in current dir]
