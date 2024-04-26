
# Dotfiles


### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation

Grab [paru](https://github.com/Morganamilo/paru) -> Install all apps bellow ->
clone this repo and stow -> do settings described below

```bash
git clone https://github.com/NotAcol/dotfiles.git
cd dotfiles
```

Stow to create symlinks

```bash
stow .
```

If stow doesnt work


```bash
git add .
stow --adopt .
git restore .
```

### zap

in zsh terminal

```bash
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
zap update all


chsh -s /usr/bin/zsh
```

# APPS

### General

```bash
paru -S thefuck tealdeer fzf bat exa zoxide s \
yewtube glow epy-ereader-git mpv mpd ncmpcpp \
peaclock duf tmux nvchad-git \
zathura zathura-pdf-mupdf ttf-jetbrains-mono-nerd \
gimp pamixer pipewire gst-plugin-pipewire pipewire-alsa \
pipewire-audio pipewire-jack pipewire-pulse \
wireplumber cava nwg-look kvantum zsh \
kvantum-theme-catppuccin-git qalculate-gtk \
btop spotify-launcher yazi ventoy \
grub-theme-bsol-git less gef fastfetch qbittorrent \
silicon webcord trashy lld pass ripgrep fd \
noise-suppression-for-voice update-grub ninja \
papirus-icon-theme polkit thunar \
thunar-archive-plugin nomacs perl-image-exiftool \
brightnessctl pamixer playerctl python-adblock \
python-pygments spicetify-cli man man-pages discordo \
catppuccinifier-cli-bin pavucontrol \
catppuccin-gtk-theme-mocha thunar zipa p7zip \
networkmanager noto-fonts noto-fonts-emoji \

```

Paru settings

```bash
sudo nvim /etc/pacman.conf
```

- uncomment Color

```bash
sudo nvim /etc/paru.conf
```

- uncomment BottomUp
- uncomment SudoLoop
- uncomment NewsOnUpgrade

```bash
paru --gendb
```
Spotify flickering fix

```bash
sudo nvim /etc/spotify-launcher.conf
```
- uncomment extra_arguments = ["--enable-features=UseOzonePlatform", "--ozone-platform=wayland"]


Spotify theme

- Login to spotify

```bash
nvim ~/dotfiles/.config/spicetify/config-xpui.ini
```

- Edit path to use correct user name

```bash
spicetify apply
```

Block spotify ads

```bash
sudo nvim /etc/hosts
```

>127.0.0.1 media-match.com
>127.0.0.1 adclick.g.doublecklick.net
>127.0.0.1 www.googleadservices.com
>127.0.0.1 open.spotify.com
>127.0.0.1 pagead2.googlesyndication.com
>127.0.0.1 desktop.spotify.com
>127.0.0.1 googleads.g.doubleclick.net
>127.0.0.1 pubads.g.doubleclick.net
>127.0.0.1 audio2.spotify.com
>127.0.0.1 www.omaze.com
>127.0.0.1 omaze.com
>127.0.0.1 bounceexchange.com
># 127.0.0.1 spclient.wg.spotify.com
>127.0.0.1 securepubads.g.doubleclick.net
>127.0.0.1 8.126.154.104.bc.googleusercontent.com
>127.0.0.1 104.154.126.8

Bat theme

```bash
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build
```

Tmux plugins

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
```
>ctrl+space I

Nvim setup

```bash
nvim
```

- :MasonInstallAll
- :Lazy sync

Update tealdear manpages

```bash
tldr --update
```

Setup nwg-look

### Firefox

[Grab betterfox](https://github.com/yokoffing/Betterfox)

#### Addons

[Ublock Origin](https://github.com/yokoffing/Betterfox), [Tridactyl](https://addons.mozilla.org/en-US/firefox/addon/tridactyl-vim/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search), [Dark Reader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/), [Youtube Dislike](https://addons.mozilla.org/en-US/firefox/addon/return-youtube-dislikes/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)

Add [blocklists](https://github.com/yokoffing/filterlists#guidelines)

#### Rice

Add [Catppuccin theme](https://github.com/catppuccin/firefox)

- about:config
- toolkit.legacyUserProfileCustomizations.stylesheets -> true
- about:profiles -> Root Directory
- kill firefox
- Dump contents of ~/dotfiles/stowignore_firefox here and start firefox

>Big thanks to [this](https://github.com/Haruzona/penguinFox) repo for the css files

### Hyprland

```bash
paru -S hyprnotify hyprcursor hyprlock \
hypridle hyprpaper xdg-desktop-portal-hyprland \
waybar rofi-lbonn-wayland-git wl-clipboard \
polkit-kde-agent qt5-wayland qt6-wayland \
qt5ct grimblast-git wf-recorder
```

### Bluetooth

```bash
paru -S bluez bluez-utils bluetuith
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```

# NVIDIA

```bash
paru -S nvidia-dkms nvidia-utils nvidia-settings \
libva-nvidia-driver libva-utils  lib32-nvidia-utils \
linux-headers vdpauinfo 
```

```bash
sudo nvim /etc/default/grub
```

>GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia.NVreg_PreserveVideoMemoryAllocations=1 nvidia_drm.fbdev=1 nvidia_drm.modeset=1 amd_pstate=active"
>
>GRUB_THEME="/boot/grub/themes/bsol/theme.txt"

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo nvim /etc/mkinitcpio.conf
```

>MODULES=(btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm)

```bash
sudo mkinitcpio -p linux
sudo mkdir /etc/pacman.d/hooks/ 
sudo touch /etc/pacman.d/hooks/nvidia.hook
sudo nvim /etc/pacman.d/hooks/nvidia.hook
```

>[Trigger]
>
>Operation=Install
>
>Operation=Upgrade
>
>Operation=Remove
>
>Type=Package
>### Uncomment the installed NVIDIA package
>Target=nvidia
>
>#Target=nvidia-open
>
>#Target=nvidia-lts
>
>### If running a different kernel, modify below to match
>Target=linux
>
>[Action]
>
>Description=Updating NVIDIA module in initcpio
>
>Depends=mkinitcpio
>
>When=PostTransaction
>
>NeedsTargets
>
>Exec=/bin/sh -c 'while read -r trg; do case rg in linux*) exit 0; esac; done; /usr/bin/mkinitcpio -P'

```bash
vdpauinfo
vainfo
```

VAEntrypointEncVLD good 👍

```bash
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service
```
maybe install xorg-xwayland-explicit-sync-git

### Vulkan/Dev stuff

```bash
sudo pacman -S vulkan-devel vulkan-icd-loader \
lib32-vulkan-icd-loader glm glfw benchmark \
clang llvm
```

```bash
vulkaninfo
vkcube
vkcube-wayland
```
