#!/usr/bin/env bash

function pkgCertbot() {
  # 安装 Snap
  apt install snapd

  snap install core && snap refresh core

  # 安装 certbot
  snap install --classic certbot

  # 链接 certbot
  ln -s /snap/bin/certbot /usr/bin/certbot
}

function cnfCertbot() {
  certbot certonly  --webroot -w /var/www/o-w-o.ink --email symbols@dingtalk.com -d pipeline.o-w-o.ink -d monitor.o-w-o.ink
}


