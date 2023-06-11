FROM alpine:latest

ENV KUSTOMIZE_VERSION=4.4.0
ENV HELM_VERSION=3.6.0

# Install necessary packages
RUN apk update && apk add --no-cache \
    curl \
    git \
    openssh \
    tar \
    gzip \
    jq \
    wget \
    ca-certificates

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin

RUN curl -LO "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" && \
    tar xzf "kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" && \
    chmod +x kustomize && \
    mv kustomize /usr/local/bin

RUN curl -LO "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    tar xzf "helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    chmod +x linux-amd64/helm && \
    mv linux-amd64/helm /usr/local/bin && \
    rm -rf linux-amd64

CMD [ "sh" ]
