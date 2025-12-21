#!/usr/bin/env bash

docker pull              docker.io/alpine:3.20
kind   load docker-image docker.io/alpine:3.20 --name ${CLUSTERNAME}
