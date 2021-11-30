# Ubuntu-Init

## 介绍

> Ubuntu 常用软件安装脚本

* 支持的软件版本：Ubuntu 18.04

## 脚本所作的配置项

* 安装 wget 和 curl 下载工具
* 更换清华软件源
* 安装并配置 Git
* 安装并配置 VIM
* 安装 Chrome
* 安装 VSCode
* 安装搜狗拼音输入法

## 使用说明

1. 下载 [Ubuntu 18.04](https://mirrors4.tuna.tsinghua.edu.cn/ubuntu-releases/18.04.6/ubuntu-18.04.6-desktop-amd64.iso) 镜像
2. 安装时，建议选择最小化安装
3. 安装完成后
    * 注意：请修改test.sh文件第5行的用户名 `user="zhj"`
    * 方式一：复制 [test.sh](./test.sh) 文件内容，并使用 root 权限运行该脚本（此方式需要下载安装包）
    * 方式二：克隆本项目，执行本项目中的 test.sh 文件（本项目中已包含所需软件的安装包）
4. [可选项]：删除安装包目录，可以用命令 `sudo rm -r /home/$USER/Downloads/Software/`
