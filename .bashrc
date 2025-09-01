# .bashrc
source ~/.bashprompt.d
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.cargo/bin:/snap/bin
export KUBECONFIG=$HOME/.kube/config
export EDITOR="/usr/bin/nvim"

######
# GIT ALIASES
#####
alias gc="git clone"
alias gl="git log --oneline"
alias gC="git commit -s -m"


## XINPUT ALIAS
alias xin1='xinput set-prop "ELAN0521:01 04F3:31B1 Touchpad" "libinput Natural Scrolling Enabled" 1'
alias xin2='xinput set-prop "ELAN0521:01 04F3:31B1 Touchpad" "libinput Tapping Enabled" 1'
alias xin='xin1 && xin2'

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

unset rc


# Enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

bind -x '"\C-y": fzf_history_execute'

fzf_history_execute() {
    local cmd
    cmd=$(history | fzf --height 40% --reverse --tac --no-sort | awk '{$1=""; sub(/^ /, ""); print}')
    if [[ -n "$cmd" ]]; then
        eval "$cmd"
    fi
}

. "$HOME/.cargo/env"

if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
    export TERM=xterm-256color
fi
