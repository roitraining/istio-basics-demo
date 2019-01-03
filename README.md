
# istio-basics-demo

## Setup

### Setup tasks
1. Open Cloud Shell in a project you own
1. Clone this repo to Cloud Shell `git clone https://github.com/roitraining/istio-basics-demo`
1. Run the setup script `. istio-basics-demo/setup.sh`

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