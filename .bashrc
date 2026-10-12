[[ $- == *i* ]] || return

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

[[ -r /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

alias grep='grep --color=auto'

alias ls='ls --color=auto'

_fh()
{
    local c
    c=$(HISTTIMEFORMAT= history |
        sed 's/^ *[0-9]* *//' |
        tac |
        awk '!s[$0]++' |
        fzf --layout=reverse --height=20) || return 0
    READLINE_LINE=$c
    READLINE_POINT=${#c}
}
bind -x '"\C-r": _fh'

bind -x '"\C-f": tm'

_gp()
{
    local b i d=0 s=0
    b=$(git branch --show-current 2>/dev/null)
    [[ -n $b ]] || return 0
    while IFS= read -r i; do
        [[ ${i:1:1} == ' ' ]] || d=1
        [[ ${i:0:1} == [' ?'] ]] || s=1
    done < <(git status --porcelain 2>/dev/null)
    printf ' git:(\001\e[35m\002%s\001\e[0m\002)' "$b"
    ((d)) && printf ' \001\e[31m\002*\001\e[0m\002'
    ((s)) && printf ' \001\e[32m\002+\001\e[0m\002'
}

PS1='\[\e[$((EUID ? 32 : 31))m\]->\[\e[0m\] \[\e[1;36m\]\W\[\e[0m\]$(_gp) >> '

for i in ~/.bashrc.d/*; do
    [[ -f $i ]] && . "$i"
done
unset i
