1.
/home/ubuntu/ego_planner_pkg/catkin_src/ego_planner/ego-planner-swarm/src/planner/plan_manage/launch
check advanced_param.xml
    <param name="grid_map/resolution"      value="1.5" /> 
    <param name="grid_map/obstacles_inflation"     value="6" /> 
obstacles_inflation can be set lager if drone touch to the obstacle while it flying.
and make sure obstacles_inflation >= resolution x 4

2.
/home/ubuntu/ego_planner_pkg/catkin_src/ego_planner/ego-planner-swarm/src/planner/plan_manage/launch
check single_run_in_gazebo.launch
    <arg name="odom_topic" value="/drone1/mavros/local_position/odom"/>  uav position topic
    <arg name="depth_topic" value="/camera/depth/image_raw"/>   depth camera topic
    <arg name="cmd_topic" value="planning/pos_cmd"/>   planned pose output topic #1
       
        #camera parameter below(rostopic echo /camera/depth/camera_info)
        <arg name="cx" value="320.0"/>
        <arg name="cy" value="240.0"/>
        <arg name="fx" value="319.9348449707031"/>
        <arg name="fy" value="319.9348449707031"/>   
        
        #set max speed here
        <arg name="max_vel" value="1" />
        <arg name="max_acc" value="1.5" />
        
        #should be set 1. and 2 does not work?
        <arg name="flight_type" value="1" />
        
3.
/home/ubuntu/ego_planner_pkg/catkin_src/ego_planner/px4ctrl/launch
check run_node.launch
            <remap from="odom" to="/drone1/mavros/local_position/odom" /> uav position 
            <remap from="cmd" to="planning/pos_cmd" /> planned pose output topic make sure it is same with #1
        
4.
/home/ubuntu/ego_planner_pkg/catkin_src/ego_planner/px4ctrl/config
check ctrl_param_fpv.yaml
 hov_percent : 0.5 
 hover_percentage: 0.5  the value when the uav hover with attitude control mode(~/mavros/setpoint_raw/attitude)       


if multi_map_server/MultiOccupancyGrid.h:No such file or dirctory happens,
copy /multi_map_server(MultiOccupancyGrid.h~VerticalOccupancyGridList.h) to ~/catkin_ws/src/ego_planner/ego-planner-swarm/src/uav_simulator/Utils/multi_map_server/include/multi_map_server
