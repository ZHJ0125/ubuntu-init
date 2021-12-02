# Ubuntu-Init

## 介绍

> Ubuntu 装机初始化-软件安装脚本

* 支持的软件版本：Ubuntu 18.04

## 脚本所作的配置项

* 更换清华软件源
* 安装 wget / curl / net-tools / tree
* 安装并配置 Git / VIM / VSCode
* 安装 Chrome / VLC
* 安装搜狗拼音输入法

## 使用说明

1. 下载 [Ubuntu 18.04](https://mirrors4.tuna.tsinghua.edu.cn/ubuntu-releases/18.04.6/ubuntu-18.04.6-desktop-amd64.iso) 镜像
2. 安装时，建议选择**最小化安装**
3. 安装完成后
    * 注意：请在普通用户状态下执行以下脚本，不要切换至root用户
    * 方式一：复制 [main.sh](./main.sh) 文件内容，直接运行该脚本 `bash main.sh` （此方式需要下载安装包）
    * 方式二：克隆本项目，执行本项目中的 main.sh 文件（本项目中已包含所需软件的安装包）
4. [ 可选项 ]：可以用命令 `sudo rm -r /home/$USER/Downloads/Software/` 删除安装包目录

## 创建ISO镜像

可根据本项目创建个性化的 Ubuntu ISO 镜像，请看 [MAKE_ISO.md](./MAKE_ISO.md)

我制作的自定义镜像：
* 版本号: V0.1_build05
* 下载链接: [Ubuntu-18.04.6-desktop-amd64-LTS-ZHJ0125_V0.1_build05](https://www.aliyundrive.com/s/DPaMJNS4aTt)  ( 需要去掉`.txt`后缀 )
* 说明：用户名为 `zhj`