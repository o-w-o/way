#!/usr/bin/env bash

function mkSwap() {
  # bs blocksize ，每个块大小为1M.count=2048。则总大小为2G的文件。创建一个1G的文件作为交换分区使用
  dd if=/dev/zero of=/opt/swapfile bs=1M count=2000

  # (格式化成swap分区)
  mkswap /opt/swapfile

  # (打开swap分区)
  swapon /opt/swapfile

  # (在fstab中增加一条记录如下)
  echo "/opt/swapfile swap swap defaults 0 0" >> /etc/fstab

  mount -a
}