#!/bin/bash
# This script is used to run docker daemon before bringing up k3s cluster
# using k3d
# Exit script when there is any error
set -e
echo "Running docker service and creating cluster"

# Bring docker daemon up using DOCKER_HOST variable 
dockerd &>docker.logs &

# Wait until docker daemon is available. 
while (! docker stats --no-stream ); do
  # Docker takes a few seconds to initialize
  echo "Waiting for Docker to launch..."
  sleep 1
done

# Run k3d cluster with name default_cluster
echo "Creating cluster with defaultCluster as name"
k3d cluster create defaultCluster

# Run commands at start of container
if [ "$#" -gt "0" ]; then
  $@
fi