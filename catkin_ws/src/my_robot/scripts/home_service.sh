source /opt/ros/kinetic/setup.bash
source /home/workspace/catkin_ws/devel/setup.bash
#!/bin/sh
# Launch turtlebot in gazeboworld
xterm -e "roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$(rospack find my_robot)/map/tore.world" &
sleep 9
# Launch amcl
xterm -e "roslaunch turtlebot_gazebo amcl_demo.launch map_file:=$(rospack find my_robot)/map/tore.yaml" &
sleep 5
# Launch rviz
xterm -e "roslaunch my_robot view_navigation.launch" &
sleep 5
## Launch add_marker
xterm -e "rosrun my_robot add_markers" &
sleep 5
# Launch pick_objects
xterm -e "rosrun my_robot pick_objects"