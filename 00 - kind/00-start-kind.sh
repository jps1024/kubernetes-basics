#!/usr/bin/env bash

CLUSTERNAME=k2
KINDCONFIG=01-kind-config.yaml

echo
echo "Creating the k8s cluster \"${CLUSTERNAME}\" according to ${KINDCONFIG}"
kind create cluster --name ${CLUSTERNAME} --config ${KINDCONFIG} --image docker.io/kindest/node:v1.25.3
#kind create cluster --name ${CLUSTERNAME} --config ${KINDCONFIG} --image docker.io/kindest/node:v1.21.1

echo
echo "Applying Project Contour to the k8s cluster"
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml

echo
echo "Patching Project Contour for Kind-specifics"
kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/control-plane","operator":"Equal","effect":"NoSchedule"},{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'
