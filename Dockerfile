FROM centos:7
MAINTAINER jakub.dlugolecki@gmail.com

ENV KUBECTL_URL="https://storage.googleapis.com/kubernetes-release/release/v1.2.1/bin/linux/amd64/kubectl"

RUN yum -y install git && \
    curl -L "${KUBECTL_URL}" -o /usr/local/bin/kubectl && \
    chmod 755 /usr/local/bin/kubectl
    pip --no-cache-dir install -r /tmp/r.txt
