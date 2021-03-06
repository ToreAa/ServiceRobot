#!/bin/sh
# Launch turtlebot in gazeboworld
xterm -e " source /opt/ros/kinetic/setup.bash;
source /home/workspace/catkin_ws/devel/setup.bash;
roslaunch turtlebot_gazebo turtlebot_world.launch world_file: $(rospack find myRobot)/map/tore.world" &
sleep 15
# Launch amcl
xterm -e " source /opt/ros/kinetic/setup.bash;
source /home/workspace/catkin_ws/devel/setup.bash;
roslaunch turtlebot_gazebo amcl_demo.launch map_file:= $(rospack find myRobot)/map/tore.yaml" &
sleep 5
# Launch teleop_keyboard
xterm -e " source /opt/ros/kinetic/setup.bash;
source /home/workspace/catkin_ws/devel/setup.bash;
roslaunch turtlebot_teleop keyboard_teleop.launch" &
sleep 3
# Launch rviz
xterm -e " source /opt/ros/kinetic/setup.bash;
source /home/workspace/catkin_ws/devel/setup.bash;
roslaunch turtlebot_rviz_launchers view_navigation.launch"


