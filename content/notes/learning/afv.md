---
title: AFV
enableToc: true
---
[[index/learning/intern|intern]] & [[index/learning/programming|programming]]

## Setup
### Install [ceres solver](http://ceres-solver.org/installation.html#linux)
```bash shell
sudo apt-get update
# CMake
sudo apt-get install cmake
# google-glog + gflags
sudo apt-get install libgoogle-glog-dev libgflags-dev
# Use ATLAS for BLAS & LAPACK
sudo apt-get install libatlas-base-dev
# Eigen3
sudo apt-get install libeigen3-dev
# SuiteSparse (optional)
sudo apt-get install libsuitesparse-dev

git clone https://ceres-solver.googlesource.com/ceres-solver
mkdir ceres-bin
cd ceres-bin
cmake ..
make -j3
make test
# Optionally install Ceres, it can also be exported using CMake which
# allows Ceres to be used without requiring installation, see the documentation
# for the EXPORT_BUILD_DIR option for more information.
make install
```

### Install [nlopt](https://github.com/stevengj/nlopt)
```bash shell
git clone https://github.com/stevengj/nlopt.git
cd nlopt
mkdir build
cd build
cmake ..
make
sudo make install
```

### Install other dependencies
```bash shell
sudo apt-get install libspdlog-dev
sudo apt-get install libdw-dev
sudo apt-get install libgeographic-*
sudo apt-get install geographiclib-*
sudo apt-get install ros-$ROS_DISTRO-serial
sudo apt-get install ros-$ROS_DISTRO-geographic-*
sudo apt-get install ros-$ROS_DISTRO-navigation
sudo apt-get install ros-$ROS_DISTRO-sound-play
```

