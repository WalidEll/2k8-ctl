FROM alpine:latest

# Install necessary packages
RUN apk update && apk add --no-cache \
    curl \
    git \
    ssh

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin

# Install kustomize
ENV KUSTOMIZE_VERSION=4.4.0
RUN curl -LO "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" && \
    tar xzf "kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" && \
    chmod +x kustomize && \
    mv kustomize /usr/local/bin

CMD [ "sh" ]
