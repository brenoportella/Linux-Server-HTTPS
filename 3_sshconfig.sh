#!/bin/bash 
set -e
# Disable root login via SSH
if grep -q "^PermitRootLogin" /etc/ssh/sshd_config; then
    sed -i "s/^PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config
else
    echo "PermitRootLogin no" >> /etc/ssh/sshd_config
fi