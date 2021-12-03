#!/bin/bash

#---------------------------------------------------------------
# Function: Install initialization software for Ubuntu 18.04
# Author  : ZHJ0125
# Version : V0.1_2021-11-30
# Source  : https://gitee.com/zhj0125/ubuntu-init
#---------------------------------------------------------------

SoftDir="/home/$USER/Downloads/Software"

# 0. Info
function print_info {
    echo -e "\n\n    ################################################################"
    echo "    #                                                              #"
    echo "    #              WELCOME TO RUN THIS SHELL SCRIPT                #"
    echo "    # ------------------------------------------------------------ #"
    echo "    #   Used to install initialization software for Ubuntu 18.04   #"
    echo "    #   List of installed software:                                #"
    echo "    #   - apt sources.list -> Tsinghua Sources                     #"
    echo "    #   - Install Tools -> wget & curl & net-tools & tree          #"
    echo "    #   - Install Git & VIM with my config file                    #"
    echo "    #   - Install Chrome & VSCode, put its icon on Desktop         #"
    echo "    #   - Install SougouPinyin & VLC                               #"
    echo "    #   For more: https://gitee.com/zhj0125/ubuntu-init            #"
    echo "    #                                          ZHJ0125_2021.11.30  #"
    echo -e "    ################################################################\n\n"
    read -s -n1 -p $'Press any key to continue or CTRL+C to stop ...\n\n'
}

# 1. root (Deprecated)
function rootness {
    echo -e "\nStart to detect script permissions ..."
    if [[ $EUID -ne 0 ]]
    then
	echo "Error : This script must be run as root!" 1>&2
        exit 1
    fi
    echo -e "Permissions : OK\n"
}

# 2. apt-get
function apt_conf {
    echo -e "\nStart to update software source ..."
    sudo apt-get clean
    sudo apt-get -y update
    # Please comment out upgrade when making custom ISO image
    sudo apt-get -y upgrade
    sudo apt-get -y dist-upgrade
    echo -e "System update : OK\n"
}

# 3. mkdir
function mkdir_conf {
    echo -e "\nStart to build Software package directory ..."
    if [ ! -d "$SoftDir" ]; then mkdir -p $SoftDir; fi
    if [ ! -f ~/Desktop ]; then mkdir ~/Desktop; fi
    echo "$SoftDir had been build."
    echo -e "Directory build : OK\n"
}

# 4. tools - wget & curl & net-tools & tree
function tools_install {
    echo -e "\nStart to install wget and curl ..."
    sudo apt-get -y install wget
    sudo apt-get -y install curl
    sudo apt-get -y install net-tools
    sudo apt-get -y install tree
    echo -e "wget & curl & net-tools & tree: OK\n"
}

# 5. source_list
function source_list {
    echo -e "\nStart to change software source ..."
    sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
    sudo wget -O /etc/apt/sources.list https://gitee.com/zhj0125/ubuntu-init/raw/master/Config/.sources_list
    sudo apt-get -y update
    sudo apt-get -y autoremove
    echo -e "Software source : OK\n"
}

# 6. Git
function git_install {
    echo -e "\nStart to install git ..."
    sudo apt-get -y install git
    # Download .gitconfig to user home
    sudo wget -O /home/$USER/.gitconfig https://gitee.com/zhj0125/ubuntu-init/raw/master/Config/.gitconfig
    echo -e "Git install : OK\n"
}

# 7. VIM
function vim_install {
    echo -e "\nStart to install vim ..."
    sudo apt-get -y install vim
    sudo wget -O /home/$USER/.vimrc https://gitee.com/zhj0125/ubuntu-init/raw/master/Config/.vimrc
    echo -e "VIM install : OK\n"
}

