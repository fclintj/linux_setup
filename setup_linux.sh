#!/bin/bash

# Title: Set-up Linux Environment

  # Checks to see if tmux and vim are installed, and moves creates new .tmux,
  # .vim and .basrc files for a programming environment on Linux

main(){
# check_install lynx 
# check_install w3a 

cp_make_old .vim ~/

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
    if [[ ! $(command -v $1) ]]
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

function cp_make_old() {
    typeset file=$1
    typeset new_location=$2
    if [[ $(find $new_location -maxdepth 1 -iname $file) ]]
    then
        typeset past_version=$new_location$file"_"$(date_tag)
        echo  $past_version
        if [[ $(find $new_location -maxdepth 1 -iname $past_version) ]]
        then :
        else mv $new_location"/"$file past_version

        fi
    fi
}

function date_tag() {
    typeset DAY=$(date -d "$D" '+%d')
    typeset MONTH=$(date -d "$D" '+%m')
    typeset YEAR=$(date -d "$D" '+%y') 
    echo $YEAR$MONTH$DAY
}

main "$@"
