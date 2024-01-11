[chezmoi](https://www.chezmoi.io/)

Manage the dotfiles

```bash
# To install on new machine
# Replace $GITHUB_USERNAME with yours
chezmoi init --apply --verbose https://github.com/$GITHUB_USERNAME/dotfiles.git
```

```bash
# To backup local machine
# Basic commands

chezmoi add $File # Add the file from home to source directory

chezmoi edit $File # Edit the source file

chezmoi cd # cd /home/$USR/.local/share/chezmoi

chezmoi -v apply # Apply the changes to home
```

## Virtual Machine and QEMU/KVM
https://www.makeuseof.com/how-to-install-arch-linux-kvm-configure-virtual-machine/

[win 11 iso](https://www.microsoft.com/zh-tw/software-download/windows11)

## Setup cursor theme
nwg-look
install 
```bash
paru -S bibata-cursor-theme-bin # (recommended)
```

## IME
install fctix5

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
on arch this will be stored in /opt/... weird
to install mamba, need to use sudo...
