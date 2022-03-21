#!/bin/sh
has_wsl=`grep "169.254.254.2 wsl" /etc/hosts`
[ -z "$has_wsl" ] && sudo echo "169.254.254.2 wsl" >> /etc/hosts

