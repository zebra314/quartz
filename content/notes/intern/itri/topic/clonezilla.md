---
title: Clonezilla
enableToc: true
tags:
- intern
---

## Reference
- [Official website - Download Clonezilla iso](https://clonezilla.nchc.org.tw/clonezilla-live/download/download.php?branch=alternative)
- [Forum - 再生龍Clonezilla製作還原檔及還原光碟](https://www.mobile01.com/topicdetail.php?f=300&t=1198072)
- [Instruction - Ubuntu hard disk read only](https://juejin.cn/s/hard%20disk%20read%20only%20ubuntu)
- [Youtube - 再生龍拷貝硬碟](https://www.youtube.com/watch?v=6LcYmS_KJyI)
- [Stack Overflow - Clonezilla script fails: Unable to find target hard drive](https://stackoverflow.com/questions/73522748/clonezilla-script-fails-unable-to-find-target-hard-drive)

## Usage
- To clone a hard disk partition from a dual-boot system

### Requirements
- A USB flash drive
  > It will be used to boot Clonezilla.
- A hard disk drive
  > It will be used to store the copy of the partition.

  > [!Warning]
  > Make sure the total space of this hard disk drive is larger than the size of the partition you want to copy.
  >  
  > For example, if you want to copy a 512GB partition with 100GB used space, the hard disk drive should have at least 512GB space. If the hard disk drive has only 256GB space, although it is enough to store the used space, the copy process will still fail.

### Steps
1.Download the Clonezilla iso file from the [official website](https://clonezilla.nchc.org.tw/clonezilla-live/download/download.php?branch=alternative).

2.Burn the iso file to the USB flash drive using [Rufus](https://rufus.ie/) or [Raspberry imager](https://www.raspberrypi.com/software/).

3.Divide the hard disk drive into two partitions using [GParted](https://gparted.org/download.php) or [Gnome-disk-utility](https://wiki.gnome.org/Apps/Disks).
  > ![divided hard disk drive](notes/images/clonezilla/0-divide_disk.png)
  > - The bigger partition will be used to store the copy of the target partition.
  > - The smaller partition (0.5-1GB is enough) will be used to store the copy of EFI system.

4.Copy the target partition
  - Boot the computer from the USB flash drive.
  - Choose Clonezilla live (Default settings, VGA 800x600).
  ![1](notes/images/clonezilla/1.jpg)
  - Choose language
  ![2](notes/images/clonezilla/2-language.jpg)
  - Keep default keyboard layout
  ![3](notes/images/clonezilla/3-keyboard.jpg)
  - Start Clonezilla
  ![4](notes/images/clonezilla/4-start.jpg)
  - Choose device-device work directly from a disk or partition to a disk or partition
  ![5](notes/images/clonezilla/5-device-device.jpg)
  - Choose Beginner mode
  ![6](notes/images/clonezilla/6-beginner.jpg)
  - Choose partition to local partition
  ![7](notes/images/clonezilla/7-local-partition.jpg)
  - Choose the target partition
  ![8](notes/images/clonezilla/8-target-partition.jpg)
  - Choose the destination partition
  ![9](notes/images/clonezilla/9-hard-disk.jpg)
  - Skip checking the source partition
  ![10](notes/images/clonezilla/10-skip.jpg)
  - Choose reboot
  ![11](notes/images/clonezilla/11-reboot.jpg)

5.Copy the EFI system partition
  - Boot the computer from the USB flash drive.
  - Choose Clonezilla live (Default settings, VGA 800x600).
  - Choose language
  - Keep default keyboard layout
  - Start Clonezilla
  - Choose device-device work directly from a disk or partition to a disk or partition
  - Choose Beginner mode
  - Choose partition to local partition