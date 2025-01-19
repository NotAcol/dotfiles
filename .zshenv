export TERMINAL="ghostty"
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
--multi --preview 'bat --color=always -n --line-range :500 {}'\
--border=rounded --reverse"
export FZF_DEFAULT_COMMAND="fd --hidden --max-depth=5 --strip-cwd-prefix --exclude .git"
export FZF_TMUX_OPTS=" -p90%,70% "

# keeping this in separate file cause it's aids
export LS_COLORS="$(<$HOME/.ls_colors)"

export PATH="$PATH:$HOME/.scripts"

# Fix for password store
export PASSWORD_STORE_GPG_OPTS='--no-throw-keyids'

#colors
alias cat=bat
alias ls="eza -lhrMs size --hyperlink --classify=auto --smart-group --group-directories-first"
alias grep='rg' 
alias tree='eza -T --group-directories-first '
alias find="fd"
alias clock="peaclock --config-dir ~/.config/peaclock"
alias tmux="tmux -2"

# convenience stuff
alias manpages='man -k . | fzf -e | awk '\''{print $1$2}'\'' | xargs man'
alias mt="sudo mount -o uid=$USER"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i' #Better use trash

# grimblast for screenshot
alias sc='grimblast copy area'

# quick disassembly
alias disasm="objdump -M intel,amd64 -g -C -S --visualize-jumps --no-addresses --no-show-raw-insn"

# tmux and kitty dont play well with images so have to do this cringe shit
alias fetch="kitten icat --align=left ~/Pictures/yorha.png | fastfetch --raw - --logo-width 40 --logo-height 19"

# yazi change cwd on close
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
