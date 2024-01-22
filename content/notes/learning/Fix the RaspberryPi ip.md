---
title: Fix the RaspberryPi ip
---
[[catalog/learning/software|software]]

## Fix the RaspberryPi ip

```bash
sudo apt install dhcpcd5
sudo vim /etc/dhcpcd.conf

# Add the following lines at the end
interface wlan0 # or eth0
static ip_address=x.x.x.x/24 # 想改成的ip地址  
static routers=x.x.x.x # 無線基地台地址  
static domain_name_servers=x.x.x.x # 無線基地台地址
```
