# istio-basics-demo

## Setup

### Setup tasks
1. Open Cloud Shell in a project you own
1. Clone this repo to Cloud Shell `git clone https://github.com/roitraining/istio-basics-demo`
1. Run the setup script `. istio-basics-demo/setup.sh`
1. Open the Slides document here: link

The setup script does the following:
* Enables the GKE API in your project
* Creates a GKE cluster
* Downloads a directory of istio files, including demo files
* Enables sidecar injection
* Deploys the bookinfo application
* Deploys the bookinfo gateway

### Key setup concepts
+ This deployment will work on any k8s cluster; we just happen to be using GKE.
+ Sidecar injection is used to automatically insert and configure the Envoy proxy container into pods deployed without having to change the pod/deployment definitions
+ An Istio gateway replaces a traditional Ingress object. It works like so (to be replaced with better text/image)...
1. A Load Balancer forwards traffic to a Node
2. On Node, traffic is delivered to Istio IngressGateway service 
3. Istio IngressGateway service forwards to an Istio IngressGateway pod
3. Istio IngressGateway pod is configured by a Gateway and a VirtualService.
4. Istio IngressGateway pod forwards traffic a service.
5. Service forwards to an Pod.

![enter image description here](https://blog.jayway.com/wp-content/uploads/2018/10/istio-networking.png)

## Demo

### Intro
1. Describe the application architecture
1. Talk through the challenges in managing a mesh of services
1. Describe the cluster and deployment architecture
1. "Wouldn't be nice if we had something that made this easy?"
1. Istio architecture

### Istio implementation
1. Show services and pods deployed as part of Istio install (run istio installation snippet)
1. Show Istio install in GKE UI (services and workloads)
1. Show Service Graph and discuss. Run service graph snippet, and then use Cloud Shell preview pointed at port 8088. Visit `/dotviz`.
1. Show Grafana and discuss. Run grafana snippet to build tunnel in Cloud Shell, the use Cloud Shell preview pointed to port 3000, and visit `/dashboard/db/istio-dashboard`.
1. Show Traceing and discuss. Run tracing snippet and use Cloud Shell preview pointed at port 16686.

### App implementation
1. Show app workloads in GKE UI and discuss
1. Show app services in GKE UI and discuss

### Traffic routing use cases
Set up destination rules
1. Run *destination rules* snippet in `snippets.txt` to create the destination rules
2. Review `samples/bookinfo/networking/destination-rule-all-mtls.yaml`

Set routing to version 1
1. Run *use v1* snippet
2. Run *get the url* snippet to get URL for app
3. Review `samples/bookinfo/networking/virtual-service-all-v1.yaml`
4. Visit app URL, and refresh multiple times and call out no starts

Set routing to A/B testing of new versions
1. Run *a/b* snippet
2. Review `samples/bookinfo/networking/virtual-service-reviews-v2-v3.yaml`
3. Demo 50/50 split by refreshing app multiple times
4. Discuss how this can be done in k8s but is being done a level higher

Set routing to per-user
1. Discuss real-world need to canary with specific users or customers
2. Run *canary by user* snippet
3. Review `samples/bookinfo/networking/virtual-service-reviews-test-v2.yaml
4. Demo login vs. no routing (log in as jason with no password)

## Cleanup
Run `. ../istio-basics-demo/cleanup.sh`