# Dotfiles

![](_assets/zen.png)

![](_assets/screenshot.png)

### Git

```bash 
$ pacman -S git
```
### Stow

```bash 
$ pacman -S stow
```

## Installation
Grab [paru](https://github.com/Morganamilo/paru) → Install all apps bellow →
clone this repo and stow → do settings described below 

>[!NOTE] 
If you want to game do "$ paru -S arch-gaming-meta proton-ge-custom-bin" 
after doing everything else, enable Proton-Ge as default in steam launcher 
compatibility options and turn off GPU acceleration rendering in web views 
from interface settings.

### Clone and stow

```bash 
$ git clone --depth=1 https://github.com/NotAcol/dotfiles.git
$ cd dotfiles
```

Stow to create symlinks

```bash 
$ stow .
```

If stow doesn't work


```bash 
$ git add .
$ stow --adopt .
$ git restore .
```

# APPS

## Before installing apps 
### Chaotic-aur

```bash 
$ su -
# pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
# pacman-key --lsign-key 3056513887B78AEB
# pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
# nvim /etc/pacman.conf
```
then under multilib add
```text
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
```
> [!NOTE]
> more info [here](https://github.com/chaotic-aur)

```
$ sudo pacman -S reflector
$ sudo reflector --sort rate --latest 20 --protocol https --save /etc/pacman.d/mirrorlist
```

```bash 
sudo pacman -S archlinux-xdg-menu
sudo update-desktop-database 
```

## General

```bash 
$ paru -S thefuck tealdeer fzf bat exa zoxide atuin choose \
zsh neovim yazi trashy ripgrep fd unarchiver duf dua-cli starship \
man bat-extras man-pages pass zathura jq poppler grimblast-git \
zathura-pdf-mupdf s dunst zen-browser-bin ffmpegthumbnailer \
cava qalculate-gtk spotify-launcher ventoy fastfetch hypridle \
qbittorrent silicon vesktop update-grub polkit dolphin qt5ct \
tmux gvfs nomacs perl-image-exiftool xdg-desktop-portal-hyprland \
python-pygments spicetify-cli zip p7zip hyprland-qtutils \
ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji waybar \
rofi-wayland rofi-emoji rofi-calc wl-clipboard clipse w3m \
qt5-wayland qt6-wayland wf-recorder swww brightnessctl \
hyprcursor hyprlock hyprpolkitagent carapace rsync gnuplot ddgr
```

> [!WARNING]
> if there are issues with missing font icons do `paru -S nerd-fonts-complete-mono-glyphs`


## Audio

```bash 
$ paru -S pipewire gst-plugin-pipewire pipewire-alsa \
pamixer pipewire-audio pipewire-jack pipewire-pulse \
wireplumber pavucontrol coppwr playerctl mpv mpd rmpc \
noise-suppression-for-voice python-mutagen yt-dlp
$ mkdir -p ~/.local/share/mpd/playlists
$ systemctl --user enable --now mpd
```
## Network

```bash 
$ paru -S networkmanager
$ sudo systemctl enable --now NetworkManager.service
```

>$ nmtui

## Bluetooth

```bash 
$ paru -S bluez bluez-utils bluetuith blueberry
$ sudo systemctl enable --now bluetooth.service
```

## Connection to phone

```bash 
$ paru -S kdeconnect
```
> [!NOTE]
> This app goes fucking hard works with iphone and on every from what I can tell
 There is some permissions you have to set on phone side but it's great.

## Obs 

```bash 
$ paru -S obs-studio obs-vaapi obs-vkcapture-git lib32-obs-vkcapture-git \
obs-rtspserver obs-gstreamer ffmpeg-obs cef-minimal-obs-rc-bin xdg-desktop-portal-wlr
```

## Zsh with zap

In zsh terminal

```bash 
$ zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
```

>This might back up and replace .zshrc if it does switch them back to this repo's version

```bash 
$ zap update all
$ chsh -s /usr/bin/zsh
$ atuin import auto
```

Better use trashy instead of rm

zsh is set to vi key binds if you want emacs change it at ~/.zshrc line 48

If you want to sync search history across machines you can trivially do it [here](https://docs.atuin.sh/guide/sync/)

## tmux

Grab TPM

```bash 
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
$ tmux
```
press ctrl+space+I

### tmux key binds

Prefix is ctrl+space

- prefix + []   navigate left right windows
- prefix + dt   close open windows
- prefix + vhx  vertical horizontal kill pane
- prefix + X    kill session
- ctrl + hjkl   go to left up down right pane

## Nvim setup

```bash 
$ sudo pacman -S luarocks
$ nvim
```

- :Lazy sync
- :MasonToolsInstallsync

## Update tealdeer manpages

```bash 
$ tldr --update
```

## Paru 

> [!NOTE]
> Use `sudo pacman -Qdtq | sudo pacman -Rns -` every now and then to remove 
unneeded packages. Would add a hook for it but cba :3

```bash 
$ sudo nvim /etc/pacman.conf
```

- Uncomment: Color, VerbosePkgLists, ParallelDownloads
- Add ILoveCandy

```bash 
$ sudo nvim /etc/paru.conf
```

- Uncomment: BottomUp
- Uncomment: SudoLoop
- Uncomment: NewsOnUpgrade

```bash 
$ paru --gendb
```

```bash 
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

```bash 
$ sudo mkinitcpio -P
```

## Zen Browser

### Add-ons

- [Ublock Origin](https://github.com/yokoffing/Betterfox)
- [Tridactyl](https://addons.mozilla.org/en-US/firefox/addon/tridactyl-vim/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
- [Dark Reader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/)
- [Youtube Dislike](https://addons.mozilla.org/en-US/firefox/addon/return-youtube-dislikes/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)

##### Add [blocklists](https://github.com/yokoffing/filterlists#guidelines)

> [!NOTE] 
> For trydactil do `:bind J tabnext` , `:bind K tabprev` `:set smoothscroll true` to get more sane behavior

## Spotify

#### Spotify wayland fix

```bash 
$ sudo nvim /etc/spotify-launcher.conf
```
uncomment: extra_arguments = ["--enable-features=UseOzonePlatform", "--ozone-platform=wayland"]

#### Block Spotify ads

```bash 
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

## Rice

```bash 
$ paru -S catppuccin-mocha-grub-theme-git catppuccin-gtk-theme-mocha \
papirus-icon-theme kvantum nwg-look kvantum-theme-catppuccin-git 
```

Set up nwg-look and kvantum to catppuccin-mocha-flamingo
https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css

### Zen theme

#### Add custom css
- about:config
- toolkit.legacyUserProfileCustomizations.stylesheets → true
- about:profiles → Root Directory

```bash 
$ pkill -f zen-bin
$ cp -r ~/dotfiles/_zen/chrome ./
```
Start zen and it should work

#### Custom Home Page

- Settings → Home → New Windows and Tabs
- Custom URLs...
- File:///home/YOUR-USERNAME/dotfiles/_zen/startpage/index.html

### Bat theme

```bash 
$ wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
$ bat cache --build
```

### Spotify theme

Login to spotify

```bash 
$ nvim ~/dotfiles/.config/spicetify/config-xpui.ini
```

Edit path to use correct username

```bash 
$ spicetify apply
```

### Grub theme

```bash 
$ sudo cp -r /usr/share/grub/themes/catppuccin-mocha/ /boot/grub/themes/
$ sudo nvim /etc/default/grub
```

GRUB_THEME="/boot/grub/themes/catppuccin-mocha/theme.txt"

```bash 
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
```

# NVIDIA

```bash 
$ paru -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings \
libva-nvidia-driver libva-utils vdpauinfo linux-headers egl-wayland \
cuda wayland-protocols xorg-xwayland
```
> cuda package kinda big, but it helped with davinci resolve 👍

```bash 
$ sudo nvim /etc/default/grub
```

```text
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia.NVreg_PreserveVideoMemoryAllocations=1 nvidia_drm.modeset=1 nvidia_drm.fbdev=1 amd_pstate=active"
```

>Remove amd_pstate=active if no amd cpu

```bash 
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
$ sudo nvim /etc/mkinitcpio.conf
```


```text
MODULES=(... nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)
```

```bash 
$ sudo touch /etc/modprobe.d/nvidia.conf
$ sudo nvim /etc/modprobe.d/nvidia.conf
```

```text
options nvidia_drm modeset=1 fbdev=1
```

```bash 
$ sudo mkinitcpio -P
```

### Pacman hook

```bash 
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
# Uncomment the installed NVIDIA package
Target=nvidia-dkms
#Target=nvidia-open
#Target=nvidia-lts
# If running a different kernel, modify below to match
Target=linux

[Action]
Description=Updating NVIDIA module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux*) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```

Tests after reboot

```bash 
$ vdpauinfo
$ vainfo
```

VAEntrypointEncVLD good 👍

```bash 
$ sudo systemctl enable nvidia-suspend.service
$ sudo systemctl enable nvidia-hibernate.service
$ sudo systemctl enable nvidia-resume.service
```

Maybe install xorg-xwayland-explicit-sync-git if flickering persists after reboot

# Dev stuff

```bash 
$ paru -S vulkan-devel vulkan-icd-loader git-delta inotify-tools \
lib32-vulkan-icd-loader glm glfw linux-tools python-catppuccin \
clang llvm ninja lazygit openssh python-pygments ctags \
libc++abi libc++ tracy imhex-bin valgrind sshs fasm hyperfine
```

> Grab the template for .gitconfig from dotfiles/_gitstuff for delta integration, you also need the bad theme

# Academics

## LaTeX
```bash 
paru -S texlive-latexrecommended texlive-latexextra texlive-mathscience \
texlive-binextra texlive-fontsrecommended texlive-langgreek 
```

## Matlab/Mathematica for the poors
```bash 
paru -S sagemath sagemath-doc
```

<p align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" />
</p>

