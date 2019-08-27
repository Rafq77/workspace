#!/bin/bash

# First, change to directory where the script is located
# from https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

PTH=$(pwd)
echo "Working in: $PTH"

# copy the vim settings
rsync ~/.vimrc . -v

# copy the tmux settings
rsync ~/.tmux.conf . -v

# copy the zsh settings (powerline initer)
rsync ~/.zshrc . -v

# copy the profiles.json of WSL # TODO adjust path!
#WSL_PATH=/mnt/c/Users/<..>/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/RoamingState/
if [[ -z $WSL_PATH ]]; then 
    echo "WSL_PATH not set, ommiting WSL profiles.json"
else 
    echo "Copying WSL profiles settings"
    echo $WSL_PATH
    rsync $WSL_PATH/profiles.json . -v
    rsync $WSL_PATH/*.ico . -v
fi
