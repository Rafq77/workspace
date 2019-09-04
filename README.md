workspace 
======
Repeating code/scripts that I don't want to retype on regular basis.

This repository is divided in 2 following parts:
### 1. DevSettings
For usual settings of the developing environemnt. Such as vim config, profile aliases, installation script for fresh system installs etc. As for now following files are uploaded:

###### .tmux.conf
vim mapping and status bar colors

###### .vimrc
Some regular settings: 
* NERDTree bind on <C-E>
* 4 Spaces instead of tabs
* Buffer rotation bin on *gn* and *gp*
 
###### WSL profile.json
This is my personal WSL profile for the openSUSE Leap15.1 Linux distro on Windows within the experimental [Terminal app](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701?activetab=pivot:overviewtab). It utilizes the [DejaVuSansMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf)

###### .zshrc
It's the default .zshrc config file (after initial configuration) extended with the powerline call.

###### openSuseFreshInstall.sh
As for today this is the first draft of my installation script for openSUSe that can be run after a fresh install. It installs a c++ compiler, zsh, oh-my-zsh and some vim plugins. 

###### copyForCommit.sh
This script copies the config files from home dir to  the repository working dir.

##### Microsoft.PowerShell_profile.ps1
powershell settings and binds

### 2. Snippets
Various Snippets that are handy when working on some small local stuff.

###### Makefile
 Simple makefile that compiles and links \*.cpp files in two steps to separate executables.
 
