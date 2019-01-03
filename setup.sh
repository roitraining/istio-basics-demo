#!/bin/bash

# Copyright 2019 ROI Training, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

gcloud services enable container.googleapis.com

# build the GKE cluster
gcloud container clusters create istio-demo \
    --cluster-version=latest \
    --num-nodes 4 \
    --zone us-central1-a

# set RBAC
kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin \
    --user=$(gcloud config get-value core/account)

# install Istio
curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.0.0 sh -
cd ./istio-*
export PATH=$PWD/bin:$PATH
kubectl apply -f install/kubernetes/istio-demo-auth.yaml
kubectl get svc -n istio-system
kubectl get pods -n istio-system

# deploy application with sidecar injection
kubectl label namespace default istio-injection=enabled
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml

# deploy the gateway
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml

# check out deployment
kubectl get services
kubectl get pods