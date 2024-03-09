---
title: Endeavour Setup
---
[[catalog/learning/software|software]]

## Chezmoi

- Use to manage the configuration files.

- [chezmoi official](https://www.chezmoi.io/)

- [My dotfiles repo](https://github.com/zebra314/dotfiles)

- Commands

```bash
# To install on new machine
# Replace $GITHUB_USERNAME with yours
chezmoi init --apply --verbose https://github.com/$GITHUB_USERNAME/dotfiles.git

# To backup local machine
# Basic commands

chezmoi add $File # Add the file from home to source directory

chezmoi edit $File # Edit the source file

chezmoi cd # cd /home/$USR/.local/share/chezmoi

chezmoi -v apply # Apply the changes to home

chezmoi diff # show the difference between home and source

chezmoi re-add $File # Re-add the file to source directory
```

## Windows 11 VM

- [[windows vm]]

## Virtual Machine GPU passthrough

- [Tutorial - GPU passthrough - 1](https://ivonblog.com/posts/archlinux-gpu-passthrough/?utm_source=pocket_saves)

- [Tutorial - GPU passthrough - 2](https://www.youtube.com/watch?v=uOuzFd8Gd2o&t=663s)

- [Tutorial - GPU passthrough - 3](https://ivonblog.com/posts/qemu-kvm-vfio-gaming/)

- [Tutorial - Toggle GPU](https://ivonblog.com/posts/linux-envycontrol-turn-off-nvidia-gpu/)

- [Tutorial - Toggle GPU using prime](https://ivonblog.com/posts/linux-nvidia-prime/)

## Setup cursor theme

- Install nwg-look

```bash
paru -S bibata-cursor-theme-bin # (recommended)
```

## IME

- Install fctix5

## Pacman

list foreign pkgs (AUR), which  are installed by makepkg command

```bash
pacman -Qme
```

remove pkgs and the dependencies that are not used by other pkgs

```bash
pacman -Rns _package_name_
```

## Miniconda

- In Endeavour, this will be installed in /opt/, which is very weird

- To use mamba and conda commands, need to use sudo...

## Firewall

- [Iptables wiki](https://wiki.archlinuxcn.org/zh/Iptables)

- To open the port to enable the service such as rosboard

```bash
systemctl enable iptables.service
```

## Applauncher

rofi

## Solve Bluetooth keyboard paired but do not type on keypress

```bash
lsusb
modprobe btusb

bluetoothctl
disconnect

scan on
pairable on
# Find the ID of the bluetooth keyboard

pair #ID 
trust #ID 
connect #ID 

quit
```

## Grub theme

- To change the grub theme

```bash
git clone https://github.com/Lxtharia/minegrub-theme.git

cd ./minegrub-theme
sudo cp -ruv ./minegrub /boot/grub/themes/

sudo nano /etc/default/grub

# Change or add the following line
GRUB_THEME=/boot/grub/themes/minegrub/theme.txt

# Exit and update grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

- [Minegrub theme](https://github.com/Lxtharia/minegrub-theme)

## Flathub

```sh
sudo pacman -S flatpak
flatpak install flathub com.brave.Browser
flatpak install flathub com.discordapp.Discord
```

## Disable kde wallet

1. go to brave://flags
2. search for flag `Enable Brave Wallet`
3. change the value to disable
4. 
```sh
cd .config/ && vim kwalletrc
```
5. add the following content
```sh
[Wallet]
Enabled=false
```