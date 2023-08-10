---
title: Mavros 連接
enableToc: true
---
[[catalog/learning/programming/ros|ros]]

# launch 
> roslaunch mavros px4.launch

# check connect
> rostopic echo /mavros/state
> rostopic echo -n1 /diagnostics 
> rosrun mavros checkid 
