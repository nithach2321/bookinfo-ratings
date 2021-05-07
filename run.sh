#!/bin/sh
kubectl delete namespace student43-bookinfo-dev
kubectl delete namespace student43-bookinfo-uat
kubectl delete namespace student43-bookinfo-prd
kubectl create namespace student43-bookinfo-dev
kubectl create namespace student43-bookinfo-uat
kubectl create namespace student43-bookinfo-prd
kubectl config set-context $(kubectl config current-context) --namespace=student43-bookinfo-uat
kubectl create secret generic registry-bookinfo --from-file=.dockerconfigjson=$HOME/.docker/config.json --type=kubernetes.io/dockerconfigjson
kubectl config set-context $(kubectl config current-context) --namespace=student43-bookinfo-prd
kubectl create secret generic registry-bookinfo --from-file=.dockerconfigjson=$HOME/.docker/config.json --type=kubernetes.io/dockerconfigjson
kubectl config set-context $(kubectl config current-context) --namespace=student43-bookinfo-dev
kubectl create secret generic registry-bookinfo --from-file=.dockerconfigjson=$HOME/.docker/config.json --type=kubernetes.io/dockerconfigjson
kubectl create configmap bookinfo-dev-ratings-mongodb-initdb --from-file=databases/ratings_data.json --from-file=databases/script.sh
helm install -f k8s/helm-values/values-bookinfo-dev-ratings-mongodb.yaml bookinfo-dev-ratings-mongodb bitnami/mongodb