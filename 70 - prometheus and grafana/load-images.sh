#!/usr/bin/env bash

CLUSTERNAME=k2

docker pull              docker.io/prom/prometheus:v2.44.0
kind   load docker-image docker.io/prom/prometheus:v2.44.0 --name ${CLUSTERNAME}

docker pull              docker.io/grafana/grafana:12.3
kind   load docker-image docker.io/grafana/grafana:12.3    --name ${CLUSTERNAME}
