DOTFILES_DIR="$(pwd)"  # Get absolute path to current directory

# Home directory dotfiles
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/.tmux.reset.conf" ~/.tmux.reset.conf
ln -sf "$DOTFILES_DIR/.bashrc" ~/.bashrc

# # Config directory dotfiles
# mkdir -p ~/.config  # Ensure ~/.config exists

ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sf "$DOTFILES_DIR/fish" ~/.config/fish
ln -sf "$DOTFILES_DIR/lazygit" ~/.config/lazygit
ln -sf "$DOTFILES_DIR/kitty" ~/.config/kitty

# Ensure the script is executable
chmod +x ~/dotfiles/edit-config.sh

# Remove existing symlink if it exists
sudo rm -f /usr/bin/edc

# Create a new symlink with full absolute paths
sudo ln -s ~/dotfiles/edit-config.sh /usr/bin/edc

echo "Done. Try running 'edc tmux'"
