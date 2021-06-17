#!/usr/bin/env bash

set -eoux pipefail

# minikube stop
# minikube delete

minikube start --driver=virtualbox

helm upgrade --install \
  cert-manager jetstack/cert-manager \
  --namespace=cert-manager --create-namespace \
  --version=v1.4.0 \
  --set installCRDs=true

sleep 60

cd actions-runner-controller
helm upgrade --install \
  --namespace=actions-runner-system --create-namespace \
  actions-runner-controller ./
