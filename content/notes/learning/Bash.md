---
title: Bash
enableToc: true
---
[[index/learning/command|command]]

## Open file gui from terminal
```bash
xdg-open .
```

## Switch the version of java
```bash
update-alternatives --config java
```

## husky
- ncrl_lio 光答
- velodyne 差見
- husky error 路徑規劃
裝imu和lidar
- 看rqt_graph 有沒有發velodyne_points 這個topic
- 確認光答插件有在模擬環境中開啟
- [安裝指南](https://hackmd.io/iOtCxeZtSSqi2rCyHt2dyg?view)
## 
- ceres和eigen版本對不上
```bash
/home/alfonso/Git_workspace/ceres-solver/internal/ceres/gtest/gtest.h:10445:35: error: variable or field ‘it’ declared void
10445 |   for (typename C::const_iterator it = container.begin();
      | 
```
- 解決方法 eigen降版本 [參考解法](https://blog.csdn.net/SoftwarerRJY/article/details/113354759)

## Robostack
- ros2 enviroment
> conda activate ros2_env

- ros1 enviroment
> conda activate ros1_env

> conda install pip 
> 這樣之後用pip裝的東西才會是在虛擬環境中
> which -a pip 
> 應該要輸出miniconda/path/to/env


## Webcamera
> v4l2-ctl --list-devices
> cheese -d /dev/video...

## Adjust the brightness of the second monitor
```bash
sudo ddcutil --display 1 setvcp 10 0
```

## SSH
- Error : 
	> Host key verification failed
	- Solution :
		```bash
		rm -f /home/username/.ssh/known_hosts
		```

## Tmux
- Ctrl+b 再輸入 % 垂直分割視窗。
- Ctrl+b 再輸入 " 水平分割視窗。
- Ctrl+b 再輸入 o 以輪流方式輪流切換 pane。
- Ctrl+b 再輸入 方向鍵 切換至指定方向的 pane。
- Ctrl+b 再輸入 空白鍵 切換佈局。
- Ctrl+b 再輸入 ! 將目前的 pane 抽出來，獨立建立一個 window 視窗。
- Ctrl+b 再輸入 x 關閉目前的 pane。

## Clean up redundant packages
```bash
sudo apt autoremove
sudo apt autoclean
```
​￼
## Memory
- Clean up packages
	```bash
	sudo apt autoremove
	sudo apt autoclean
	```
- RAM in real time
	```bash
	watch -n 1 free -m
	```
- Release cached pages, inodes, and directory entries
	```bash
	sudo sync
	sudo sysctl -w vm.drop_caches=3
	```
- Remove the old logs
	```bash
	sudo journalctl --vacuum-``time``=2d;
	```

## Generic
- 查看有安裝的版本
	```bash
	dpkg --get-selections | grep linux-image
	```

- 移除deinstall
	```bash
	sudo dpkg -P linux-image-x.xxx.xx-generic
	```

## Cool effects
```bash
cmatrix
```
	
```bash
hollywood #電腦會燒
```

