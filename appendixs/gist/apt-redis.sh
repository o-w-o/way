#!/usr/bin/env bash

function aptRedis() {
  apt install redis redis-server -t stretch-backports -y
}