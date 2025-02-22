#!/usr/bin/env bash

source /opt/OpenDDS/setenv.sh
source /opt/ros/humble/setup.bash
source install/local_setup.bash
printenv|grep DDS
printenv|grep ROS

export RMW_IMPLEMENTATION=rmw_opendds_cpp
printenv|grep RMW

rm sub.out
stdbuf -o0 ros2 run examples_rclcpp_minimal_subscriber subscriber_member_function_twenty &> sub.out&
process_id=$!
ros2 run examples_rclcpp_minimal_publisher publisher_member_function_twenty
wait $process_id
cat sub.out
grep "I heard" sub.out
