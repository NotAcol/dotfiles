
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
```

# APPS

### General

```bash
paru -S thefuck tealdear fzf bat exa zoxide s \
yewtube glow epy-ereader-git mpv mpd ncmpcpp \
peaclock duf tmux tmux-plugin-manager nvchad-git \
zathura zathura-pdf-mupdf ttf-jetbrains-mono-nerd \
gimp pamixer pipewire gst-plugin-pipewire pipewire-alsa \
pipewire-audio pipewire-jack pipewire-pulse \
wireplumber cava nwg-look kvantum zsh \
kvantum-theme-catppuccin-git qalculate-gtk \
btop spotify-adblock yazi ventoy \
grub-theme-bsol-git less gef fastfetch qbittorrent \
silicon webcord trashy lld pass ripgrep fd \
noise-suppression-for-voice update-grub ninja \
papirus-icon-theme qutebrowser polkit thunar \
thunar-archive-plugin nomacs perl-image-exiftool \
brightnessctl pamixer playerctl python-adblock \
python-pygments spicetify-cli man man-pages discordo \
catppuccinifier-cli-bin webcord
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

Spotify theme

```bash
spicetify config current_theme catppuccin
spicetify config color_scheme mocha
spicetify config inject_css 1 inject_theme_js 1 replace_colors 1 overwrite_assets 1
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify apply
```

Bat theme

```bash
bat cache --build
```

Tmux plugins

```bash
tmux
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
waybar rofi-lbonn-wayland-git wl-clip \
polkit-kde-agent qt5-wayland qt6-wayland \
qt5ct libva-nvdia-driver-git grimblast-git wf-recorder
```

# NVIDIA

```bash
paru -S nvidia nvidia-utils nvidia-settings \
libva-nvdia-driver-git libva-utils lib32-nvidia-utils \
vdpauinfo
```

```bash
sudo nvim /etc/default/grub
```

>GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia_drm.fbdev=1 nvidia_drm.modeset=1 amd_pstate=active"
>
>GRUB_THEME="/boot/grub/themes/bsol/theme.txt"

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo nvim /etc/mkinitcpio.conf
```

>MODULES=(btrfs nvidia nnvidia_modeset nvidia_uvm nvidia_drm)

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

### Vulkan/Dev stuff

```bash
sudo pacman -S vulkan-devel vulkan-icd-loader \
lib32-vulkan-icd-loader glm glfw benchmark
```

```bash
vulkaninfo
vkcube
vkcube-wayland
```
