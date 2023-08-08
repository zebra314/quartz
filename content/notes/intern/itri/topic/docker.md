# Docker
- Run portainer(Docker management tool)   
	- ```docker run -d -p 9000:9000 --restart=always --name portainer -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer```    
	- Open browser and enter ```0.0.0.0:9000```   
- Run docker container
	- ``` docker run -it osrf/ros:melodic-desktop-full ```
- List all container 
	- ```docker container ls -a```
- Start and login to a container
	- ```docker start -ai <container-name/ID>```
- Add USB to container 
	- ```--device=/dev/ttySCOUT```
- Clean build cache
	- ```docker builder prune```
- Build docker image
	- ```docker build --no-cache -t <the folder name of which Dockerfile locate> .```
## Reference   
- [Instruction - Docker – (3) 安裝Docker及portainer](https://cutejaneii.wordpress.com/2017/04/17/docker-2-%E5%AE%89%E8%A3%9Ddocker%E5%8F%8Aportainer/)   
- [Instruction - Docker内运行ROS(melodic版本)以及使用Rviz](https://blog.csdn.net/qq_40695642/article/details/117607446)    
- [Dockerhub - ros Official image](https://hub.docker.com/_/ros/)

- Fix ```ip: command not found```
	- [Instruction - Docker容器中bash: ip: command not found](https://blog.csdn.net/qq_27706119/article/details/108548839)