#!/bin/bash

echo "Refreshing repositories"
sudo zypper refresh

echo "Installing the usual: compiler, powerline, vim, zsh, git, gtest, gmock" 
sudo zypper install vim vim-plugin-NERDtree vim-plugin-fugitive vim-plugin-powerline vim-plugin-colorschemes powerline tmux-powerline clang gcc8-c++ zsh vim-data powerline-fonts zsh git gtest gmock

echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Creating temporary files for tmux"
sudo systemd-tmpfiles --create 

echo "Configure zsh!"
zsh
