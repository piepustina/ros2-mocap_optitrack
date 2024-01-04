#!/bin/bash
# Script that compiles the ROS2 "mocap_optitrack_client" node and runs it.

# File to be launched
LAUNCH_FILE="launch_natnet_client.py"

# Directory of the script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


# Move to the correct folder
cd ${SCRIPT_DIR%shell_script}

# Build the ROS2 package
echo "Building the package..."
colcon build --packages-select mocap_optitrack_client mocap_optitrack_interfaces

# Source the package
echo "Sourcing the package..."
. install/setup.bash

# Run the node
echo "Running the node..."
ros2 launch launch/$LAUNCH_FILE