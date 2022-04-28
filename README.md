# Ubuntu-Init

## 介绍

> Ubuntu 装机初始化-软件安装脚本

每次安装完Ubuntu虚拟机后，我都会卸载掉无用的软件，再手动安装开发工具、配置常用软件，就很麻烦。

这个仓库中的脚本就是用来自动化地完成上述工作，帮助您初始化一个干净的开发环境。

目前仅支持 Ubuntu 18.04 版本，其他版本需要修改代码。

## 脚本所做的工作

* 更换清华软件源
* 安装 wget、curl、net-tools、tree
* 安装并配置 Git、Vim、VSCode
* 安装 Chrome、VLC
* 安装搜狗拼音输入法
* 安装 CascadiaCode 字体并配置 gnome-terminal 主题

## 使用说明

### 方式一：从镜像开始完整地运行

1. 下载 [Ubuntu 18.04](https://mirrors4.tuna.tsinghua.edu.cn/ubuntu-releases/18.04.6/ubuntu-18.04.6-desktop-amd64.iso) 镜像
2. 镜像安装时，建议选择**最小化安装**
3. 镜像安装完成后执行以下操作（注意:请在普通用户状态下执行以下脚本，不要切换至root用户）：
    * 方式一（推荐）：直接执行 `wget https://gitee.com/zhj0125/ubuntu-init/raw/master/main.sh && bash main.sh`
    * 方式二：克隆本项目，执行本项目中的`main.sh`文件（本项目中已包含所需软件的安装包）
4. [ 可选项 ]：可以用命令 `sudo rm -r /home/$USER/Downloads/Software/` 删除安装包目录

### 方式二：从当前状态运行脚本

可以从您当前虚拟机环境下运行 `main.sh` 脚本。

需要注意的是，脚本会覆盖您 `Git`、`Vim`和`VSCode`已有的配置。可以通过修改脚本第190至202行的代码以动态选择脚本需要执行哪些操作。

## 创建ISO镜像

可根据本项目创建个性化的 Ubuntu ISO 镜像，请看 [MAKE_ISO.md](./MAKE_ISO.md)

自定义镜像信息：
* 版本说明: V0.1_build06
* 下载链接: [Ubuntu-18.04.6-desktop-amd64-LTS-ZHJ0125_V0.1_build06](https://www.aliyundrive.com/s/9bu1JH4oNCw)  ( 需要去掉`.txt`后缀 )
* 用户说明：用户名为 `zhj` 密码为 `12345`
