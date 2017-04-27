#!/bin/bash
####################
##    vim setup   ##
####################

# check to see if vim folder exists
if [ ! -d "$~/.vim" ]; then
    mkdir "~/.vim"  
fi

# back up old vimrc
if [ -f "$~/.vimrc" ]; then
    mv ~/.vimrc ~/.vimrc_old
fi

# move new vim files to home 
mv vim/.vimrc ~/
mv vim/* ~/.vim/


####################
##    tmux setup  ##
####################

# check if tmux conf file exists
if [ -f "$~/.tmux.conf" ]; then
    mv ~/.tmux.conf ~/.tmux.conf_old
fi

# move new tmux.conf file to home
mv tmux/.tmux.conf ~/.tmux.conf
