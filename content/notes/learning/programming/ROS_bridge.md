---
title: ROS bridge
enableToc: true
---
[[catalog/learning/intern|intern]] & [[catalog/learning/programming/ros|ros]]

## Introduction
- Using [ROS bridge server](http://wiki.ros.org/rosbridge_server) and a web page built with [roslibjs](http://wiki.ros.org/roslibjs) on LAN to build a ros Interface.  
![](images/rosbridge/interact_plot.png)

- Rosbridge server provides a websocket to connect the ros system and the web page.
- [Nginx](https://www.nginx.com/), the local server, is used to host the web page locally.

- > [!INFO] The ports
  > 
  > There are two ports in this system, one is the port of rosbridge server, the other is the port of local server.
	> - The port of rosbridge server is set to 9090 by default. The setting is in the HTML file and the launch file of rosbridge server, we can change it, but remember to change the port in the HTML file and the launch file at the same time.
	> - The port of local server is set to 90 by default. The setting is in the nginx config file. This port is used to host the web page locally, and for the user to access the web page.

## Setup

1. Install rosbridge server and nginx 
	```bash
	sudo apt-get install ros-$ROS_DISTRO-rosbridge-server
	sudo apt-get install nginx
	```

2. Generate ssl certificate and key file using openssl (cd to the directory you want to store the files first) 
	```bash
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt
	```

3. Edit the nginx config in ```/etc/nginx/nginx.conf```  

	3.1. Change the default user name www-data to hoster user name (the first line of the file, see example 3.3.)

	3.2. Add the server config session in the config file.   
	```bash
		http {
			...
			server {
				# Put your server config here
			}
		}
	```

	3.3. Here is an example of the config file
	```bash
	user alfonso; # change to local server name
	worker_processes auto;
	pid /run/nginx.pid;
	include /etc/nginx/modules-enabled/*.conf;

	events {
		worker_connections 768;
	}

	http {

		##
		# Basic Settings
		##

		sendfile on;
		tcp_nopush on;
		types_hash_max_size 2048;
		# server_tokens off;
		# server_names_hash_bucket_size 64;
		# server_name_in_redirect off;
					
		server {
			listen 90; # change 90 to local server  port
			listen [::]:90; # change 90 to local server port
			listen 443 ssl;

			# ssl config
			ssl_certificate /home/alfonso/Documents/gui/localhost.crt; # change to file path on local server
			ssl_certificate_key /home/alfonso/Documents/gui/localhost.key; # change to file path on local server
			ssl_session_cache shared:SSL:10m;
			ssl_session_timeout 10m;
			ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3;
			ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:';
			ssl_prefer_server_ciphers on;
			server_name localhost;
			root /home/alfonso/Documents/gui; # change to the directory of the web page on local server
			index index.html;
		}
		
		include /etc/nginx/mime.types;
		default_type application/octet-stream;

		##
		# SSL Settings
		##

		ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
		ssl_prefer_server_ciphers on;

		##
		# Logging Settings
		##

		access_log /var/log/nginx/access.log;
		error_log /var/log/nginx/error.log;

		##
		# Gzip Settings
		##

		gzip on;

		# gzip_vary on;
		# gzip_proxied any;
		# gzip_comp_level 6;
		# gzip_buffers 16 8k;
		# gzip_http_version 1.1;
		# gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

		##
		# Virtual Host Configs
		##

		include /etc/nginx/conf.d/*.conf;
		include /etc/nginx/sites-enabled/*;
	}
	```

3. The example web page, using a virtual joystick to publish the cmd_vel topic.
![](images/rosbridge/example_webpage.png)
	```javascript
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="utf-8" />
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/roslib@1/build/roslib.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/nipplejs/0.7.3/nipplejs.js"></script>

		<script type="text/javascript">
			var ros = new ROSLIB.Ros({
				// change to robot ip address 
				// 9090 is the default port of rosbridge server
				url: 'ws://192.168.120.148:9090' 
			});

			ros.on('connection', function () {
				document.getElementById("status").innerHTML = "Connected";
			});

			ros.on('error', function (error) {
				document.getElementById("status").innerHTML = "Error";
			});

			ros.on('close', function () {
				document.getElementById("status").innerHTML = "Closed";
			});

			var txt_listener = new ROSLIB.Topic({
				ros: ros,
				name: '/txt_msg',
				messageType: 'std_msgs/String'
			});

			txt_listener.subscribe(function (m) {
				document.getElementById("msg").innerHTML = m.data;
				move(1, 0);
			});

			cmd_vel_listener = new ROSLIB.Topic({
				ros: ros,
				name: "/cmd_vel",
				messageType: 'geometry_msgs/Twist'
			});

			move = function (linear, angular) {
				var twist = new ROSLIB.Message({
					linear: {
						x: linear,
						y: 0,
						z: 0
					},
					angular: {
						x: 0,
						y: 0,
						z: angular
					}
				});
				cmd_vel_listener.publish(twist);
			}

			createJoystick = function () {
				var options = {
					zone: document.getElementById('zone_joystick'),
					threshold: 0.1,
					position: { left: 50 + '%' },
					mode: 'static',
					size: 150,
					color: '#000000',
				};
				manager = nipplejs.create(options);

				linear_speed = 0;
				angular_speed = 0;

				manager.on('start', function (event, nipple) {
					timer = setInterval(function () {
						move(linear_speed, angular_speed);
					}, 25);
				});

				manager.on('move', function (event, nipple) {
					max_linear = 5.0; // m/s
					max_angular = 2.0; // rad/s
					max_distance = 75.0; // pixels;
					linear_speed = Math.sin(nipple.angle.radian) * max_linear * nipple.distance/max_distance;
					angular_speed = -Math.cos(nipple.angle.radian) * max_angular * nipple.distance/max_distance;
				});

				manager.on('end', function () {
					if (timer) {
						clearInterval(timer);
					}
					self.move(0, 0);
				});
			}
			window.onload = function () {
				createJoystick();
			}

		</script>
	</head>

	<body>
		<h1>Simple ROS User Interface</h1>
		<p>Connection status: <span id="status"></span></p>
		<p>Last message on /txt_msg: <span id="msg"></span></p>
		<div id="zone_joystick" style="position: relative;"></div>
	</body>

	</html>
	```

## Startup
### On robot side

1. Start rosbridge server
	```bash
	roslaunch rosbridge_server rosbridge_websocket.launch
	```

2. After the user side is connected, check if the data is received.
	```bash
	rostopic echo /cmd_vel
	```

### On local server side

1. Start local server
	```bash
	sudo service nginx start
	```

### On user side

1. Open the web page
	```bash
	https://<ip address of the local server>:90
	```

## Bug fixes
1. Error :
	> The web page shows 403 Forbidden
	- Solution :
		- [Instruction - 解决Nginx出现403 forbidden](https://cloud.tencent.com/developer/article/1949092)
		- check users 
			```bash
			ps aux | grep "nginx: worker process" | awk  '{print $1}'
			```
		- Edit the user name in /etc/nginx/nginx.conf, default is www-data change to your user name

2. Error :
	> The web page shows ERR_SSL_PROTOCOL_ERROR
	- Solution :
		- [Github - ERR_SSL_PROTOCOL_ERROR错误](https://github.com/xianyunyh/studynotes/blob/master/%E5%85%B6%E4%BB%96/nginx%E9%85%8D%E7%BD%AEssl%E5%87%BA%E7%8E%B0ERR_SSL_PROTOCOL_ERROR%E9%94%99%E8%AF%AF.md)
		- Add the ssl config session in /etc/nginx/nginx.conf
			```bash
			server {
				listen 90;
				listen [::]:90;
				listen 443 ssl;

				root /home/alfonso/Documents/gui;
				index index.html;

				# ssl config
				ssl_certificate /home/alfonso/Documents/gui/localhost.crt;
				ssl_certificate_key /home/alfonso/Documents/gui/localhost.key;
				ssl_session_cache shared:SSL:10m;
				ssl_session_timeout 10m;
				ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
				ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:';
				ssl_prefer_server_ciphers on;
				server_name localhost;
			}
			```

		- Restart nginx
			```bash
			sudo service nginx restart
			```

## Reference
### Websocket
- [Instruction - ROS package#1 ROS Bridge 跨平台溝通](https://hollyqood.wordpress.com/2016/08/22/ros-function-1-ros-bridge-%E8%B7%A8%E5%B9%B3%E5%8F%B0%E6%BA%9D%E9%80%9A/)
- [Github  - roslibjs](https://github.com/RobotWebTools/roslibjs/tree/develop)
- [CSDN - ROS进阶——Websocket](https://blog.csdn.net/Kalenee/article/details/114671201)
- [古月居 - 利用Websocket实现ROS与Web的交互](https://www.guyuehome.com/5386)
- [Instruction - ROS web tutorial part 1 - rosbridge server and roslibjs](https://msadowski.github.io/ros-web-tutorial-pt1/)
- [Instruction - HTTPS站点使用WebSocket的错误及解决方案](https://www.joshua317.com/article/61)
### Local server
- [Hackmd - 用Nginx架設local端https應用](https://hackmd.io/@warrenpig/create-self-signed-https-nginx-app)
- [iThome - Nginx設置手把手](https://ithelp.ithome.com.tw/articles/10242389)
- [Instruction - 使用Ubuntu Server架設Nginx伺服器](https://magiclen.org/ubuntu-server-nginx "使用Ubuntu Server架設Nginx伺服器")
- [Instruction - 	使用SSL配置Nginx反向代理的简单指南](https://www.cnblogs.com/xjknight/p/10871636.html)
- [Instruction - Nginx 教學](https://hi-founder.com/p/nginx-%E6%95%99%E5%AD%B8/)
