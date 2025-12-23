#!/usr/bin/env bash

CLUSTERNAME=k2

docker pull              busybox:1.37.0
kind   load docker-image busybox:1.37.0 --name ${CLUSTERNAME}
