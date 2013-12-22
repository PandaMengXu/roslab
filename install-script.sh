#update repo of apt-get
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
#register the pub key into apt-get
sudo apt-key add meng-ros-install/key-ros
#install bootstrap dep
sudo apt-get install python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential
#follow the website
http://wiki.ros.org/hydro/Installation/Source
