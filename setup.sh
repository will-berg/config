#!/bin/bash
# WIP...
# Prerequisites:
# 1. Git needs to be setup before this script can be ran
# 2. The config folder needs to be in the home directory (pulled from github)

# Install and setup script for Arch based distributions.
echo "Setup started..."
sleep 1

# Update the system
echo "Updating the system..."
sleep 1
sudo pacman -Syu

# Copy config files
cd ~
cp config/.zshrc ~

# Install packages
echo "Installing packages..."
sleep 1
sudo pacman -S zsh vim neovim nodejs npm curl wget neofetch htop discord obsidian vlc
yay -S visual-studio-code-bin

# Setting up git config, ssh keys
echo "Setting up git config..."
sleep 1
git config --global user.name "will-berg"
git config --global user.email "wm.bg@outlook.com"

# Shell setup (zsh)
echo "Shell setup..."
sleep 1
SHELL_PATH=$(which zsh)
chsh -s $SHELL_PATH
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Enable services
echo "Enabling services..."
sleep 1
# Bluetooth
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
# Firewall
sudo systemctl enable firewalld.service
sudo systemctl start firewalld.service

# Setup complete
echo "Setup complete!"
