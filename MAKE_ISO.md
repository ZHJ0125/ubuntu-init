# HOW TO SETUP CUSTOM ISO

> My own custom ISO: [Ubuntu-18.04.6-desktop-amd64-LTS-ZHJ0125_V0.1_build06](https://www.aliyundrive.com/s/9bu1JH4oNCw)  ( Remove the `.txt` suffix )

## 0. Install Cubic

```sh
[IN host terminal]
zhj@thinkpad-vmware:~$ sudo apt-add-repository ppa:cubic-wizard/release
zhj@thinkpad-vmware:~$ sudo apt-get update
zhj@thinkpad-vmware:~$ sudo apt-get install cubic
```

---

> then, open Cubic

[IN Cubic]: When You have entered the Cubic virtual environment.

## 1. Add sudoer user - zhj (or others you want)

```bash
You have entered the virtual environment.
root@cubic:~# sudo adduser zhj
Adding user `zhj' ...
Adding new group `zhj' (1000) ...
Adding new user `zhj' (1000) with group `zhj' ...
Creating home directory `/home/zhj' ...
Copying files from `/etc/skel' ...
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully
Changing the user information for zhj
Enter the new value, or press ENTER for the default
	Full Name []: ZHJ0125
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n]
root@cubic:~# usermod -aG sudo zhj
root@cubic:~# groups zhj
zhj : zhj sudo
```

## 2. change user to zhj & edit script

```sh
root@cubic:~# su zhj
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.
zhj@cubic:/root$ cd 
zhj@cubic:~$ nano main.sh
```

## 3. Copy [source code](./main.sh) to local main.sh file

## 4. Run main.sh

```sh
zhj@cubic:~$ bash main.sh
```

> Don't forget to remove installation package

## 5. Chooes kernel

! Must choose a lower version kernel, otherwise it will not be able to boot !

* [ √ ] Kernel version 5.4.0-84
* [ X ] Kernel version 5.4.0-91

## Reference

* 如何在Ubuntu中使用户成为管理员 - [https://ubuntuqa.com/article/10086.html](https://ubuntuqa.com/article/10086.html)
* 新手教程：Ubuntu 下如何修改用户密码 - [https://linux.cn/article-10580-1.html](https://linux.cn/article-10580-1.html)
* ubuntu 添加管理员账号 - [https://blog.csdn.net/codebistu/article/details/8200908](https://blog.csdn.net/codebistu/article/details/8200908)

_End of file_
