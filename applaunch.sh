
print -rl -- ${(ko)commands} | fzf | (nohup ${SHELL:-"/bin/sh"} &) >/dev/null 2>&1
