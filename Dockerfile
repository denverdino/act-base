FROM node:16-buster-slim
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list && \
    apt update && \
    apt install -yqq \
    apt-transport-https \
    ca-certificates \
    curl wget \
    gnupg \
    lsb-release \
    software-properties-common && \
    mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.aliyun.com/docker-ce/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt update -yqq && apt install -yqq docker-ce docker-ce-cli containerd.io && \
    curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://mirrors.aliyun.com/kubernetes/apt kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list && \
    apt update -yqq && apt install -yqq kubectl && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && ./get_helm.sh && \
    rm -rf /var/lib/apt/lists/*


