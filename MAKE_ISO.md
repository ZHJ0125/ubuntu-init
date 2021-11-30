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

[IN Cubic]: When You have entered the virtual environment.

## 1. Add user - zhj (or others you want)

```sh
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
```

## 2. Add sudoer to zhj

```sh
root@cubic:~# sudo nano /etc/sudoers

[IN /etc/sudoers]
# User privilege specification
root    ALL=(ALL:ALL) ALL
zhj     ALL=(ALL:ALL) ALL     <-----  add
```
## 3. change user to zhj

```sh
root@cubic:~# su zhj
zhj@cubic:/root$ cd
zhj@cubic:~$ nano main.sh
```

## 4. Copy [source code](./main.sh) to local main.sh file

## 5. Run main.sh

```sh
zhj@cubic:~$ bash main.sh
```

_End of file_
