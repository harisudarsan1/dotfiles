#!/bin/bash

case "$1" in
  tmux)
    nvim ~/dotfiles/.tmux.conf
    ;;
  nvim)
    nvim ~/dotfiles/nvim
    ;;
  lazygit)
    nvim ~/dotfiles/lazygit
    ;;
  git)
    nvim ~/dotfiles/.gitconfig
    ;;
  fish)
    nvim ~/dotfiles/fish
    ;;
  bash)
    nvim ~/dotfiles/.bashrc
    ;;
  ssh)
    nvim ~/.ssh/config
    ;;
  *)
    echo "Usage: $0 [tmux|nvim|git|zsh|bash|ssh]"
    ;;
esac
