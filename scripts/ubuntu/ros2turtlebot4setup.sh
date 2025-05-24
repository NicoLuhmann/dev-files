#!/bin/bash
set -e

# set script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Source utils.sh from parent directory
source "$SCRIPT_DIR/utils.sh"

# Get Ubuntu version
UBUNTU_VERSION=$(lsb_release -rs)

# set ros distribution based on Ubuntu version
if [[ "$UBUNTU_VERSION" == "22.04" ]]; then
  DISTRO="humble"
elif [[ "$UBUNTU_VERSION" == "24.04" ]]; then
  DISTRO="jazzy"
else
  echo "Unsupported Ubuntu version: $UBUNTU_VERSION"
  exit 1
fi

# install common packages
install_packages software-properties-common curl gnupg lsb-release python3 python3-pip wget

# locales
install_packages locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# repositories & keys
sudo add-apt-repository universe
sudo apt update -y

# ROS 2 GPG key and repository
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update -y

# Gazebo
if [[ "$UBUNTU_VERSION" == "22.04" ]]; then
    sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
    wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
    install_packages ignition-fortress
elif [[ "$UBUNTU_VERSION" == "24.04" ]]; then
    sudo curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
    install_packages gz-harmonic
fi

# ros packages
install_packages ros-dev-tools ros-"$DISTRO"-desktop ros-"$DISTRO"-irobot-create-nodes
# turtlebot 4 packages
install_packages ros-"$DISTRO"-turtlebot4-description ros-"$DISTRO"-turtlebot4-msgs ros-"$DISTRO"-turtlebot4-navigation ros-"$DISTRO"-turtlebot4-node ros-"$DISTRO"-turtlebot4-simulator ros-"$DISTRO"-turtlebot4-desktop

# initialize and update rosdep
sudo rosdep init || true
rosdep update

# load ros automatically into bash
echo "source /opt/ros/$DISTRO/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "successful ros setup"