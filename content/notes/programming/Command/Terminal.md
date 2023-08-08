---
tags: programming, command
---
# LOL
[教學](https://www.youtube.com/watch?v=h4pKERVS-Iw)
1. wine
2. lutris
	1. 如果說找不到正確的wine 去github找 然後放到 .local/share/lutris/runner/wine 裡面
# Open gui from terminal
```
xdg-open .
```
# Switch the version of java
```
update-alternatives --config java
```
# Nvidia Driver
- [Nvidia專有驅動(driver)](https://ivonblog.com/posts/ubuntu-install-nvidia-drivers/#contents:1-%E5%AE%89%E8%A3%9Dnvidia%E5%B0%88%E6%9C%89%E9%A9%85%E5%8B%95)
# Docker 
- 顯示本機已有的映像檔顯示本機已有的映像檔
> docker image ls

- 顯示正在運行的container
> docker ps
# husky
- ncrl_lio 光答
- velodyne 差見
- husky error 路徑規劃
裝imu和lidar
- 看rqt_graph 有沒有發velodyne_points 這個topic
- 確認光答插件有在模擬環境中開啟
- [安裝指南](https://hackmd.io/iOtCxeZtSSqi2rCyHt2dyg?view)
## 採坑
- ceres和eigen版本對不上
- 報錯
```bash
/home/alfonso/Git_workspace/ceres-solver/internal/ceres/gtest/gtest.h:10445:35: error: variable or field ‘it’ declared void
10445 |   for (typename C::const_iterator it = container.begin();
      | 
```
- 解決方法 eigen降版本 [參考解法](https://blog.csdn.net/SoftwarerRJY/article/details/113354759)
# Conda
- ros2 enviroment
> conda activate ros2_env

- ros1 enviroment
> conda activate ros1_env

> conda install pip 
> 這樣之後用pip裝的東西才會是在虛擬環境中
> which -a pip 
> 應該要輸出miniconda/path/to/env
# USB Webcamera
> v4l2-ctl --list-devices
> cheese -d /dev/video...

# Run application
> obsidian
> ./QGroundControl.AppImage
> sudo ./cleanup.sh
> matlab

# Adjust the brightness of the second monitor
> sudo ddcutil --display 1 setvcp 10 0

# SSH
## 解決 SSH 的 Host key verification failed
> rm -f /home/username/.ssh/known_hosts
	
# Tmux

- Ctrl+b 再輸入 % 垂直分割視窗。
- Ctrl+b 再輸入 " 水平分割視窗。
- Ctrl+b 再輸入 o 以輪流方式輪流切換 pane。
- Ctrl+b 再輸入 方向鍵 切換至指定方向的 pane。
- Ctrl+b 再輸入 空白鍵 切換佈局。
- Ctrl+b 再輸入 ! 將目前的 pane 抽出來，獨立建立一個 window 視窗。
- Ctrl+b 再輸入 x 關閉目前的 pane。

# Clean up redundant packages
> sudo apt autoremove
> sudo apt autoclean

# Copy to dir
> cp *file name* *dir*￼# Taskline (to manage tasks in terminal)
​￼1.  board view
	> tl
​￼2.  timeline view
	> tl -i
​￼3.  create task
	> tl t
​￼4.  create note
	> tl n
​￼5.  create board
	> -b *board names*
	> Ex. tl t "Update contributing guidelines" -b coding,docs
​￼6.  list items
	> tl l *board name*
​￼7.  set duedate
	> tl t "*task name*" -b *board name* -d *dd.mm.yyyy HH:MM*
	> tl due *item ID* "*dd.mm.yyyy HH:MM"
	> *today* *tonight* *tomorrow* *next monday*
​￼8.  set priority
	> -p *1 or 2 or 3*
	>  1 - Normal priority
	> 2- Medium priority
	> 3 - High priority
	> (before task created -p)
	> (after created p)
​￼9. begin task
	> tl b *ID1*, *ID2*,.....
​￼10.  check task
	> tl c *ID*
​￼11. star
	> tl s *ID*
​￼12.  find items
	> tl f *item name*
​￼13. display archive
	> tl a
​￼14.  cancel
	> tl cancel
​￼15.  delete
	> tl d *ID*
​￼16.  delete checked tasks
	> tl clear

# Memory
- Clean up packages
	> sudo apt autoremove
	> sudo apt autoclean
- RAM in real time
	> watch -n 1 free -m
- Release cached pages, inodes, and directory entries
	> sudo sync
	> sudo sysctl -w vm.drop_caches=3
- Remove the old logs
	> sudo journalctl --vacuum-``time``=2d;

# Generic
- 查看有安裝的版本
	> dpkg --get-selections | grep linux-image

- 移除deinstall
	> sudo dpkg -P linux-image-x.xxx.xx-generic

# Cool effects
> cmatrix
> hollywood (電腦會燒)

