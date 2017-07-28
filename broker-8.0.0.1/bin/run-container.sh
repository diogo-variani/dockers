#!/bin/bash

UID=$1

GID=$2

OLD_UID=$(id -u mqm)

OLD_GID=$(id -g mqm)

if [ $(id -u mqm) != $UID ]; then 
	usermod -u $UID mqm

	find / -user $OLD_UID -exec chown -h mqm {} \; 2>/dev/null
fi

if [ $(id -g mqm) != $GID ]; then 
	groupmod -g $GID mqm

	find / -group $OLD_GID -exec chgrp -h mqm {} \; 2>/dev/null
fi

su - mqm
