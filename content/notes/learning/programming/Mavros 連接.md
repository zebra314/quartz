---
title: Mavros 連接
enableToc: true
---
[[catalog/learning/programming/ros|ros]]

## Launch 
> roslaunch mavros px4.launch

## Check connect
> rostopic echo /mavros/state
> rostopic echo -n1 /diagnostics 
> rosrun mavros checkid 