## Bug fixes  
- Error 
	> port 22: Connection refused
	- Solution : 
		- [Instruction - How to Fix the SSH “Connection 	Refused” Error on Linux](https://www.makeuseof.com/	fix-ssh-connection-refused-error-linux/)   
		```bash
		sudo apt install openssh-server
		sudo systemctl start sshd
		sudo ufw disable
		sudo ufw allow 5555
		sudo ufw allow ssh
		```

- Error :
	> conflicting declaration ‘typedef struct LZ4_stream_t LZ4_stream_t’
	- Solution :  
		```bash
		sudo mv /usr/include/flann/ext/lz4.h /usr/include/flann/ext/lz4.h.bak   
		sudo mv /usr/include/flann/ext/lz4hc.h /usr/include/flann/ext/lz4.h.bak 
		sudo ln -s /usr/include/lz4hc.h /usr/include/flann/ext/lz4hc.h  
		sudo ln -s /usr/include/lz4.h /usr/include/flann/ext/lz4.h   
		```

### when compile afv_sensors    
- Error : 
	> Could not find a package configuration file provided by "Ceres" with any of the following names: CeresConfig.cmake ceres-config.cmake
	- Solution : 
		- Follow [Instruction - installation of ceres solver](http://ceres-solver.org/installation.html#linux)    
		- Upgrade cmake version
			- [Instruction - How do I install the latest version of cmake from the command line?](https://askubuntu.com/questions/355565/how-do-i-install-the-latest-version-of-cmake-from-the-command-line)
			- [Instruction - How to reinstall the latest cmake version?](https://stackoverflow.com/questions/49859457/how-to-reinstall-the-latest-cmake-version)   
			```bash
			pip install --upgrade cmake
			```

- Error :
	> bash: /usr/bin/cmake: No such file or directory
	- Solution :
		- [Instruction -bash: /usr/bin/cmake: No such file or directory错误](https://blog.csdn.net/kongkongqixi/article/details/88657508)
		```bash
		cp ./cmake-3.x/bin/cmake /usr/bin/
		```

- Error :
	> ImportError: No module named skbuild  
	- [Instruction - 報錯：ImportError: No module named skbuild](https://blog.csdn.net/GungnirsPledge/article/details/108566415)   
	```bash
	pip install --upgrade pip
	```

- Error :
	> Cannot specify link libraries for target "glog::glog" which is not built by this project.
	- Solution :
		- Build the glog by cmake  
		- Solved after upgrade cmake version

- Error : 
	> Could NOT find NLOPT (missing: NLOPT_INCLUDE_DIR NLOPT_LIBRARY)
	- Solution :
		- Follow [Instruction - NLopt Installation/](https://nlopt.readthedocs.io/en/latest/NLopt_Installation/)   
		- [Stackoverflow - Nlopt libraries not find on Ubuntu (WSL)](https://stackoverflow.com/questions/61842193/nlopt-libraries-not-find-on-ubuntu-wsl)
   
- Error :
	> Could not find a package configuration file provided by "spdlog" with any of the following names: spdlogConfig.cmake spdlog-config.cmake
	- Solution :
		- [Github issue - Could not find a package configuration file provided by "spdlog" #610](https://github.com/gerbera/gerbera/issues/610)   
		```bash
		sudo apt-get install libspdlog-dev
		```

- Error :
	> Could not find a package configuration file provided by "serial" with any of the following names: serialConfig.cmake serial-config.cmake
	- Solution :
		- [CDSN - CMake Error： Could not find a package configuration file provided by “serial“](https://blog.csdn.net/Will_Ye/article/details/117153462)
		```bash
		sudo apt-get install ros-melodic-serial
		```

- Error :
	> fatal error: elfutils/libdw.h: No such file or directory #include <elfutils/libdw.h>
	- Solution :
		- [CDSN - ubuntu编译camera_model报错：fatal error: elfutils/libdw.h: 没有那个文件或目录](https://blog.csdn.net/weixin_46398948/article/details/120544589)
		```bash
		sudo apt-get install libdw-dev
		```

- Error :
	> error: conflicting declaration ‘typedef struct LZ4_stream_t LZ4_stream_t’
	- Solution :
		- [Github issue - Building error with catin build #16](https://github.com/ethz-asl/lidar_align/issues/16)
		```bash
		sudo mv /usr/include/flann/ext/lz4.h /usr/include/flann/ext/lz4.h.bak
		sudo mv /usr/include/flann/ext/lz4hc.h /usr/include/flann/ext/lz4.h.bak
		sudo ln -s /usr/include/lz4hc.h /usr/include/flann/ext/lz4hc.h
		sudo ln -s /usr/include/lz4.h /usr/include/flann/ext/lz4.h
		```

### when compile feature/afv_mln
- Error :
	> Could NOT find GeographicLib (missing: GeographicLib_LIBRARIES GeographicLib_INCLUDE_DIRS)
	- Solution :
		- [CDSN - GeographicLib编译踩坑笔记](https://blog.csdn.net/liuerin/article/details/116035470)
		```bash
		sudo apt-get install libgeographic-*
		sudo apt-get install geographiclib-*
		sudo apt-get install ros-melodic-geographic-*
		```

- Error :
	> Could not find a package configuration file provided by "move_base_msgs" with any of the following names: move_base_msgsConfig.cmake move_base_msgs-config.cmake
	- Solution :
		```bash
		sudo apt-get install ros-$ROS_DISTRO_navigation
		```

- Error :
	> sound_player.cpp:2:10: fatal error: sound_play/sound_play.h: No such file or directory #include <sound_play/sound_play.h>
	- Solution :
		```bash
		sudo apt-get install ros-$ROS_DISTRO-sound-play
		```

## VCU control board programming
### Reference
- [ROS.org - msg setup](http://wiki.ros.org/msg)
- [Instruction - empty service](https://qiita.com/hoshianaaa/items/74b0ffbcbf97f4938a4d)
- [Instruction - Define and use custom message types (C++ and Python)](https://people.eng.unimelb.edu.au/pbeuchat/asclinic/software/ros_define_and_use_custom_message_types.html)
### Bug fixes  
- Error : 
- > fatal error: CMakeFiles/lidar_align.dir/src/aligner.cpp.d: No such file or directory``` ```fatal error: CMakeFiles/lidar_align.dir/src/sensors.cpp.d: No such file or directory```
	- In CMakeList.txt, change```add_definitions(-std=c++11 -ofast)``` to ```add_definitions(-std=c++11 -Ofast)```
-[Instruction - LINUX SERIAL PORTS USING C/C++](https://blog.mbedded.ninja/programming/operating-systems/linux/linux-serial-ports-using-c-cpp/) 



- Test pcb
- Monitor the log of usb
	- ```dmesg -w```
## Reference
- [CSDN - Ubuntu 18 ft232驅動安裝](https://blog.csdn.net/qq_41035283/article/details/125394394)
## Bug fixes  
- Fix ```could not open port /dev/ttyUSB0: [Errno 13] Permission denied: '/dev/ttyUSB0'```
	- ```sudo usermod -a -G dialout $USER```
- Fix ```/usr/bin/env: 'python' No such file or directory```
	- ```sudo ln -s /usr/bin/python3 /usr/bin/python```



# Control Board
## Content
- USB to TTL 晶片型號
	- FTDI FT232RL   
	- PL2303   
	- CH340 (目前使用)
	- CP2102

- [Github repo - Fix Driver issues for CH340N usb serial chip in Linux (Ubuntu 22.04)](https://gist.github.com/dattasaurabh82/082d13fd61c0d06c7a358c5e605ce4fd)
- [Github repo - CH341SER driver](https://github.com/juliagoda/CH341SER)
- [CSDN - ubuntu18.04下安装CH340串口驱动](https://blog.csdn.net/weixin_42591529/article/details/109611687)
- [Instruction - How to Install CH340 Drivers](https://learn.sparkfun.com/tutorials/how-to-install-ch340-drivers/linux)   
- [Instruction - install GtkTerm](http://odinq.blogspot.com/2009/01/ubuntu-gtkterm.html)

- [Instruction - Ubuntu切換kernel](https://www.cnblogs.com/gaowengang/p/12506096.html#:~:text=GRUB_DEFAULT%20%3D%200...%20%E6%94%B9%E4%B8%BA%20GRUB_DEFAULT%3D%20%27Advanced%20options%20for,-%20r%204.15.%200%20-%2045%20-generic%20%E5%AE%8C%E3%80%82)