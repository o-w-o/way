#!/usr/bin/env bash

jenkinsDataDir=""
jenkinsDataZipFile="pipeline.tar.gz"
jenkinsDataZipFilePath=""
ossBackupDir="backup"
ossBackupPath="oss://$ossBackupDir/$jenkinsDataZipFile"
ossUtilVersion='1.7.0'
ossUtilName='ossutil64'
ossUtilUrl="http://gosspublic.alicdn.com/ossutil/$ossUtilVersion/$ossUtilName"

function cnfOssUtil() {
  # 下载 ali oss 工具，详情：https://help.aliyun.com/document_detail/50452.html?spm=a2c4g.11186623.6.697.31902e69cGRr0Z
  wget "ossUtilUrl"

  # 添加 x 权限
  chmod 755 "$ossUtilName"

  # 配置 ossutil
  ./"$ossUtilName" config
}

function cnfJenkins() {
    echo "jenkinsDataDir: "
    read jenkinsDataDir
    if [ -d "$jenkinsDataDir" ] ;
      then jenkinsDataZipFilePath="$jenkinsDataDir/$jenkinsDataZipFile"
      else echo "[$jenkinsDataDir] not exist or permission denied." && exit -1
    fi
}

function uploadJenkinsBackupDataBy() {
  # 压缩 jenkins-data 数据卷
  tar "$jenkinsDataDir" "$jenkinsDataZipFilePath"

  # 上传
  ./ossutil64 cp "$jenkinsDataZipFilePath" "$ossBackupPath"
}

function downloadJenkinsBackupData() {
  # 下载
  ./ossutil64 cp "$ossBackupPath" "$jenkinsDataZipFilePath"

  # 解压
  tar "$jenkinsDataZipFilePath" "$jenkinsDataDir"
}