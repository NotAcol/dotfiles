
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

Get paru from github -> Install all apps bellow ->
clone this repo and stow -> do settings described below

```
$ git clone https://github.com/NotAcol/dotfiles.git
$ cd dotfiles
```

Then use GNU stow to create symlinks

```
$ stow .
```

>If stow doesnt work


```
$ git add .
$ stow --adopt .
$ git restore .
```

#### zap

in zsh terminal

```
$ zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
$ zap update all
```

# APPS

### General
```
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
python-pygments spicetify-cli man man-pages
```

```
$ spicetify config current_theme catppuccin
$ spicetify config color_scheme mocha
$ spicetify config inject_css 1 inject_theme_js 1 replace_colors 1 overwrite_assets 1
$ sudo chmod a+wr /opt/spotify
$ sudo chmod a+wr /opt/spotify/Apps -R
$ spicetify apply
```

```
$ bat cache --build
```

```
$ tmux
ctrl+space I
```

```
$ nvim
:MasonInstallAll
:Lazy sync
```

```
$tldr --update
```

>Setup nwg-look

### Hyprland

```
paru -S hyprnotify hyprcursor hyprlock \
hypridle hyprpaper xdg-desktop-portal-hyprland \
waybar rofi-lbonn-wayland-git wl-clip \
polkit-kde-agent qt5-wayland qt6-wayland \
qt5ct libva-nvdia-driver-git grimblast-git wf-recorder
```

# NVIDIA

```
$ sudo nvim /etc/default/grub
```

>GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia_drm.fbdev=1 nvidia_drm.modeset=1 amd_pstate=active"
>
>GRUB_THEME="/boot/grub/themes/bsol/theme.txt"

```
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
$ sudo nvim /etc/mkinitcpio.conf
```

>MODULES=(btrfs nvidia nnvidia_modeset nvidia_uvm nvidia_drm)

```
$ sudo mkinitcpio -p linux
$ sudo mkdir /etc/pacman.d/hooks/ 
$ sudo touch /etc/pacman.d/hooks/nvidia.hook
$ sudo nvim /etc/pacman.d/hooks/nvidia.hook
```

>[Trigger]
>Operation=Install
>Operation=Upgrade
>Operation=Remove
>Type=Package
>#### Uncomment the installed NVIDIA package
>Target=nvidia
>#Target=nvidia-open
>#Target=nvidia-lts
>#### If running a different kernel, modify below to match
>Target=linux
>
>[Action]
>Description=Updating NVIDIA module in initcpio
>Depends=mkinitcpio
>When=PostTransaction
>NeedsTargets
>Exec=/bin/sh -c 'while read -r trg; do case $trg in linux*) exit 0; esac; done; /usr/bin/mkinitcpio -P'

```
paru -S nvidia nvidia-utils nvidia-settings\
libva-nvdia-driver-git libva-utils lib32-nvidia-utils \
vdpauinfo
```

```
$ vdpauinfo
$ vainfo
```

>VAEntrypointEncVLD good 👍

### Vulkan/Dev stuff

```
sudo pacman -S vulkan-devel vulkan-icd-loader \
lib32-vulkan-icd-loader glm glfw benchmark
```

```
$ vulkaninfo
$ vkcube
$ vkcube-wayland
```
