# Obsidian
1. Downlaod the AppImage and the image of icon
2. Create ```.local/share/applications/obsidian.desktop```
3. .local/share/applications/obsidian.desktop :
	```
	[Desktop Entry] 
	Name=Obsidian 
	Exec= the/path/of/AppImage %u 
	Terminal=false 
	Type=Application 
	Icon= the/path/of/icon.png
	StartupWMClass=obsidian 
	X-AppImage-Version=0.8.15 
	Comment=Obsidian 
	Categories=Office; 
	MimeType=text/html;
	x-scheme-handler/obsidian;
	```
# Git
# LOL
1. Install Lutris and Wine.
2. Install lol from lutris gui.
3. If fail to launch the game, install the right game driver(correspond to the lol version) in 
```/home/alfonso/.local/share/lutris/runners/wine``` or just revise the file name in directory.
# ROS
1. Install [miniconda](https://docs.conda.io/en/latest/miniconda.html)
2. Install [robostack](https://robostack.github.io/index.html)
3. Install ros pkg follow the instruction in robostack pages.
4. Self made quick init script, put it in home page or change the path in the file.
```bash
#!/bin/bash

# >>> choose workspace >>>
folder_path="/home/alfonso/ROS"
workstations=($(ls "$folder_path"))
for ((i=0; i<${#workstations[@]}; i++)); do
    echo "$(($i+1)). ${workstations[$i]}"
done

read -p "Choose the number: " selection

if ! [[ $selection =~ ^[0-9]+$ ]] || [ "$selection" -lt 1 ] || [ "$selection" -gt "${#workstations[@]}" ]; then
    echo "error"
    exit 1
fi

selected_workstation="${workstations[$((selection-1))]}"
cd "$folder_path/$selected_workstation/"
echo "---------------------------------"
echo "$selected_workstation is choosed"
# <<< choose workspace <<<

# >>> Check ROS version of the chosen workstation
# Search for folders containing "/install"
version=1
install_folders=($(find $folder_path/$selected_workstation/ -type d -name "install"))
if [ "${#install_folders[@]}" -gt 0 ]; then # -gt means greater than
    version=2
fi
# <<< Check ROS version of the chosen workstation

# Source the workspace
if [ "$version" -eq 2 ]; then
    # !!Ｉf first build the workspace!!
    # You should run "source /opt/ros/humble/setup.bash" instead
    source "$folder_path/$selected_workstation/install/setup.bash"
fi

if [ "$version" -eq 1 ]; then

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/alfonso/Applications/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/alfonso/Applications/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/alfonso/Applications/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/alfonso/Applications/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    # >>> Activate conda env
    ros_env="ros${version}_env"
    conda activate $ros_env
    # <<< Activate conda env 

    source "$folder_path/$selected_workstation/devel/setup.bash"
fi
```

