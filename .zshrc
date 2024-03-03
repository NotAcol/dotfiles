# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

HISTFILE=~/.zsh_history

#exports
HISTSIZE=1000000
SAVEHIST=1000000
export TERMINAL="kitty"
export LESSOPEN="|bat --paging=auto --color=always %s"
export VIEWER="less"
export LESS='-R'
export EDITOR="nvim"



# Load and initialise completion system
autoload -Uz compinit
compinit

plug "zap-zsh/supercharge"
plug "wintermi/zsh-starship"
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "MichaelAquilina/zsh-you-should-use"
plug "zap-zsh/fzf"
plug "Aloxaf/fzf-tab"
plug "Freed-Wu/fzf-tab-source"
plug "zsh-users/zsh-autosuggestions"
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/web-search"

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


#speed hack
alias mc="mc --nosubshell"
#colors
alias cat=bat
alias ls="eza --color=auto --hyperlink --icons=auto --classify=auto"
alias grep='rg' #remember to use rg retard >.<
alias tree="ls -t -l 2"
alias treeg="ls -t --git-ignore -l 2"

#-
alias nvimrc='nvim ~/.config/nvim/'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
eval "$(thefuck --alias)"
