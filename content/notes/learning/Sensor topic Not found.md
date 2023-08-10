---
title: Sensor topic Not found
enableToc: true
---
[[catalog/learning/programming|programming]]

## Bug report   
### Description  
2023-06-29, I add a 2D Lidar to my robot in Gazebo using the gazebo plugins, I follow [the tutorial on gazebo webiste](https://classic.gazebosim.org/tutorials?tut=ros_gzplugins#GPULaser). It says the sensor will publish the data on the topic which is set in the .gazebo file.  

For example, the description down below will make the sensor to publish the data on
```/rrbot/laser/scan```topic.  
```xml
<plugin name="gazebo_ros_head_hokuyo_controller" filename="libgazebo_ros_gpu_laser.so">
    <topicName>/car/laser/scan</topicName>
    <frameName>hokuyo_link</frameName>
</plugin>
```  
  
The lidar is successfully built and activated in the gazebo world. However, there is no correspond topic when I use ```rostopic list```, and also I cannot view the data by selecting the topic in Rviz.  

### Screen Shots  
![[images/old/In_gazebo.png]]  
![[images/old/In_rviz.png]]  
![[images/old/rviz_select_by_topic.png]]  
![[images/old/Result_of_rostopic_list.png]]  

### Similar issue
- [Discourse - LaserScanner in Gazebo does not publish data while topic is set](https://answers.ros.org/question/273492/laserscanner-in-gazebo-does-not-publish-data-while-topic-is-set/)  
- [Discourse - Not able to Publish hokuyo data in ROS](https://answers.gazebosim.org//question/7029/not-able-to-publish-hokuyo-data-in-ros/)

### What I've tried
1. Switch to robostack ros2 humble  
	1. Problem : Gazebo flashback always  
2. Switch to Desktop ros2 humble  
	1. Problem : Cannot source the path properly  
	2. I am able to run the example ros2 launch, but cannot run the package I build my self. 
	3. ```bash 
		substitution args not supported:  cannot import name 'Log' from 'rosgraph_msgs.msg' (/opt/ros/humble/local/lib/python3.10/dist-packages/rosgraph_msgs/msg/__init__.py)   
3.  There's a great [Video - tutorial on yt](https://www.youtube.com/playlist?list=PLunhqkrRNRhYAffV8JDiFOatQXuU-NnxT), if we can use the gazebo in ROS2, the work will be more easier.  