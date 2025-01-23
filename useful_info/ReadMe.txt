start my_gazebo
$./my_gazebo.sh

set streamrate 100
GUIDED
arm throttle
takeoff 1

start ego_planner
$./ego_planner.sh

go to the window which opened by swich terminal
check cmd and mode in px4ctrol box

go to the position input terminal and input x,y,z and yaw
