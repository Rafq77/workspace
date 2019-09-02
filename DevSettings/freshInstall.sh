#!/bin/bash

PRFX="-=========="
# TODO extend wth `uname -a` check
if [ -e /usr/bin/zypper ]; then 
	# this is for openSuse in WSL
	echo "${PRFX} Detected Zypper package manager."

	echo "${PRFX} Refreshing repositories"
	sudo zypper refresh

	echo "${PRFX} Installing the usual: compiler, powerline, vim, zsh, git, gtest, gmock" 
	sudo zypper install vim vim-plugin-NERDtree vim-plugin-fugitive vim-plugin-powerline vim-plugin-colorschemes powerline tmux-powerline clang gcc8-c++ vim-data powerline-fonts zsh git gtest gmock

	echo "${PRFX} Creating temporary files for tmux"
	sudo systemd-tmpfiles --create 

	PTH="/usr/share/powerline/zsh/powerline.zsh"
else  # TODO elif [ uname -a | grep Ubuntu ]
	# this is for regular Linux Install (Ubuntu derivative)
	echo "${PRFX} Proceeding with apt-get package manager."

	echo "${PRFX} Refreshing repositories"
	sudo apt-get update

	echo "${PRFX} Installing the usual..."
	sudo apt-get install vim vim-fugitive vim-common vim-pathogen powerline vim-syntastic clang gcc-8 zsh git google-mock microcom python3 python3-pip curl python-pip flex texinfo help2man libtool-bin gitk libncurses5-dev

	PTH="/usr/share/powerline/bindings/zsh/powerline.zsh"
fi

echo "${PRFX} Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "${PRFX} Installing Vim Bundles"
BUNDLE_DIR=~/.vim/bundle
if [ ! -d ${BUNDLE_DIR} ]; then
    mkdir ${BUNDLE_DIR} -p
fi

echo "${PRFX} Installing vim plugins"
git clone git://github.com/altercation/vim-colors-solarized.git ${BUNDLE_DIR}/vim-colors-solarized
git clone https://github.com/scrooloose/nerdtree.git ${BUNDLE_DIR}/nerdtree

echo "${PRFX} Installing vim powerline plugin"
pip install powerline-status

echo "${PRFX} Copy config files"
cp .tmux.conf .zshrc .vimrc .gitconfig ~

echo "${PRFX} Append powerline to zsh config"
echo "if [[ -r ${PTH} ]]; then
  source ${PTH} 
fi" >> ~/.zshrc

echo "${PRFX} Configure zsh!"
zsh
