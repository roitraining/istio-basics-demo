# istio-basics-demo

## Setup

### Setup tasks
1. Open Cloud Shell in a project you own
2. Clone this repo to Cloud Shell `git clone https://github.com/roitraining/istio-basics-demo`
3. Run the setup script `. istio-basics-demo/setup.sh`
4. Open the Slides document here: link

The setup script does the following:
* Enables the GKE API in your project
* Creates a GKE cluster
* Downloads a directory of istio files, including demo files
* Enables sidecar injection
* Deploys the bookinfo application
* Deploys the bookinfo gateway

### Key setup concepts
1. This deployment will work on any k8s cluster; we just happen to be using GKE.
1. Sidecar injection is used to automatically insert and configure the Envoy proxy container into pods deployed without having to change the pod/deployment definitions
1. An Istio gateway replaces a traditional Ingress object. It works like so (to be replaced with better text/image)...
    * A Load Balancer forwards traffic to a Node
    * On Node, traffic is delivered to Istio IngressGateway service 
    * Istio IngressGateway service forwards to an Istio IngressGateway pod
    * Istio IngressGateway pod is configured by a Gateway and a VirtualService.
    * Istio IngressGateway pod forwards traffic a service.
    * Service forwards to an Pod.

![enter image description here](https://blog.jayway.com/wp-content/uploads/2018/10/istio-networking.png)

## Demo

### Intro
Preso can be found here: (https://roi-links.com/2VujI9a)
1. Describe the application architecture
1. Talk through the challenges in managing a mesh of services
1. Describe the cluster and deployment architecture
1. "Wouldn't be nice if we had something that made this easy?"
1. Istio architecture

### Istio implementation
1. Show Istio install in GKE UI (services and workloads)

### App deployment
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

### General Istio info
1. Generate load against app
    1. In Cloud Shell, run the *generate load* snippet
1. Show Service Graph and discuss. 
    1. Run *service graph* snippet
    1. Use Cloud Shell preview pointed at port 8088. 
    1. Visit `https://8088-dot-<2952031>-dot-devshell.appspot.com/force/forcegraph.html `, substituting your proxy #
1. Show Grafana and discuss. 
    1. Run the *Grafana* snippet
    1. Use Cloud Shell preview pointed at port 3000. 
    1. Visit `https://3000-dot-<2952031>-dot-devshell.appspot.com/dashboard/db/istio-mesh-dashboard`, substituting your proxy #
1. Show Tracing and discuss. 
    1. Run *tracing* snippet
    1. Use Cloud Shell preview pointed at port 16686
    1. Select a service (e.g. reviews) and review trace

## Cleanup
Run `. ../istio-basics-demo/cleanup.sh`