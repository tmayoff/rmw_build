#!/usr/bin/env bash

. /opt/ros/$ROS_DISTRO/setup.bash

dpkg -l ros-foxy-cyclonedds &>/dev/null
if [ $? == 1 ];then
    apt update
    apt install -y ros-foxy-cyclonedds
fi

colcon build --symlink-install --cmake-args '-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON' '-DCMAKE_BUILD_TYPE=Debug' --packages-up-to rmw_cyclonedds_cpp
