#!/bin/sh
docker swarm init --advertise-addr `ip -f inet6 addr show eth0 | awk '/inet6 / {print $2}' | cut -d/ -f1` 
	
