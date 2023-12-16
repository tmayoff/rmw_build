#!/usr/bin/env bash
script=`realpath $0`
script_path=`dirname $script`

if [ ! -d "src" ];then
    echo "no src"
    mkdir src
fi

vcs import src < $script_path/ros2.repos
vcs import src < $script_path/rmw_opendds.repos

rosdep update

rosdep install -y --from-paths src --ignore-src --skip-keys "opendds libopendds opendds_cmake_module rosidl_typesupport_opendds_c rosidl_typesupport_opendds_cpp"
