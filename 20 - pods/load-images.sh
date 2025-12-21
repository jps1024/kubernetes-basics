#!/usr/bin/env bash

docker pull              hashicorp/http-echo:0.2.3
kind   load docker-image hashicorp/http-echo:0.2.3 --name ${CLUSTERNAME}
