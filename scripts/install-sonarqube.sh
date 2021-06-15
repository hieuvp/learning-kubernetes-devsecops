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

POD_NAME=$(kubectl get pods --namespace sonarqube -l "app=sonarqube,release=sonarqube" -o jsonpath="{.items[0].metadata.name}")

# The default login is admin/admin
