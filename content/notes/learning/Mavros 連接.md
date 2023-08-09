---
title: Mavros 連接
enableToc: true
---
[[index/learning/programming|programming]]
# launch 
> roslaunch mavros px4.launch

# check connect
> rostopic echo /mavros/state
> rostopic echo -n1 /diagnostics 
> rosrun mavros checkid 
