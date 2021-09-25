# KIND

## Use Cases

The main use cases we come accross is running the test cases in jenkins where we need to sping up the kubernetes clusters. Let us suppose say we want to run and test helm charts or we want to test the operators we developed on the kubernetes cluster. In this scenarios sometimes we may change the configuration of the kuberntes cluster which may effect other applications deployed inside the kubernetes cluster.

## Pre-requisite

Before proceeding, you need to have the knowledge of Docker Inside Docker(DIND) and K3s by Rancher.

- [DIND](https://hub.docker.com/_/docker)
- [K3s](https://k3s.io/)
