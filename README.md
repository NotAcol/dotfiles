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
$ git clone git@github.com/dreamsofautonomy/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

# Different program setups

## kitty

### font 

```
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
```

```
$ pacman -S kitty
```


### themes

```
https://github.com/dexpota/kitty-themes
```

## zsh

```
$ pacman -S zsh 
```

### extensions 

using oh-my-zsh rn but should replace

```
$ pacman -S zoxide mc bat tree fzf
```

```
https://github.com/zsh-users/zsh-completions
https://github.com/zsh-users/zsh-syntax-highlighting
https://github.com/zsh-users/zsh-autosuggestions
https://github.com/MichaelAquilina/zsh-you-should-use
```






