[[ :$PATH: == *:$HOME/.local/bin:* ]] || PATH=$HOME/.local/bin:$PATH

export EDITOR=nvim
export FZF_DEFAULT_OPTS='--info=inline-right --color=16,fg+:7,bg+:0'

export PERSONAL=$HOME/personal
export DOTFILES=$PERSONAL/dotfiles

[[ -f ~/.bashrc ]] && . ~/.bashrc
