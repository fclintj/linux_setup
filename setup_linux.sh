#!/bin/bash
####################
##    vim setup   ##
####################

# ensure propper installed packages
sudo apt install vim
sudo apt install tmux


# check to see if vim folder exists
mkdir ~/.vim  

# back up old vimrc
mv ~/.vimrc ~/.vimrc_old

# move new vim files to home 
mv vim/.vimrc ~/
mv vim/* ~/.vim/

####################
##    tmux setup  ##
####################

# check if tmux conf file exists
mv ~/.tmux.conf ~/.tmux.conf_old

# move new tmux.conf file to home
mv tmux/.tmux.conf ~/.tmux.conf
