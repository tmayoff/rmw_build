#!/usr/bin/env bash

. /opt/ros/$ROS_DISTRO/setup.bash
colcon build --symlink-install --cmake-args '-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON' '-DCMAKE_BUILD_TYPE=Debug' --packages-up-to rmw_opendds_cpp
