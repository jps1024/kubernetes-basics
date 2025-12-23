#!/usr/bin/env bash

CLUSTERNAME=k2

docker pull              hashicorp/http-echo:0.2.3
kind   load docker-image hashicorp/http-echo:0.2.3 --name ${CLUSTERNAME}
