export TERMINAL="kitty"
export BAT_THEME="Catppuccin Mocha"
export LESSOPEN="|bat --paging=auto --color=always %s"
export PAGER="less"
#export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANPAGER='nvim +Man!'
export MANROFFOPT="-c"
export BATPIPE="color"
export RIPGREP_CONFIG_PATH="$HOME/.config/.ripgreprc"
export LESS='-R'
export EDITOR="nvim"
export VISUAL="nvim"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# keeping this in separate file cause it's aids
export LS_COLORS="$(<$HOME/.ls_colors)"


export PATH="$PATH:$HOME/.scripts"

# Fix for password store
export PASSWORD_STORE_GPG_OPTS='--no-throw-keyids'

#colors
alias cat=bat
alias ls="eza -lrMs size --hyperlink --classify=auto --smart-group --git --group-directories-first"
alias grep='rg' 
alias tree='eza -T --group-directories-first --hyperlink'
alias find="fd"
#alias man="batman"
alias clock="peaclock --config-dir ~/.config/peaclock"
alias tmux="tmux -2"
alias notes="tjournal"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i' #Better use trash

alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

# grimblast for screenshot
alias sc='grimblast copy area'

# quick and dirty disassembly
alias disasm="objdump -M intel,amd64 -g -C -S --visualize-jumps --no-addresses --no-show-raw-insn"
