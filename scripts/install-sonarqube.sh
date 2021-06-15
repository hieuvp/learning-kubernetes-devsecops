#!/usr/bin/env bash

set -eoux pipefail

# minikube stop
# minikube delete

# minikube start --driver=virtualbox

cd sonarqube/charts/sonarqube
helm dependency update
kubectl create namespace sonarqube
helm upgrade --install \
  --values=values.yaml \
  --namespace=sonarqube \
  sonarqube ./
