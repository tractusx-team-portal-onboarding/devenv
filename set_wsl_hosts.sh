#!/bin/sh
wsl_ip=`getent hosts wsl | awk '{ print $1 }'`
[ -z "$wsl_ip" ] && sudo echo "169.254.254.2 wsl" >> /etc/hosts
