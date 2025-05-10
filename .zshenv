export TERMINAL="ghostty"
export BAT_THEME="Catppuccin Mocha"
export LESSOPEN="|bat --paging=auto --color=always %s"
export PAGER="less"
export MANPAGER='nvim +Man!'
export MANROFFOPT="-c"
export BATPIPE="color"
export RIPGREP_CONFIG_PATH="$HOME/.config/.ripgreprc"
export LESS='-R'
export EDITOR="nvim"
export VISUAL="nvim"
export FZF_DEFAULT_OPTS=" --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 --color=selected-bg:#45475a --multi --preview 'bat --color=always -n --line-range :500 {}' --border=rounded --reverse"
export FZF_DEFAULT_COMMAND="fd --hidden --max-depth=5 --strip-cwd-prefix --exclude .git"
export FZF_TMUX_OPTS=" -p90%,70% "

# This is needed for valgrind cause glibc is a joke XD
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

# keeping this in separate file cause it's aids
export LS_COLORS="$(<$HOME/.ls_colors)"

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

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i' #Better use trash

# grimblast for screenshot
alias sc='grimblast copy area'

# tmux and kitty dont play well with images so have to do this cringe shit
alias fetch="kitten icat --align=left ~/Pictures/yorha.png | fastfetch --raw - --logo-width 40 --logo-height 19"

# convenience stuff
alias manpages='man -k . | fzf -e | awk '\''{print $1$2}'\'' | xargs man'
alias mt="sudo mount -o uid=$USER"

function stopwatch() {
    if [ -z "$1" ]; then
        echo "Usage: stopwatch <time>"
    else
        sleep $1 ; notify-send -a sound "Timer end" 
    fi
}

# quick disassembly
function disasm() {
    if [ -z "$1" ]; then
        echo "Usage: disasm <executable>"
    else
        file="$1"
        objdump -M intel,amd64 -g -C -S --visualize-jumps --no-show-raw-insn $file | pygmentize -P style=catppuccin-mocha -l asm |  less -R
    fi
}

# uses perf to give a quick overview of performance
function analyse() {
    if [ -z "$1" ]; then
        echo "Usage: analyse <executable>"
    else
        file="$1"
        perf record -g "$file"
        perf report -M intel --percent-limit=0.5 -g "graph,0.5,caller"
    fi
}

# yazi change cwd on close
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function flags() {
    echo "-O2
-mavx2
-mfma
-lc++abi 
-fno-exceptions 
-fno-rtti 
-pthread
-ftime-trace
-ffinite-math-only
-fno-math-errno
-fno-trapping-math
-fno-signed-zeros
-freciprocal-math
-fassociative-math
-fuse-ld=lld
-flto=thin" > ./.flags

    echo "-DDEBUG
-DPROFILE=1
-DENABLE_ASSERT
-O0
-mavx2
-mfma
-lc++abi 
-fno-exceptions 
-fno-rtti 
-Wall 
-Wextra
-Wno-unused-function
-Wno-c++20-designator
-Wno-c11-extensions
-Wno-null-pointer-subtraction
-Wno-gnu-anonymous-struct
-Wno-missing-braces
-Wnull-dereference
-Wdouble-promotion
-Wshadow
-Wformat=2
-pthread
-fuse-ld=lld 
-fno-trapping-math
-fno-math-errno
-fno-omit-frame-pointer  
-ggdb3
-lrt
-fsanitize=address" > ./.debug-flags 

#fno-omit-frame-pointer is for perf 
    echo -e "\033[1;33m                     remember to use tsan as well retard (-fsanitize=thread)"
}
