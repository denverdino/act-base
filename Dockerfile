FROM node:12.6-buster-slim
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list && \
    apt update && \
    apt install -yqq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && \
    wget -qO- https://mirrors.aliyun.com/docker-ce/linux/debian/gpg | apt-key add - && \
    add-apt-repository  "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/debian $(lsb_release -cs) stable"  && \
    wget -qO- https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://mirrors.aliyun.com/kubernetes/apt kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    wget -qO- https://baltocdn.com/helm/signing.asc | apt-key add - && \
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt update -yqq && \
    apt install -yqq docker-ce docker-ce-cli containerd.io kubectl helm && \
    rm -rf /var/lib/apt/lists/*
