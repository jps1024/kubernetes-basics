#!/usr/bin/env bash

docker pull              busybox:1.37.0
kind   load docker-image busybox:1.37.0         --name ${CLUSTERNAME}

docker pull              docker.io/nginx:1.21.3
kind   load docker-image docker.io/nginx:1.21.3 --name ${CLUSTERNAME}
