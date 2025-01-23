#! /bin/bash

PYTHONPATH=/opt/ros/noetic/lib/python3/dist-packages
source /opt/ros/noetic/setup.bash
source ~/catkin_ws/devel/setup.bash
#export ROS_HOSTNAME=localhost
#export ROS_MASTER_URI=http://localhost:11311


echo "starting ardupilot sim"
test

# Gazebo
gnome-terminal --tab --title="roscore" -- bash -c "roscore"
echo "roscore"
sleep 2s

# Gazebo
gnome-terminal --tab --title="gazebo" -- bash -c "roslaunch gazebo_ros iris_stereo.launch"
echo "roslaunch gazebo_ros iris_copter_demo.launch"
sleep 2s

# SITL
gnome-terminal --tab --title="ardupilot1" -- bash -c "cd ~/my_project/ardupilot/ArduCopter/; sim_vehicle.py -f gazebo-iris  --custom-location=37.632452,141.012776,0,0 --console --map  --instance 0"
echo "cd ardupilot/ArduCopter; sim_vehicle.py -f gazebo-iris --instance 0"
sleep 2s


# MAVROS
gnome-terminal --tab --title="apm1" -- bash -c "roslaunch gusu_drone apm1_stereo.launch"
echo "roslaunch my_drone apm1_stereo.launch" 
sleep 2s


gnome-terminal --tab --title="bridge" -- bash -c "rosrun gusu_drone my_gazebo_apm_bridge.py"
echo "rosrun my_drone my_gazebo_apm_bridge2.py" 
sleep 2s

gnome-terminal --tab --title="bridge2" -- bash -c "rosrun gusu_drone my_set_origin2.py"
echo "rosrun my_drone my_set_origin2.py" 
sleep 2s

#position input
gnome-terminal --tab --title="posinput" -- bash -c "rosrun gusu_drone position_input.py"
echo "rosrun my_drone position_input.py" 
sleep 2s




