#!/bin/sh
# Launch turtlebot in gazeboworld
xterm -e " source /opt/ros/kinetic/setup.bash;
source /home/workspace/catkin_ws/devel/setup.bash;
roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=/home/workspace/catkin_ws/src/myDirectories/tore.world" &
sleep 5
# Launch teleop_keyboard
xterm -e " source /opt/ros/kinetic/setup.bash;
source /home/workspace/catkin_ws/devel/setup.bash;
roslaunch turtlebot_teleop keyboard_teleop.launch" &
sleep 3
# Launch rviz
xterm -e " source /opt/ros/kinetic/setup.bash;
source /home/workspace/catkin_ws/devel/setup.bash;
roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5
# Launch amcl
xterm -e " source /opt/ros/kinetic/setup.bash;
source /home/workspace/catkin_ws/devel/setup.bash;
roslaunch turtlebot_gazebo amcl_demo.launch"