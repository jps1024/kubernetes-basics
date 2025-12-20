#!/usr/bin/env bash

CLUSTERNAME=k2

docker pull              docker.io/bitnamilegacy/mariadb:12.0.2-debian-12-r0
kind   load docker-image docker.io/bitnamilegacy/mariadb:12.0.2-debian-12-r0          --name ${CLUSTERNAME}

docker pull              docker.io/bitnamilegacy/os-shell:12-debian-12-r50
kind   load docker-image docker.io/bitnamilegacy/os-shell:12-debian-12-r50            --name ${CLUSTERNAME}

docker pull              docker.io/bitnamilegacy/mysqld-exporter:0.17.2-debian-12-r16
kind   load docker-image docker.io/bitnamilegacy/mysqld-exporter:0.17.2-debian-12-r16 --name ${CLUSTERNAME}
