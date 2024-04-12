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

 # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

#exports
source ~/.zshenv

# Load and initialise completion system
autoload -Uz compinit
compinit

#plug "zap-zsh/supercharge" #really good but I already use zoxide fzf and eza
plug "romkatv/powerlevel10k"
#plug "wintermi/zsh-starship"
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "MichaelAquilina/zsh-you-should-use"
plug "zap-zsh/fzf"
plug "Aloxaf/fzf-tab"
plug "Freed-Wu/fzf-tab-source"
#plug "zap-zsh/web-search"
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
#plug "zsh-users/zsh-history-substring-search" #type something and go into normal mode + vim keys

#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down


# P10k customizations
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Fix for password store
export PASSWORD_STORE_GPG_OPTS='--no-throw-keyids'

#colors
alias cat=bat
alias ls="eza --color=auto --hyperlink --icons=auto --classify=auto"
alias grep='rg' #remember to use rg retard >.<
alias tree="ls -T"
alias treeg="ls -T --git-ignore"
alias find="fd"

#-
alias nvimrc='nvim ~/.config/nvim/'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'


eval "$(zoxide init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(thefuck --alias)"
#eval "$(starship init zsh)"

# Integration for yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
	   cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# To customize prompt, run `p10k configure` or edit ~/dotfiles/.p10k.zsh.
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh
unset ZSH_AUTOSUGGEST_USE_ASYNC
