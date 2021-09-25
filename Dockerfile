FROM docker:19.03.7-dind

RUN apk add curl bash

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install k3d to run k3s cluster
RUN curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=v4.0.0 bash

# Set docker host env to use while bringing up docker daemon
ENV DOCKER_HOST=unix:///var/run/docker.sock

# Copy kind entrypoint file
COPY kind-entrypoint.sh /usr/local/bin/kind-entrypoint.sh

RUN ["chmod", "+x", "/usr/local/bin/kind-entrypoint.sh"]

ENTRYPOINT ["/usr/local/bin/kind-entrypoint.sh"]
