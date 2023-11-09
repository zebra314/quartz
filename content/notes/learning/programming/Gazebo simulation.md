---
title: Gazebo simulation
enableToc: true
---
[[catalog/learning/programming/ros|ros]]

## 將solidworks中的模型匯入gazebo需要完成以下步驟:
1. 安裝 [solidworks_urdf_exporter](https://github.com/ros/solidworks_urdf_exporter)
    - 根據solidworks版本下載對應的.exe檔 
    - 下載後雙擊即可完成安裝
    - 確認 工具>File>Export as URDF 是否有出現

2. Solidworks中模型設定
    - 參考[Solidworks to urdf](https://medium.com/wens-learning-note/gazebo%E7%AD%86%E8%A8%98-%E5%9B%9B-sw2urdf-b27b55769ae9)
    - 加入global座標
    - 模型中有轉軸的要加入基準軸 (夾爪、輪子...)
    - 點選 工具>File>Export as URDF 
    - 完成joint和link的設定 
    - 匯出成package
    - 注意匯出時的檔名不可以有 ' . ' 要一開始就設定好 後來才更改 pkg內的程式會出包

3. Gazebo
    - 將匯出的package放入catkin_ws/src
    - catkin_make
    - cd 到 launch 資料夾
    - roslaunch gazebo.launch

## 要在gazebo中使用solidworks匯出的模型需要以下檔案:
- .gazebo : gazebo的設定檔 設定機器人在模擬環境中的物理性質  
- .urdf	 : 定義節點和桿件的關係 
- .launch : 將.urdf載入模擬環境中  

這三個都可以在Solidworks匯出的package中找到

## TODO
1. 設定其他物理性質 (摩擦力、重力...)
2. 加入感測器 (光達、相機...)
3. 將模型與控制的程式結合