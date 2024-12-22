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

set -o vi # VI-MODE | "set -o emacs" for emacs keybinds and delete/comment the next two lines
KEYTIMEOUT=1  # and zsh-vi-mode zsh-system-clipboard blugins
bindkey -M vicmd '^[' undefined-key 

#exports
source ~/.zshenv

# Load and initialise completion system
autoload -U compinit
compinit

zstyle ':fzf-tab:*' use-fzf-default-opts yes

plug "Aloxaf/fzf-tab"
plug "Freed-Wu/fzf-tab-source"
plug "hlissner/zsh-autopair"
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"
plug "kutsan/zsh-system-clipboard"

eval "$(zoxide init --cmd cd zsh)"
eval "$(thefuck --alias)"
eval "$(atuin init zsh)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

# Transient prompt for starship
zle-line-init() {
  emulate -L zsh

  [[ $CONTEXT == start ]] || return 0

  while true; do
    zle .recursive-edit
    local -i ret=$?
    [[ $ret == 0 && $KEYS == $'\4' ]] || break
    [[ -o ignore_eof ]] || exit 0
  done

  local saved_prompt=$PROMPT
  local saved_rprompt=$RPROMPT

  # Set prompt value from character module
  PROMPT="$(starship module -s ${STARSHIP_CMD_STATUS:-0} character)"
  RPROMPT=''
  zle .reset-prompt
  PROMPT=$saved_prompt
  RPROMPT=$saved_rprompt

  if (( ret )); then
    zle .send-break
  else
    zle .accept-line
  fi
  return ret
}
zle -N zle-line-init
