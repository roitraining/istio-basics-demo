# istio-basics-demo

## Setup

### Setup tasks
1. Open Cloud Shell in a project you own
2. Remove previous files, clone repo, run setup
```
cd ~
rm -rf istio-*
git clone https://github.com/roitraining/istio-basics-demo
. istio-basics-demo/setup.sh
```
3. Open the Slides document here: (https://roi-links.com/2VujI9a)

The setup script does the following:
* Enables the GKE API in your project
* Creates a GKE cluster
* Downloads a directory of istio files, including demo files
* Enables sidecar injection
* Deploys the bookinfo application
* Deploys the bookinfo gateway

## Demo

### Intro
Use the deck to walk through this bit...

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
2. Review `samples/bookinfo/networking/virtual-service-all-v1.yaml`
3. Visit app URL, and refresh multiple times and call out no stars

Set routing to A/B testing of new versions
1. Run *a/b* snippet
2. Review `samples/bookinfo/networking/virtual-service-reviews-v2-v3.yaml`
3. Demo 50/50 split by refreshing app multiple times
4. Discuss how this can be done in k8s but is being done a level higher

Set routing to per-user
1. Discuss real-world need to canary with specific users or customers
2. Run *canary by user* snippet
3. Review `samples/bookinfo/networking/virtual-service-reviews-test-v2.yaml`
4. Demo logged in vs. not routing (log in as `jason` with no password)

### General Istio info
1. Generate load against app
    1. In Cloud Shell, run the *generate load* snippet
1. Show Service Graph and discuss.
    1. Run *service graph* snippet
    1. Use Cloud Shell preview pointed at port 8088.
    1. Visit `https://8088-dot-<2952031>-dot-devshell.appspot.com/force/forcegraph.html`, substituting your proxy #
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
