---
title: Drone research
enableToc: true
---
[[catalog/learning/programming|programming]]

## 2023/3/2
連同一個網路
ifconfig 
從遮罩看ipv4有幾個是不會變的
fping -agq -r 1 192.168.167.0 192.168.167.255 上界 下界
應該會掃出三個 手機 電腦 樹梅派
ssh

## 2023/3/1
1. 測試樹梅派上連接相機，一些報錯 如pipline have not been created 
2. 檢查並安裝了gst的一些東西後解決了
```c
gst-launch-1.0 --gst-version
gst-inspect-1.0 v4l2src
sudo apt-get install gstreamer1.0-plugins-good
```

## 2023/1/20
1. 過年回家了 在研究樹莓派 剛學會如何ssh 準備要在micro sd中灌樹莓派的作業系統
2. 樹莓派支援的最新版本是ubuntu 20.04 LTS
3. LTS和Desktop版不一樣
	1. LTS (Long-Term Support) 是长期支持版本，提供长期的更新和安全支持。LTS版本适用于长期运行的系统，如服务器或嵌入式设备
	2. Desktop版本是为桌面和个人电脑设计的版本，提供了一个完整的图形用户界面，并且自带了很多桌面应用程序。Desktop版本适用于个人电脑和笔记本电脑，并且支持多种硬件和软件。
4. 最後決定灌 ubuntu 20.04 Server LTS 64位元的 沒有gui不太習慣 只能靠指令了
5. login: ubuntu
6. password: itro111
7. 好不容易連上了wifi
8. 安裝ROS noetic

## 2023/1/4
1. 研究如何寫launch file
	1. [Tutorial](http://www.clearpathrobotics.com/assets/guides/melodic/ros/Launch%20Files.html)
2. mavros連部上 看不到 /mavros/imu/data 裡面的訊息 
3. rostopic echo /mavros/state connect = false

## 2023/1/1
1. 研究如何使用遙控器
	1. controller microzone mc6c
	2. receiver microzone mc7rb
	3. [教學影片](https://www.youtube.com/watch?v=WK8xG6lX2u4)
2. 遙控器上的CH5(三段)和CH6(兩段) 控制開關
	1. 未來要控外接的伺服馬達應該會用到
3. 成功模擬飛行

## 2022/12/31
1. 去歐庭緯學長家拿無人機了, 有給了一些教學
2. 整理好ubuntu, 只差microsoft的東西還沒裝(of mice and sand ubuntu不能玩 難過)
3. 安裝mavros [安裝教學](https://docs.px4.io/main/en/ros/mavros_installation.html)
4. 安裝PX4
5. 安裝gazebo
6. 安裝QGC

## 2022/11/25
1. ISR 
	1. Interrupt service routine 
	2. 中斷處理程式
2. IRQ 
	1. Interrupt Request 
	2. 中斷
3. NVIC
	1. Nested vectored interrupt controller

## 2022/11/18
1. mavlink, mavROS

## 2022/11/11
無人機實作課
1. 再次安裝了STM32的ID [STM32Cube IDE](https://www.st.com/en/development-tools/stm32cubeide.html#st-get-software)

## 2022/10/30
I have done some researchs about the drones previous days, and will make the learning list today.

### To kick start
1. train model for opencv object detection 
	1. yolo 
	2. pytorch 研究
	3. tensorflow 業界
2. STM32
	1. motor control 
	2. msg communication
3. drone
	1. purchase the component 
	2. camera
	3. frame
	4. motor
	5. .....
4. more about computer vision
	1. stero vision
	2. depth maps
	3. 3D object detction

## 2022/10/23 
search for how to build a drone

### components
1. fly controller 
![[images/old/Pasted image 20221023122759.png]]
![[images/old/Pasted image 20221023123200.png]]

why not perform stabilization on the flight computer?
> The speed of the flight computer is not guaranteed constant and also it prone to freezing or crashing.
- fly computer

2. frame
3. VTX (要接電線才能通電 不然會燒掉)   [VTX教學](https://www.youtube.com/watch?v=uFbuDqg424c)
4. LiPo battery
5. brushless motor
6. 飛行控制器
7. antennas
8. camera
9. ESC : electronic speed controllers 

### some unknown stuff
1. imu : inertial measurement unit
2. gyro : 陀螺儀
3. EKF : 
- extended Kalman filter  擴展卡曼濾波器 computer vision
- SLAM的其中一種算法
- [詳細EKF](https://www.cnblogs.com/gaoxiang12/p/5560360.html)
4. [不錯的教學網站](https://prg.cs.umd.edu/enae788m)
5. stereo from odometry (2d 轉 3d)
6. ORB feature matching (opencv 有函式庫)
7. optical flow (光流 用來在移動中辨識物體之類的)
 
[四軸無人機project example](https://www.youtube.com/watch?v=2r0fX_8A8ms)
![[images/old/Pasted image 20221023124740.png]]
![[images/old/Pasted image 20221023125708.png]]
![[images/old/Pasted image 20221023125811.png]]
![[images/old/Pasted image 20221023132356.png]]
![[images/old/Pasted image 20221023132437.png]]  
![[images/old/Pasted image 20221023132609.png]]
![[images/old/Pasted image 20221023132740.png]]

## 2022/10/19 
I found a youtuber recorded himself making drones to track himself , incredible
[his channel](https://www.youtube.com/c/MattClarke)
down below are some keywords
ORB-SLAM2
structure form motion
waveshare imx219-83
left and right camera
depth map and inference
set point GPS
controlled flight
navidia jetson nano (central controll)
opencv
steroBGM
yoloR
damping mount

## Begining
After participated in the TDK competition last week , I started to be interested in making the drone by myself and the programming about the computer vision. I decide to start learning from now and hope  I will be able to join the drone competition of TDk few years later. No matter whether I will persist , I will learn something along this way  at least.