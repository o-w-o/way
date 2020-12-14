#!/usr/bin/env bash

function pkgNginx() {
  # 依赖安装
  apt install curl gnupg2 ca-certificates lsb-release

  # 软件源配置
  echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" \
      | tee /etc/apt/sources.list.d/nginx.list

  # 软件源配置（use mainline nginx packages）
  echo "deb http://nginx.org/packages/mainline/debian `lsb_release -cs` nginx" \
      | tee /etc/apt/sources.list.d/nginx.list

  # 配置 APT key
  curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -

  # 验证 APT key
  apt-key fingerprint ABF5BD827BD9BF62

  # 安装
  apt update && apt install nginx -y
}


function cnfNginx() {
  # 备份 nginx 原配置
  cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
  # 复制 nginx 配置
  cp ../conf/nginx.conf /etc/nginx/nginx.conf
  # 复制 o-w-o 的 nginx 配置
  cp ../conf/* /etc/nginx/conf.d/
  # 复制 o-w-o 密钥
  cp ../secret /etc/secret
}