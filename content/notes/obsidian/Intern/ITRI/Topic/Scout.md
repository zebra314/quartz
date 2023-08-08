---
title: Scout Setup
enableToc: true
tags:
- intern
- itri
- robotics
---

## Reference
- [Instruction - SCOUT 的ROS PACKAGE 介绍和使用](https://blog.csdn.net/hltt3838/article/details/108603888)
- [GIthub repo - weston/scout_ros](https://github.com/westonrobot/scout_ros)
- Teleop
	- [ROS.org - joy pkg](http://wiki.ros.org/joy)
	- [ROS.org - joy/Tutorials](http://wiki.ros.org/joy/Tutorials)
	- [Video - control scout by ps4 joystick](https://www.youtube.com/watch?v=zWQD9qQ3gQE)
	- [Instruction - Joystick Control Teleoperation](https://ros-planning.github.io/moveit_tutorials/doc/joystick_control_teleoperation/joystick_control_teleoperation_tutorial.html)

## Bug fixes
- Error : 
	> USB device shown in lsusb but not appearing in /dev/tty  
	- Solution : 
		> Add custom rule file in /etc/udev/rules.d    
		- [Discourse - /dev/ttyUSB0 not present in Ubuntu 22.04](https://askubuntu.com/questions/1403705/dev-ttyusb0-not-present-in-ubuntu-22-04)  
		- [Discourse - USB-Serial adaptor doesn't create /dev/ttyUSB path to address device](https://askubuntu.com/questions/1093910/usb-serial-adaptor-doesnt-create-dev-ttyusb-path-to-address-device)  
		- [Instruction - udev子系統 - linux的裝置管理員](https://handy505.gitbooks.io/rpi/content/udev.html)

- Error :
	> ```modprobe: command not found```
	- Solution :
		- [Instruction - Docker container: lsmod not found](https://stackoverflow.com/questions/38229579/docker-container-lsmod-not-found)

- Error :
	> "No such file or directory: '/home/ros/.local/lib/python2.7/site-packages/test-easy-install-5410.write-test'"
	- Solution :
		- [Instruction - Libraries in /usr/local/lib not found](https://stackoverflow.com/questions/17889799/libraries-in-usr-local-lib-not-found)

- Error : 
	> "ModuleNotFoundError: No module named 'rospkg'"
	- Solution :
		- [python3运行ros方法 No module named 'rospkg'](https://blog.csdn.net/weixin_43046653/article/details/102930894)

- Error :
	> /home/scout_ws/src/ugv_sdk/include/ugv_sdk/details/async_port/async_can.hpp:24:10: fatal error: asio.hpp: No such file or directory
	- Solution :
		```bash
		sudo apt-get install libasio-dev
		```

- Error :  
	> ```/cmd_vel``` receive the data from joystick, but the data is not correct to which is set in the config file.
	- Solution :
		> use ```rostopic echo /joy_teleop/joy``` to view the original data receive from joystick and correct the index of button.

		> For example, if the L1 button is pressed and the topic echo changes from 
		```buttons: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]``` to 
		```buttons: [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]```, 
		then we can infer that L1 button has the index of 4.

- Error :
	> [ WARN] [1688953266.307205756]: Couldn't set gain on joystick force feedback: Bad file descriptor
	- Solution 
		> Change the path of joystick in config file from ```/dev/input/js0``` to ```/dev/input/js2```

- Error : 
	> ```/cmd_vel``` not receive the data in ```/joy_teleop/cmd_vel```
	- Solution :  
		> ```<remap from="/joy_teleop/cmd_vel" to="/cmd_vel" />```

## Quick start
1. Connect the PC to scout
```bash
sudo ip link set can0 up type can bitrate 500000
roslaunch scout_bringup scout_minimal.launch
```
2. Start control
```bash
roslaunch scout_teleop teleop.launch # By PS4 joystick
# or
roslaunch scout_bringup scout_teleop_keyboard.launch # By keyboard
```