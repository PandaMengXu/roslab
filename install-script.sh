#update repo of apt-get
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
if [ "$?" != 0 ]
then 
	echo "error at 1"
	read -n 1 -s
fi
#register the pub key into apt-get
sudo apt-key add meng-ros-install/key-ros
if [ "$?" != 0 ]
then 
	echo "error at 2"
	read -n 1 -s
fi
#install bootstrap dep
sudo apt-get install python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential -y
if [ "$?" != 0 ]
then 
	echo "error at 3"
	read -n 1 -s
fi

sudo rosdep init
if [ "$?" != 0 ]
then 
	echo "error at 4"
	read -n 1 -s
fi

rosdep update
if [ "$?" != 0 ]
then 
	echo "error at 5"
	read -n 1 -s
fi

mkdir ~/ros_catkin_ws
cd ~/ros_catkin_ws

rosinstall_generator desktop --rosdistro hydro --deps --wet-only --tar > hydro-desktop-wet.rosinstall
if [ "$?" != 0 ]
then 
	echo "error at 6"
	read -n 1 -s
fi

wstool init -j8 src hydro-desktop-wet.rosinstall
if [ "$?" != 0 ]
then 
	echo "error at 7"
	read -n 1 -s
fi

rosdep install --from-paths src --ignore-src --rosdistro hydro -y
if [ "$?" != 0 ]
then 
	echo "error at 8"
	read -n 1 -s
fi

./src/catkin/bin/catkin_make_isolated --install
if [ "$?" != 0 ]
then 
	echo "error at 9"
	read -n 1 -s
fi

source ~/ros_catkin_ws/install_isolated/setup.bash


#follow the website
#http://wiki.ros.org/hydro/Installation/Source
