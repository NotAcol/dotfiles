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

# Different program setups

## kitty

```
$ pacman -S kitty
```

### font 

https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip

### themes

```
kitty +kitten themes
```

## zsh

```
$ pacman -S zsh
```

### extensions 

in zsh terminal

```
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
```

```
$ pacman -S zoxide thefuck mc btop neofetch tree
```


## NVIM

```
pacman -S nvim
```
### NvChad

```
pacman -S ripgrep
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

## BLUETOOTH

sudo pacman -S bluez bluez-utils 

systemctl start bluetooth.service

bluetoothctl

### for tui

yay bluetuith


# Passoword stuff

https://www.youtube.com/watch?v=FhwsfH2TpFA

# Hyprland 

I will probably never finish this >.<

```
yay wl-clipboard-rs
```
