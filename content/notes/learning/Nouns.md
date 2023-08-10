---
title: Nouns
enableToc: true
---
[[catalog/learning/programming|programming]]

# 硬體 
1. APM 
	- 飛控板
	- 8 bit
	- 基於arduino
	- 較舊 
	- 其韌體為Arudpilot(跟PX4同樣為韌體)
2. Pixhawk 
	- 飛控板
	- 前身是APM(Ardupilot Mega)
	- 32bit
	- PX4為pixhawk的原生韌體 
	- 這次開發所使用

# 韌體
1. PX4 
	- firmware 韌體
	- 運行在Pixhawk(飛控)上
	- autoPilot
	- 其地面控制站為QGroundControl (QGC)
	- PX4 based FCU (Flight Control Unit)
2. Arudpilot
	- firmware 韌體
	- 可運行在Pixhawk或APM上
	- autoPilot
	- 其地面站為Mission Planner(MP)

# Ground control station (GCS)
1.  地面控制站
2. QGroundControl (QGC)
	1. 這次開發所使用
	2. 模擬時也會用到
	3. [QGC user guide](https://docs.qgroundcontrol.com/master/en/index.html)
3. Mission Planner (MP)

# PPM 訊號
1. 把多路通道(遙控器)的pwm訊號調製到一路通道上, 傳輸到接收機後, 再由接收機還原成多路PWM從各個通道輸出
2. Pixhawk只接收PPM訊號

# MAVLink protocol
1. Micro Air Vechicle Link
2. 通訊協定 通訊格式 溝通方式 
	1. the same as http

# Mavros
1. MAVROS is the official supported bridge between ROS and the MAVLink protocol

# 模擬
1. gazebo
	1. 模擬環境
2. 流程
	1. 通過mavros向px4(運行在飛控, 也就是無人機上)發送控制命令
	2. px4再將命令傳至各組件
	3. 該無人機就在gazebo中, 可以透過gazebo看到無人機的運動情形


