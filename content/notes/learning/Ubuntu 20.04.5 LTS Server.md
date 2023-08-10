---
title: Ubuntu 20.04.5 LTS Server
enableToc: true
---
[[catalog/learning/software|software]]

# Setup
1. to see the information of operating system
> cat /etc/os-release

2. to see the information about kernel and architecture
> hostnamectl

3. network   [教學](https://www.youtube.com/watch?v=s4ZDlV3tIuM)
	1. add configuration to the fille
	      >  sudo nano /etc/netplan/50-cloud-init.yaml
	    
    2. 原檔案
    ```
        network :
	        ethernets:
		        eth0:
			        dhcp4: true
			        optional: true
			version: 2
    ```
	    
	 3. 修改後 (層輯要分好)
    ```
        network :
	        ethernets:
		        eth0:
			        dhcp4: true
			        optional: true
			version: 2
			wifis:
				wlan0:
					optional: true
					access-points:
						"your_ssid":
						    password: "your password"
					dhcp4: true
    ```
    4. ctrl + O , ctrl+X 退出




