#!/bin/bash

# Exit on error
set -e
# Ask for username
read -p "Enter the username to add: " USERNAME
# create user and add to sudo group
useradd --gecos "" $USERNAME
usermod -aG sudo $USERNAME
# Setup SSH for the new user
mkdir -p /home/$USERNAME/.ssh
chmod 700 /home/$USERNAME/.ssh
touch /home/$USERNAME/.ssh/authorized_keys
chmod 600 /home/$USERNAME/.ssh/authorized_keys
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
# Finish
echo "User $USERNAME added and granted sudo privileges."