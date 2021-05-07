#!/bin/sh
kubectl delete namespace student43-ratings-dev
kubectl delete namespace student43-ratings-uat
kubectl delete namespace student43-ratings-prd
kubectl create namespace student43-ratings-dev
kubectl create namespace student43-ratings-uat
kubectl create namespace student43-ratings-prd
kubectl config set-context $(kubectl config current-context) --namespace=student43-ratings-dev
kubectl create secret generic registry-ratings --from-file=.dockerconfigjson=$HOME/.docker/config.json --type=kubernetes.io/dockerconfigjson
kubectl create configmap ratings-dev-ratings-mongodb-initdb --from-file=databases/ratings_data.json --from-file=databases/script.sh
helm install -f k8s/helm-values/values-ratings-dev-ratings-mongodb.yaml ratings-dev-ratings-mongodb bitnami/mongodb