# HOW TO SETUP ISO

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

```sh
You have entered the virtual environment.
root@cubic:~# useradd -s /bin/bash -mr zhj
root@cubic:~# usermod -aG sudo zhj
root@cubic:~# groups zhj
zhj : zhj sudo
root@cubic:~# passwd zhj
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully
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

## TODO

* IN new ISO, Language Support -> Apply System-Wide, why show `Administrator` instead of $USER or root:
```sh
[IN new ISO]
Authentication Required
system policy prevented setting default language
Administrator

[IN Cubic]
zhj@cubic:~$ sudo passwd Administrator
[sudo] password for zhj: 
passwd: user 'Administrator' does not exist
```

## Reference

* 如何在Ubuntu中使用户成为管理员 - [https://ubuntuqa.com/article/10086.html](https://ubuntuqa.com/article/10086.html)
* 新手教程：Ubuntu 下如何修改用户密码 - [https://linux.cn/article-10580-1.html](https://linux.cn/article-10580-1.html)
* ubuntu 添加管理员账号 - [https://blog.csdn.net/codebistu/article/details/8200908](https://blog.csdn.net/codebistu/article/details/8200908)

_End of file_