# 8. Chrome
function chrome_install {
    echo -e "\nStart to install Chrome ..."
    if [ -z "`dpkg -l | grep chrome`" ]; then
        echo "Start to pulling Chrome package ..."
        if [ ! -f "./Software/google-chrome-stable_current_amd64.deb" ];then
            wget -O $SoftDir/chrome-amd64.deb https://gitee.com/zhj0125/ubuntu-init/attach_files/895589/download/google-chrome-stable_current_amd64.deb
        else
            cp ./Software/google-chrome-stable_current_amd64.deb $SoftDir/chrome-amd64.deb
        fi
        sudo dpkg -i $SoftDir/chrome-amd64.deb
    fi
    echo -e "Chrome has been installed.\n"
    # Add icon to Desktop
    sudo cp /usr/share/applications/google-chrome.desktop ~/Desktop/Chrome.desktop
    sudo chown $USER ~/Desktop/Chrome.desktop && sudo chgrp $USER ~/Desktop/Chrome.desktop && sudo chmod +x ~/Desktop/Chrome.desktop
}

# 9. VSCode
function vscode_install {
    echo -e "\nStart to install VSCode ..."
    if [ -z "`dpkg -l | grep 'Code editing'`" ]; then
        echo "Start to pulling VSCode package ..."
        if [ ! -f "./Software/code_1.62.3-1637137107_amd64.deb" ];then
            wget -O $SoftDir/vscode-amd64.deb https://gitee.com/zhj0125/ubuntu-init/attach_files/895586/download/code_1.62.3-1637137107_amd64.deb
        else
            cp ./Software/code_1.62.3-1637137107_amd64.deb $SoftDir/vscode-amd64.deb
        fi
        sudo dpkg -i $SoftDir/vscode-amd64.deb
    fi
    # Add icon to Desktop
    sudo cp /usr/share/applications/code.desktop ~/Desktop/VSCode.desktop
    sudo chown $USER ~/Desktop/VSCode.desktop && sudo chgrp $USER ~/Desktop/VSCode.desktop && sudo chmod +x ~/Desktop/VSCode.desktop
    echo -e "VSCode has been installed.\n"
}

# 10. Sougou_Pinyin
function sougou_install {
    echo -e "\nStart to install Sougou Pinyin ..."
    if [ -z "`dpkg -l | grep sogoupinyin`" ]; then
        sudo apt-get -y install fcitx
        sudo apt-get install -f
        sudo apt-get -y --fix-broken install
        sudo apt-get -y install fcitx  # Try again, prevents uninstalled
        echo "Start to pulling Sougou package ..."
        if [ ! -f "./Software/sogoupinyin_2.4.0.3469_amd64.deb" ];then
            wget -O $SoftDir/sougou-amd64.deb https://gitee.com/zhj0125/ubuntu-init/attach_files/895587/download/sogoupinyin_2.4.0.3469_amd64.deb
        else
            cp ./Software/sogoupinyin_2.4.0.3469_amd64.deb $SoftDir/sougou-amd64.deb
        fi
        sudo dpkg -i $SoftDir/sougou-amd64.deb
    fi
    sudo apt-get -y --fix-broken install
    echo "Sougou_Pinyin has been installed."
}

# 11. VLC
function vlc_install {
    sudo apt-get -y install vlc
    # Add icon to Desktop
    sudo cp /usr/share/applications/vlc.desktop ~/Desktop/vlc.desktop
    sudo chown $USER ~/Desktop/vlc.desktop && sudo chgrp $USER ~/Desktop/vlc.desktop && sudo chmod +x ~/Desktop/vlc.desktop
}

#---------------------------------------------
# Start Run:
# rootness -> Deprecated

print_info
apt_conf
mkdir_conf
tools_install
source_list
git_install
vim_install
chrome_install
vscode_install
sougou_install
vlc_install
apt_conf  # Update again

echo -e "Task finish!\n"
echo "You can run this command to remove installation package:"
echo "     sudo rm -r /home/$USER/Downloads/Software/"
echo -e "\nBye!\n\n"
#---------------------------------------------
