FROM node:12.6-buster-slim
RUN sed -i 's/snapshot.debian.org\/archive\/debian\/20190708T033000Z/mirrors.aliyun.com/' /etc/apt/sources.list && \
    apt update && \
    apt install -yqq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && \
    wget -qO- https://mirrors.aliyun.com/docker-ce/linux/debian/gpg | apt-key add - && \
    add-apt-repository  "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/debian $(lsb_release -cs) stable"  && \
    apt update -yqq && \
    apt install -yqq docker-ce docker-ce-cli containerd.io && \
    rm -rf /var/lib/apt/lists/*
