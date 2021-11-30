#!/bin/bash

#dir=`pwd`
#git_name="ZHJ0125"
#git_email="shandonghoujin@163.com"
user="zhj"
SoftDir="/home/$user/Downloads/Software"

# 1. 脚本需要sudo来执行，所以需要判断是否具有root权限：
function rootness {
    echo -e "\nStart to detect script permissions ..."
    if [[ $EUID -ne 0 ]]
    then
	echo "Error : This script must be run as root!" 1>&2
        exit 1
    fi
    echo -e "Permissions : OK\n"
}

# 2. mkdir
function mkdir_conf {
    echo -e "\nStart to build Software package directory ..."
    if [ ! -d "$SoftDir" ];then
        mkdir -p $SoftDir
        chown -R $user $SoftDir
        chgrp -R $user $SoftDir
    fi
    echo "$SoftDir had been build."
    echo -e "Directory build : OK\n"
}

# 3. apt-get
function apt_conf {
    echo -e "\nStart to update software source ..."
    apt-get clean
    apt-get -y update
    apt-get -y upgrade
    echo -e "System update : OK\n"
}

# 4. wget
function wget_install {
    echo -e "\nStart to install wget and curl ..."
    apt-get -y install wget
    apt-get -y install curl
    echo -e "wget & curl : OK\n"
}

# 5. source_list
function source_list {
    echo -e "\nStart to change software source ..."
    cp /etc/apt/sources.list /etc/apt/sources.list_backup
    wget -O /etc/apt/sources.list https://gitee.com/zhj0125/ubuntu-init/raw/master/sources.list
    apt-get -y update
    echo -e "Software source : OK\n"
}

# 6. Git
function git_install {
    echo -e "\nStart to install git ..."
    apt-get -y install git
    # Download .gitconfig to user home
    wget -O /home/$user/.gitconfig https://gitee.com/zhj0125/ubuntu-init/raw/master/.gitconfig
    # echo "\[user\]" >> ~/.gitconfig
    # echo "name = $git_name" >> ~/.gitconfig
    # echo "email = $git_email" >> ~/.gitconfig
    echo -e "Git install : OK\n"
}

# 7. VIM
function vim_install {
    echo -e "\nStart to install vim ..."
    apt-get -y install vim
    wget -O /home/$user/.vimrc https://gitee.com/zhj0125/ubuntu-init/raw/master/.vimrc
    echo -e "VIM install : OK\n"
}

# 8. Chrome
function chrome_install {
    echo -e "\nStart to install Chrome ..."
    if [ -z "`dpkg -l | grep chrome`" ]; then
        echo "Start to pulling Chrome package ..."
        if [ ! -f "./Software/google-chrome-stable_current_amd64.deb" ];then
            wget -O $SoftDir/chrome-amd64.deb https://gitee.com/zhj0125/ubuntu-init/attach_files/895315/download/google-chrome-stable_current_amd64.deb
        else
            cp ./Software/google-chrome-stable_current_amd64.deb $SoftDir/chrome-amd64.deb
        fi
        dpkg -i $SoftDir/chrome-amd64.deb
    fi
    echo -e "Chrome has been installed.\n"
    # echo "export BROWSER=/usr/bin/google-chrome" >> /home/$user/.bashrc
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
        dpkg -i $SoftDir/vscode-amd64.deb
    fi
    echo "VSCode has been installed."
}

# 10. Sougou_Pinyin
function sougou_install {
    echo -e "\nStart to install Sougou Pinyin ..."
    if [ -z "`dpkg -l | grep sogoupinyin`" ]; then
        apt-get -y install fcitx
        apt-get install -f
        apt-get -y --fix-broken install
        echo "Start to pulling Sougou package ..."
        if [ ! -f "./Software/sogoupinyin_2.4.0.3469_amd64.deb" ];then
            wget -O $SoftDir/sougou-amd64.deb https://gitee.com/zhj0125/ubuntu-init/attach_files/895587/download/sogoupinyin_2.4.0.3469_amd64.deb
        else
            cp ./Software/sogoupinyin_2.4.0.3469_amd64.deb $SoftDir/sougou-amd64.deb
        fi
        dpkg -i $SoftDir/sougou-amd64.deb
    fi
    echo "Sougou_Pinyin has been installed."
}



rootness
mkdir_conf
apt_conf
wget_install
source_list
git_install
vim_install
chrome_install
vscode_install
sougou_install


