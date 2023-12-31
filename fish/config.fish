if status is-interactive
    # Commands to run in interactive sessions can go here
end



alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias icat='kitty +kitten icat'
alias ff='nvim $(fzf)'
export EDITOR='nvim'
export VISUAL='nvim'

alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'
alias ff='fzf|xargs nvim'

