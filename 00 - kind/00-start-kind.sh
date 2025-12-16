#!/usr/bin/env bash

CLUSTERNAME=k2
KINDCONFIG=01-kind-config.yaml

echo
echo "Creating the k8s cluster \"${CLUSTERNAME}\" according to ${KINDCONFIG}"
kind create cluster --name ${CLUSTERNAME} --config ${KINDCONFIG} --image docker.io/kindest/node:v1.25.3
#kind create cluster --name ${CLUSTERNAME} --config ${KINDCONFIG} --image docker.io/kindest/node:v1.21.1

echo
echo "Preloading some Docker images into the Kind cluster"

docker pull              ghcr.io/projectcontour/contour:v1.33.0
kind   load docker-image ghcr.io/projectcontour/contour:v1.33.0        --name ${CLUSTERNAME}

docker pull              docker.io/envoyproxy/envoy:distroless-v1.35.6
kind   load docker-image docker.io/envoyproxy/envoy:distroless-v1.35.6 --name ${CLUSTERNAME}

docker pull              hashicorp/http-echo:0.2.3
kind   load docker-image hashicorp/http-echo:0.2.3                     --name ${CLUSTERNAME}

docker pull              busybox:1.37.0
kind   load docker-image busybox:1.37.0                                --name ${CLUSTERNAME}

docker pull              docker.io/nginx:1.21.3
kind   load docker-image docker.io/nginx:1.21.3                        --name ${CLUSTERNAME}

docker pull              docker.io/alpine:3.20
kind   load docker-image docker.io/alpine:3.20                         --name ${CLUSTERNAME}

echo
echo "Applying Project Contour to the k8s cluster"
kubectl apply -f contour.yaml

echo
echo "Patching Project Contour for Kind-specifics"
kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/control-plane","operator":"Equal","effect":"NoSchedule"},{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'
