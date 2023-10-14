#!/bin/bash
# WIP...

# Install and setup script for Arch based distributions.
echo "Setup started..."
sleep 1

echo "Updating the system..."
sleep 1
sudo pacman -Syu

echo "Installing nvidia drivers..."
sleep 1
# sudo pacman -S nvidia nvidia-utils nvidia-settings

echo "Installing packages..."
sleep 1
sudo pacman -S zsh vim neovim nodejs npm curl wget neofetch htop discord obsidian vlc
yay -S visual-studio-code-bin spotify

# Setting up git config, ssh keys
echo "Setting up git config..."
sleep 1
git config --global user.name "will-berg"
git config --global user.email "wm.bg@outlook.com"

# Pull down dotfiles
echo "Pulling down dotfiles..."
sleep 1


echo "Shell setup..."
sleep 1
SHELL_PATH=$(which zsh)
chsh -s $SHELL_PATH
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
