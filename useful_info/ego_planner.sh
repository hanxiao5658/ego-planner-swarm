#! /bin/bash

PYTHONPATH=/opt/ros/noetic/lib/python3/dist-packages
source /opt/ros/noetic/setup.bash
source ~/catkin_ws/devel/setup.bash
#export ROS_HOSTNAME=localhost
#export ROS_MASTER_URI=http://localhost:11311



# Gazebo
gnome-terminal --tab --title="ego_planner" -- bash -c "roslaunch ego_planner single_run_in_gazebo.launch"
echo "roslaunch ego_planner single_run_in_gazebo.launch"
sleep 2s

# controller
gnome-terminal --tab --title="px4ctrl" -- bash -c "roslaunch px4ctrl run_node.launch"
echo "roslaunch px4ctrl run_node.launch"
sleep 2s

# swich
gnome-terminal --tab --title="swich" -- bash -c "rosrun rqt_reconfigure rqt_reconfigure"
echo "rosrun rqt_reconfigure rqt_reconfigure"
sleep 2s


# rviz
gnome-terminal --tab --title="rviz" -- bash -c "roslaunch ego_planner rviz.launch"
echo "roslaunch ego_planner rviz.launch" 
sleep 2s
