# Source custom variables
source ~/.config/fish/variables.fish

fish_vi_key_bindings

function fish_greeting
    fastfetch --color red -l arch3
end

alias cat="bat"
alias ls="eza -lhrMs size --hyperlink --classify=auto --smart-group --group-directories-first --icons"
alias lsa="ls -a"
alias grep='rg' 
alias tree='eza -T --group-directories-first '
alias find="fd"
alias tmux="tmux -2"

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm'
alias trash='gtrash'
alias rsync='rsync -rPavhc'
alias mkdir='mkdir -p'

alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 744='chmod -R 744'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

alias manpages='man -k . | fzf -e | awk '\''{print $1$2}'\'' | xargs -ro man'
alias paruf="paru -Slq | fzf --preview 'paru -Sii {1}' | xargs -ro paru -S"

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

alias dua="dua i"

alias precord="perf record -g"
alias preport='perf report -M intel --percent-limit=0.5 -g "graph,0.5,caller"'

#anti retard aliases
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function encrypt
    if test -z "$argv[1]"
        printf "Usage: encrypt <directory|file>\n"
        return 1
    end

    set file "$argv[1]"
    if not test -e "$file"
        echo "Error: '$file' does not exist."
        return 1
    end

    gpgtar -o "$file.gpg" -ce "$file"
    if test $status -ne 0
        echo "Error: Encryption failed. Aborting."
        rm -rf "$file.gpg"
        return 1
    end

    read -P "Delete original file? [Y/n] " answer
    if test -z "$answer"
        set answer y
    end

    if string match -q -r '^[Yy]' -- "$answer"
       rm -rf "$file"
    end
end

function decrypt
    if test -z "$argv[1]"
        printf "Usage: decrypt <gpg encrypted tarball>\n"
        return 1
    end

    set file "$argv[1]"
    if not test -e "$file"
        echo "Error: '$file' does not exist."
        return 1
    end

    gpg --decrypt "$file" | tar -x
    if test $pipestatus[1] -ne 0
        echo "Error: Decryption failed. Aborting."
        return 1
    end

    read -P "Delete encrypted file? [Y/n] " answer
    if test -z "$answer"
        set answer y
    end

    if string match -q -r '^[Yy]' -- "$answer"
        rm -rf "$file"
    end
end

function fzf-nvim
    set -l selected (fd --type f -H -L --max-depth=5 --exclude .git | fzf)
    if test -n "$selected"
        command nvim -b $selected
    end
    commandline -f repaint
end

function fzf-file-browse
    set -l selected (fd --type d -H --exclude .git | fzf --preview 'ls --color=always {}')
    if test -n "$selected"
        cd $selected
    end
    
end

bind ctrl-e 'fzf-nvim'  repaint
bind -M insert ctrl-e 'fzf-nvim'  repaint
bind  alt-e 'fzf-file-browse' repaint
bind -M insert alt-e 'fzf-file-browse' repaint

if status is-interactive
    starship init fish | source
    enable_transience
    atuin init fish | source
    zoxide init --cmd cd fish | source
end
