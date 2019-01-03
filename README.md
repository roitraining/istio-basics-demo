
# istio-basics-demo

## Setup

### Setup tasks
1. Open Cloud Shell in a project you own
1. Clone this repo to Cloud Shell `git clone https://github.com/roitraining/istio-basics-demo`
1. Run the setup script `. istio-basics-demo/setup.sh`
1. Open the Slides document here: link

The setup script does the following:
* Enables the GKE api in your project
* Creates a GKE cluster
* Downloads a directory of istio files, including demo files
* Installs Istio, then shows pods and services for Istio
* Enables sidecar injection
* Deploys the bookinfo application
* Deploys the bookinfo gateway
* Shows pods and services

### Key setup concepts
+ This deployment will work on any k8s cluster; we just happen to be using GKE.
+ Sidecar injection is used to automatically insert and configure the Envoy proxy container into pods deployed without having to change the pod/deployment definitions
+ An Istio gateway replaces a traditional Ingress object. It works like so...
1. A **Load Balancer** forwards traffic to a **Node**
2. On **Node**, traffic is delivered to **Istio IngressGateway Service** 
3. **Istio IngressGateway Service** forwards to an **Istio IngressGateway Pod**
3. **Istio IngressGateway Pod** is configured by a Gateway and a VirtualService.
4. **Istio IngressGateway Pod** forwards traffic a **Service**.
5. **Service** forwards to an **Pod**.

![enter image description here](https://blog.jayway.com/wp-content/uploads/2018/10/istio-networking.png)

## Demo

### Intro
1. Describe the application architecture
1. Describe the cluster and deployment architecture
1. Talk through the challenges in managing a mesh of services
1. "Wouldn't be nice if we had something that made this easy"

### Traffic routing use cases
1. Show them app with v1 apis (run first two snippets in snippets.txt); refresh multiple times
1. Discuss a/b testing of two new version
1. Run a/b snippet, and demo 50/50 split.
1. Discuss how this can be done in k8s but is being done a level higher
1. Discuss real-world need to canary with specific users or customers
1. Run canary by user snippet and demo login vs. no routing

### Istio architecture


### Istio implementation
1. Show stuff in Istio deployment