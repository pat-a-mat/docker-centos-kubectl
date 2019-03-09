FROM centos:7
MAINTAINER jakub.dlugolecki@gmail.com

ENV KUBECTL_URL="https://storage.googleapis.com/kubernetes-release/release/v1.12.1/bin/linux/amd64/kubectl"
ENV HELM_URL="https://storage.googleapis.com/kubernetes-helm/helm-v2.9.1-linux-amd64.tar.gz"
ENV AWS_CLI_VERSION 1.16.120

RUN yum -y install epel-release && \
    yum -y install git gettext python-pip ruby && \
    curl -L "${KUBECTL_URL}" -o /usr/local/bin/kubectl && \
    chmod 755 /usr/local/bin/kubectl && \
    curl -Lsf "${HELM_URL}" | tar -xvz --strip-components=1 -C /usr/local/bin linux-amd64/helm && \
    pip --no-cache-dir install --upgrade pip setuptools && \
    pip --no-cache-dir install "awscli==${AWS_CLI_VERSION}"
