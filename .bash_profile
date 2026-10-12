[[ :$PATH: == *:$HOME/.local/bin:* ]] || PATH=$HOME/.local/bin:$PATH

export EDITOR=nvim

export PERSONAL=$HOME/personal
export DOTFILES=$PERSONAL/dotfiles

[[ -f ~/.bashrc ]] && . ~/.bashrc
