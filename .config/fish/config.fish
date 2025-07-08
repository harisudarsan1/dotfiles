if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_vi_key_bindings

bind --mode insert --sets-mode default jk repaint
alias gc="git clone"
alias kc="kubectl"
alias kgpa="kubectl get pods -A"
alias kd="kubectl delete"
alias kdp="kubectl delete pod/"
alias kl="kubectl logs"
alias ka="kubectl apply -f"
alias ke="EDITOR=vim kubectl edit"
alias kde="kubectl describe"


