---
title: Clonezilla
enableToc: true
---
[[catalog/learning/intern]] & [[catalog/learning/software|software]]

## Usage
- To clone a hard disk partition from a dual-boot system

## Requirements
- A USB flash drive
  > It will be used to boot Clonezilla.
- A hard disk drive
  > It will be used to store the copy of the partition.

  > [!Warning]
  > Make sure the total space of this hard disk drive is larger than the size of the partition you want to copy.
  >  
  > For example, if you want to copy a 512GB partition with 100GB used space, the hard disk drive should have at least 512GB space. If the hard disk drive has only 256GB space, although it is enough to store the used space, the copy process will still fail.

## Steps
### Prepare the Disks
  1. Download the Clonezilla iso file from the [official website](https://clonezilla.nchc.org.tw/clonezilla-live/download/download.php?branch=alternative).

  2. Burn the iso file to the USB flash drive using [Rufus](https://rufus.ie/) or [Raspberry imager](https://www.raspberrypi.com/software/).

  3. Divide the hard disk drive into two partitions using [GParted](https://gparted.org/download.php) or [Gnome-disk-utility](https://wiki.gnome.org/Apps/Disks).
  > ![](images/clonezilla/0-divide_disk.png)  
  > The bigger partition will be used to store the copy of the target partition.    
  > The smaller partition (0.5-1GB is enough) will be used to store the copy of EFI system.    

### Copy the target partition
  1. Boot the computer from the USB flash drive.

  2. Choose Clonezilla live (Default settings, VGA 800x600).
  ![](images/clonezilla/1.jpg)

  3. Choose language
  ![](images/clonezilla/2-language.jpg)

  4. Keep default keyboard layout
  ![](images/clonezilla/3-keyboard.jpg)

  5. Start Clonezilla
  ![](images/clonezilla/4-start.jpg)

  6. Choose device-device work directly from a disk or partition to a disk or partition
  ![](images/clonezilla/5-device-device.jpg)

  7. Choose Beginner mode
  ![](images/clonezilla/6-beginner.jpg)

  8. Choose part_to_local_part
  ![](images/clonezilla/7-local-partition.jpg)

  9. Choose the source partition
  - In this case, `sda5` store the Ubuntu partition.
  ![](images/clonezilla/8-source-partition.jpg)

  10. Choose the destination partition
  - In this case, `sdb2` store the copy of the Ubuntu partition.
  ![](images/clonezilla/9-destination.jpg)

  11. Choose skip checking the source partition
  ![](images/clonezilla/10-skip.jpg)

  12. Choose reboot
  ![](images/clonezilla/11-reboot.jpg)

  13. Select yes to start the copy process
  ![](images/clonezilla/12-yes.jpg)

### Copy the EFI system partition   
  1. Boot the computer from the USB flash drive.   

  2. Choose Clonezilla live (Default settings, VGA 800x600).  
  ![](images/clonezilla/1.jpg)

  3. Choose language   
  ![](images/clonezilla/2-language.jpg)

  4. Keep default keyboard layout
  ![](images/clonezilla/3-keyboard.jpg)

  5. Start Clonezilla
  ![](images/clonezilla/4-start.jpg)

  6. Choose device-device work directly from a disk or partition to a disk or partition
  ![](images/clonezilla/5-device-device.jpg)

  7. Choose Beginner mode
  ![](images/clonezilla/6-beginner.jpg)

  8. Choose part_to_local_part
  ![](images/clonezilla/7-local-partition.jpg)

  9. Choose the source partition   
  - In this case, `sda1` store the EFI system partition.
  ![](images/clonezilla/13-source-partition.jpg)

  10. Choose the destination partition
  - In this case, `sdb1` store the copy of the EFI system partition.
  ![](images/clonezilla/14-destination.jpg)

  11. Skip checking the source partition
  ![](images/clonezilla/10-skip.jpg)

  12. Choose reboot
  ![](images/clonezilla/11-reboot.jpg)

  13. Select yes to start the copy process
  ![](images/clonezilla/12-yes.jpg)

## Notes
> [!Info]
> There might be an another way to copy the both EFI system and Ubuntu at the same time (choose device-image instead of device-device work directly). However, I have failed serval times, I will update this note if I find a way to do it. 

## Reference
- [Official website - Download Clonezilla iso](https://clonezilla.nchc.org.tw/clonezilla-live/download/download.php?branch=alternative)
- [Forum - 再生龍Clonezilla製作還原檔及還原光碟](https://www.mobile01.com/topicdetail.php?f=300&t=1198072)
- [Instruction - Ubuntu hard disk read only](https://juejin.cn/s/hard%20disk%20read%20only%20ubuntu)
- [Youtube - 再生龍拷貝硬碟](https://www.youtube.com/watch?v=6LcYmS_KJyI)
- [Stack Overflow - Clonezilla script fails: Unable to find target hard drive](https://stackoverflow.com/questions/73522748/clonezilla-script-fails-unable-to-find-target-hard-drive)