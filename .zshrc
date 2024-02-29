# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

HISTFILE=~/.zsh_history

#exports
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="kitty"


#colors
alias cat=bat
alias ls=exa
alias grep='grep --color=auto'

#-
alias nvimrc='nvim ~/.config/nvim/'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'


plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
#plug "zap-zsh/zap-prompt"
plug "zap-zsh/web-search"
plug "wintermi/zsh-starship"
plug "MichaelAquilina/zsh-you-should-use"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
#plug "zap-zsh/nvim"
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "hlissner/zsh-autopair"




# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
