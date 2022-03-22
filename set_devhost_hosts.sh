#!/bin/sh
devhost_ip=`getent hosts devhost | awk '{ print $1 }'`
[ -z "$devhost_ip" ] && sudo echo "172.18.0.2 devhost" >> /etc/hosts

