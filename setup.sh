#!/bin/bash

# Title: Set-up Linux Environment

  # Checks to see if tmux and vim are installed, and moves creates new .tmux,
  # .vim and .basrc files for a programming environment on Linux

main(){

# check if proper packages are installed 
check_install vim
check_install tmux
check_install build-essential
check_install lynx


# copy 
cp_backup config/.vimrc ~/
cp_backup config/.tmux.conf ~/
cp_backup config/.bashrc ~/


# move new vim files to home 
# mv vim/.vimrc ~/
# mv vim/* ~/.vim/

# ####################
# ##    tux setup  ##
# ####################

# # check if tmux conf file exists
# mv ~/.tmux.conf ~/.tmux.conf_old

# # move new tmux.conf file to home
# mv tmux/.tmux.conf ~/.tmux.conf
# mkdir ~/.tmux
# mv tmux/* ~/.tmux

}
function check_install() {
    typeset ans
    if (($(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed")==0))
    then 
        echo "The program "$1" is not installed. Would you like to install it? (Y/n)"
        if [[ $(validate_Y_n) ]]
        then
            sudo apt install $1
        else
            echo $1 must be intalled for proper functionality 
        fi
    fi
}

function validate_Y_n() {
    typeset ans
    typeset valid=0
    while (( $valid==0 ))       
    do
        read ans
        case $ans in            
        yes|Yes|Y|y|"" ) echo TRUE 
                         valid=1 ;; 
                      
        [nN][oO]|n|N   ) 
                         valid=1 ;;
                      
         *             ) echo "Answer (Y/n)" ;;     
        esac                    
    done
}

function cp_backup() {
    typeset file=$1
    typeset new_location=$2
    # check if duplicate file
    if [[ $(find $new_location -maxdepth 1 \
        -iname $(basename $file) 2>/dev/null) ]]
    then
        # do not write over oldest version
        typeset past_version=$new_location$(basename $file)"_"$(date_tag)
        if [[ $(find $new_location -maxdepth 1 \
                -iname $past_version 2>/dev/null) ]]
        then :
        else 
            # make a backup of the old version 
            typeset path=${new_location}/$(basename $file) 
            mv $path $past_version
        fi
    fi
    # copy file to desired location
    cp -r $file $new_location
}

function date_tag() {
    typeset DAY=$(date -d "$D" '+%d')
    typeset MONTH=$(date -d "$D" '+%m')
    typeset YEAR=$(date -d "$D" '+%y') 
    echo $YEAR$MONTH$DAY
}

main "$@"
