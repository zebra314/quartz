---
title: PX4 仿真
enableToc: true
---
[[catalog/learning/programming|programming]] & [[catalog/learning/command|command]]

## HIL with RC control
[HIL模擬](https://docs.px4.io/main/en/simulation/hitl.html)
1. 
```
roscore
```

2. 遙控器連線
```
cd PX4-Autopilot/
./Tools/jmavsim_run.sh -q -d /dev/ttyUSB0 -b 921600 -r 250
```

3. open QGround
```
./QGroundControl.AppImage 
```
or double click

## mavros
```
roslaunch mavros px4.launch fcu_url:=/dev/ttyUSB0:921600
```

## 打開gazebo
1. 記得source setup_gazebo.bash 
	- 網路上的setup_gazebo.bash是放在Tools/simulation/gazebo裡面 
	- 但我的是放在Tools裡
```
source PX4-Autopilot/Tools/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
```

```
cd ~/PX4-Autopilot/
make px4_sitl gazebo 
```

## make 噴錯
1. Case 1
```
[0/4] Performing build step for 'sitl_gazebo'
ninja: error: '/usr/lib/x86_64-linux-gnu/libsdformat9.so.9.8.0', needed by 'libmav_msgs.so', missing and no known rule to make it
FAILED: external/Stamp/sitl_gazebo/sitl_gazebo-build 
cd /home/alfonso/PX4-Autopilot/build/px4_sitl_default/build_gazebo && /usr/bin/cmake --build /home/alfonso/PX4-Autopilot/build/px4_sitl_default/build_gazebo -- -j 6
ninja: build stopped: subcommand failed.
make: *** [Makefile:233: px4_sitl] Error 1
```
2. try
```
make clean
```




