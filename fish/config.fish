if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ./zoxide.fish
export PATH="$PATH:/opt/nvim-linux64/bin"

export PATH="$PATH:/usr/local/go/bin"

export PATH="$PATH:/home/harisudarsan/go/bin"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias icat='kitty +kitten icat'
alias ff='nvim $(fzf)'
export EDITOR='nvim'
export VISUAL='nvim'

alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'
alias ff='fzf|xargs nvim'
alias mk='minikube'
alias kgpa='kubectl get pods -A'
alias kc='kubectl'
alias kap='kubectl apply -f'
alias kl='kubectl logs'

