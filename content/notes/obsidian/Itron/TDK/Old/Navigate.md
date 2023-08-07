## TODO
1. 如何使用光達
    1. 建圖
    2. 定位
2. 避障   
    1. 路徑規劃 or 訓練   
3. 模擬  
	1. 匯入地圖檔  
	2. 加入光達sensor  
## Guide
- Import solidworks models into gazebo  
	- [Instruction - import solidworks model to gazebo](https://blogs.solidworks.com/teacher/wp-content/uploads/sites/3/WPI-Robotics-SolidWorks-to-Gazebo.pdf)  

- Current progress
    - [Github repo - car_simulation](https://github.com/zebra314/car_simulation)  
	    - [display.launch](https://github.com/zebra314/car_simualtion/blob/main/launch/display.launch) to view the model in rviz  
	    - [gazebo.launch](https://github.com/zebra314/car_simualtion/blob/main/launch/gazebo.launch) to import the model to gazebo  
	    - [diff_drive.launch](https://github.com/zebra314/car_simualtion/blob/main/launch/diff_drive.launch) try to control the wheels, bug exist   
	    - [car_world.launch]() testing custom xacro file  
	    - [car_control.launch]() testing car movement control  

- Control the urdf model in gazebo  
	- [Instruction - gazebo official tutorial](https://classic.gazebosim.org/tutorials?tut=ros_control)  
	- [Github repo - demo](https://github.com/ros-simulation/gazebo_ros_demos)  
	- [- setting velocity on joints]()  

- Use Skid Steering Plugin to control the four wheels  
	- [Video - 1 - Skid Steering Plugin](https://www.youtube.com/watch?v=A_PDyn2F9bI)  
	- [Video - 2 - Skid Steering Plugin](https://www.youtube.com/watch?v=sb7FoOGzb8E)  
- Obstacle avoidance using DeepRL  
	- [Discourse - toolkit for Reinforcement Learning using ROS and Gazebo](https://discourse.ros.org/t/a-toolkit-for-reinforcement-learning-using-ros-and-gazebo/442/2)  
	- [Github repo - gym extension for using Gazebo](https://github.com/erlerobot/gym-gazebo/)  
	- [Instruction - DQN training in gym_gazebo](https://porter.gitbook.io/deep-learning-series/di-si-zhang-ros-ji-qi-ren/gymgazebo-an-zhuang-hou-de-ce-shi)  

- Lidar in Gazebo  
	- [Instruction - Gazebo plugins](https://classic.gazebosim.org/tutorials?tut=ros_gzplugins#GPULaser)  

- Designate robot init position  
	- [Discourse - ROS answers](https://answers.ros.org/question/40627/how-do-i-set-the-inital-pose-of-a-robot-in-gazebo/)  

- Input custom mesh to the world  
	- [Instruction - gazebo official tutorial](https://classic.gazebosim.org/tutorials?tut=import_mesh&cat=build_robot)  

- DQN training in Gazebo  
	- [Thesis - TRANSFERRING DEEP REINFORCEMENT LEARNING AGENT FROM VIDEO GAME TO A REAL ROBOT](https://erepo.uef.fi/handle/123456789/21382)  
	- [Video - From Video Game to Real Robot](https://karelics.fi/from-video-game-to-real-robot/)  
	- [Instruction - Using Gazebo for Reinforcement Learning](https://karelics.fi/using-gazebo-for-reinforcement-learning/)  
	- [Video - create custom gym-gazebo env](https://www.youtube.com/watch?v=tfca_gXvmWs)

## Bug fixes
- Fix "Received JointState is 1531129342.521295 seconds old"  
	- [Discourse - ROS answers](https://answers.ros.org/question/296720/delay-in-jointstates/)  
- If-else statement in xacro  
	- [Discourse - ROS answers](https://answers.ros.org/question/349515/conditional-block-for-params-on-macro-xacro/)  
- Fix "No p gain specified for pid."  
	- [Discourse - ROS answers : setup controllers in xacro and yaml files](https://answers.ros.org/question/326628/how-to-control-velocity-of-joints-in-gazebo-using-ros_controllers/)  
	- [Instruction - gazebo tutorial : very detail](https://sir.upc.edu/projects/rostutorials/10-gazebo_control_tutorial/index.html)  
	- ```robotNamespace``` cannot be empty 
	```xml
		 <gazebo>
			<plugin
				name="gazebo_ros_control"
				filename="libgazebo_ros_control.so">
			<robotNamespace>/car</robotNamespace>
			</plugin>
		</gazebo>
	```  
- Laser plugin does not scan
	- [Video - Using gazebo Laser Scan Plugin](https://www.youtube.com/watch?v=M_pzenkPZfE)  
	- Change the plugin name from ```libgazebo_ros_gpu_laser.so``` to ```libgazebo_ros_laser.so```  
- Fix "could not load model" in Rviz2  
	- [Discourse - Fail to load mesh files](https://www.reddit.com/r/ROS/comments/w7zu18/ros2_foxy_mesh_file_isnt_loading_into_rviz/)  
	- In CMakeLists.txt add "meshes" to install()
	```txt
		install(
		DIRECTORY config description launch worlds meshes
		DESTINATION share/${PROJECT_NAME}
		)
	```


