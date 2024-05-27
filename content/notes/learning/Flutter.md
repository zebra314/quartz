---
title: Flutter
---
[[software]]

## Install

```sh
yay -S flutter android-sdk android-sdk-build-tools android-sdk-cmdline-tools-latest android-platform android-sdk-platform-tools
```

```sh
sudo cp -R /opt/android-sdk ~
cd ~  
sudo chown -R yourusername:yourgroupname android-sdk # alfonso:alfonso
```

```sh
export ANDROID_HOME=$HOME/android-sdk  
export PATH=$PATH:$ANDROID_HOME/platform-tools 
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
```

```sh
flutter config --jdk-dir=/usr/lib/jvm/java-17-openjdk
yes | flutter doctor --android-licenses
```

-  My default java version: 21

## Inference

-  [Setup guide](https://medium.com/@rajgadhiya011/how-to-setup-flutter-on-arch-linux-with-android-sdk-a-step-by-step-guide-f40450b55669)