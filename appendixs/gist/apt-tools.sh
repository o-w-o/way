#!/usr/bin/env bash

sshUser="o-w-o"
sshDir="~/.ssh"
sshEmail="symbols@dingtalk.com"
sshPubFile="$sshDir/id_rsa.pub"

function aptTools() {
  # 安装
  apt install vim zsh git wget tmux -y
}

function cnfGit() {
  # 设置 user name 和 email
  git config --global user.name "$sshUser" && git config --global user.email "$sshEmail"

  # 查看ssh密钥是否存：cd ~/.ssh 如果没有密钥则不会有此文件夹，有则备份删除
  # 参数 -x 判断 $sshDir 是否存在并且是否具有可执行权限
  if [ ! -x "$sshDir"];
    then mkdir "$sshDir"
    else rm "$sshDir"
  fi

  # 生成SSH密钥
  ssh-keygen -t rsa -C "$sshEmail"

  # 查看ssh密钥是生成：
  cd "$sshDir" && ls

  if [ -f "$sshPubFile" ];
    then echo "cnfGit end."
    else echo "cnfGit error" && exit -1
  fi
}

function cnfZsh() {
  # 拉取 oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh.git  ~/.oh-my-zsh

  # 使用 oh-my-zsh 默认配置
  cp .oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
}
