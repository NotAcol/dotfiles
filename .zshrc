 # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Set the GPG_TTY to be the same as the TTY, either via the env var
# or via the tty command.
if [ -n "$TTY" ]; then
  export GPG_TTY=$(tty)
else
  export GPG_TTY="$TTY"
fi

# SSH_AUTH_SOCK set to GPG to enable using gpgagent as the ssh agent.
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

## Using atuin for history, if you dont want that just unccomment next 3 lines
# HISTFILE=~/.zsh_history 
# HISTSIZE=1000000
# SAVEHIST=1000000

#exports
source ~/.zshenv

# Load and initialise completion system
autoload -Uz compinit
compinit

plug "romkatv/powerlevel10k"
plug "hlissner/zsh-autopair"
plug "MichaelAquilina/zsh-you-should-use"
plug "Aloxaf/fzf-tab"
plug "Freed-Wu/fzf-tab-source"
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"
plug "kutsan/zsh-system-clipboard"

set -o vi # VI-MODE | "set -o emacs" for emacs keybinds and delete/comment the next two lines
KEYTIMEOUT=1  # and zsh-vi-mode zsh-system-clipboard blugins
bindkey -M vicmd '^[' undefined-key 

eval "$(zoxide init --cmd cd zsh)"
eval "$(thefuck --alias)"
eval "$(atuin init zsh)"
eval "$(batpipe)"

# To customize prompt, run `p10k configure` or edit ~/dotfiles/.p10k.zsh.
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh
unset ZSH_AUTOSUGGEST_USE_ASYNC
