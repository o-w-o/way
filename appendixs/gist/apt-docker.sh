#!/usr/bin/env bash

# 安装阿里云下的 Docker 镜像源，并提供镜像加速服务。

function aptDocker() {
  # 预安装
  apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

  # 添加 apt-key
  curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/debian/gpg | apt-key add -

  # 检验 apt-key
  apt-key fingerprint 0EBFCD88

  # 添加并更新 源
  add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/debian $(lsb_release -cs) stable" \
      && apt update

  # 安装 docker
  apt install docker-ce docker-ce-cli containerd.io

  mkdir -p /etc/docker \
    && cd /etc/docker \
    && echo '{"registry-mirrors": ["https://token.mirror.aliyuncs.com"]}' >> deamon.json

  systemctl daemon-reload \
    && systemctl restart docker
}