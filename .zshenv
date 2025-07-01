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
alias ls="eza -lhrMs size --hyperlink --classify=auto --smart-group --group-directories-first --icons"
alias grep='rg' 
alias tree='eza -T --group-directories-first '
alias find="fd"
alias tmux="tmux -2"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i' #Better use trash

# trash shortcuts
alias t="gtrash"
alias tp="t put"
alias tf="t find"

# grimblast for screenshot
alias sc='grimblast copy area'

# convenience stuff
alias manpages='man -k . | fzf -e | awk '\''{print $1$2}'\'' | xargs man'
alias mt="sudo mount -o uid=$USER"
alias snapshot="sudo -E timeshift-launcher"

#git stuff
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto)  %D%n%s%n'"
alias gb="git branch"

alias gi="git init"
alias gcl="git clone"

alias gd="git diff"
alias gs="git status --short"

alias ga="git add"
alias gap="git add --patch"
alias gc="git commit --verbose"

alias gp="git pull"
alias gP="git push"

alias google="s -p google"
alias ddgr="BROWSER=w3m ddgr"

alias dua="dua i"

function stopwatch() {
    set -euo pipefail
    if [ -z "$1" ]; then
        echo "Usage: stopwatch <time>"
    else
        sleep $1 ; notify-send -a sound "Timer end" 
    fi
}

# quick disassembly
function disasm() {
    set -euo pipefail
    if [ -z "$1" ]; then
        echo "Usage: disasm <executable>"
    else
        file="$1"
        objdump -M intel,amd64 -g -C -S --visualize-jumps --no-show-raw-insn $file | pygmentize -P style=catppuccin-mocha -l asm |  less -R
    fi
}

# uses perf to give a quick overview of performance
function profile() {
    set -euo pipefail
    if [ -z "$1" ]; then
        echo "Usage: profile <executable>\n    Needs to be compiled -fno-omit-frame-pointer\n"
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
-fno-exceptions 
-fno-rtti 
-pthread
-ffinite-math-only
-fno-math-errno
-fno-trapping-math
-fno-signed-zeros
-freciprocal-math
-fassociative-math
-fuse-ld=lld
-flto=thin" > ./.flags

    echo "-mavx2
-mfma
-fno-exceptions 
-Wall 
-Wextra
-Wno-unused-function
-Wno-missing-braces
-Wno-excess-initializers
-pedantic
-pthread
-fuse-ld=lld 
-fno-trapping-math
-fno-math-errno
-fsanitize=address
-g3" > ./.debug-flags 

    echo -e "\033[1;33m                    use -fno-omit-frame-pointer for perf\n"
}

function encrypt() {
    set -euo pipefail
    if [ -z "$1" ]; then
        printf "Usage: encrypt <directory|file>\n"
    else
        file="$1"
        if [ ! -e "$file" ]; then
            echo "Error: '$file' does not exist."
            return 1
        fi

        gpgtar -o "${file}.gpg" -ce "${file}"

        printf "Delete original file? [Y/n] " 
        read answer
        answer=${answer:-y}

        if [[ "$answer" =~ ^[Yy] ]]; then
            rm -rf "${file}"
        fi
    fi
}

function decrypt(){
    set -euo pipefail
    if [ -z "$1" ]; then
        printf "Usage: decrypt <gpg encrypted tarball>\n"
    else
        file="$1"
        if [ ! -e "$file" ]; then
            echo "Error: '$file' does not exist."
            return 1
        fi
        gpg --decrypt "$file" | tar -x

        printf "Delete encrypted file? [Y/n] " 
        read answer
        answer=${answer:-y}

        if [[ "$answer" =~ ^[Yy] ]]; then
            rm -rf "${file}"
        fi
    fi
}

custom-fzf-nvim() {
  local selected="$(fd --type f -H -L --max-depth=5 --exclude .git | fzf )"
  if [[ -n "$selected" ]]; then
      nvim -b  $(echo $selected | tr '\n' ' ')
  fi
  zle reset-prompt
}
zle -N custom-fzf-nvim

custom-fzf-file-browse(){
    local selected="$(fd --type d -H --exclude .git | fzf --preview 'ls --color=always {}')"
    if [[ -n "$selected" ]]; then
        cd $(echo $selected | tr '\n' ' ')
    fi
    zle reset-prompt
}
zle -N custom-fzf-file-browse
