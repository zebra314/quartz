---
title: KDE setup
---
[[software]]

## SDDM

```sh
sudo pacman -S sddm
sudo systemctl enable sddm
````

## KDE

```sh
sudo pacman -S plasma ark dolphin spectacle partitionmanager
```
## IME

```sh
sudo pacman -S fcitx5-chewing fcitx5-configtool fcitx5-gtk fcitx5-material-color  fcitx5-qt
```

## App launcher

```sh
sudo pacman -S rofi
mkdir -p ~/.config/rofi/
rofi -dump-xresources > ~/.config/rofi/config
```

## Fonts

```sh
sudo pacman -S ttf-firacode-nerd ttf-fira-code
```
## Zsh

[zsh setup](https://medium.com/tech-notes-and-geek-stuff/install-zsh-on-arch-linux-manjaro-and-make-it-your-default-shell-b0098b756a7a)

```sh
sudo pacman -S zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
	yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

## Nvidia driver

- [Arch Linux NVIDIA drivers installation guide](https://github.com/korvahannu/arch-nvidia-drivers-installation-guide?tab=readme-ov-file#arch-linux-nvidia-drivers-installation-guide)

```sh
sudo pacman -S nvidia nvidia nvidia-lts
yay -S nvidia-settings
```

## Obsidian and Quartz

```sh
sudo pacman -S obsidian nodejs npm
npm i yargs 
```

## Vscode 

```sh
yay -S visual-studio-code-bin
```

## Neovim

```sh
sudo pacman -S neovim
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```

## TMUX


[tmux plugin manager](https://github.com/tmux-plugins/tpm)
[tmux catppuccin theme](https://github.com/catppuccin/tmux)

```sh
sudo pacman -S tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## ROS env

```sh
yay -S miniconda3
sudo ln -s /opt/miniconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh
sudo chown -R $USER /opt/miniconda3
conda config --set auto_activate_base false
```