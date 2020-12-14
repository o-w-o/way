#!/usr/bin/env bash
function pkgJenkinsByDocker() {
  # 创建 数据卷
  docker volume create jenkins-data
  # 查看 所有容器卷，检验是否创建成功
  docker volume ls
  # 查看 jenkins-data 容器卷详情信息
  docker volume inspect jenkins-data

  # 启动
  docker run \
    --restart=always \
    --name pipeline \
    -u root \
    -d \
    -p 8080:8080 \
    -p 50000:50000 \
    -e JAVA_OPTS='-Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8' \
    -v jenkins-data:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock \
    jenkinsci/blueocean

  # 配置 Nginx 反向代理
  # vim /etc/nginx/conf.d/pipeline.o-w-o.ink.conf

  # 进入 jenkins-data 查看管理员密码
}

function renJenkinsByDocker() {
  docker pull jenkinsci/blueocean && docker restart pipeline
}

function pkgCAdvisorDocker() {
  docker pull google/cadvisor && docker run -d \
      --restart=always \
			-p=6889:8080 --name=cadvisor \
			-v=/:/rootfs:ro \
			-v=/var/run:/var/run:ro \
			-v=/sys:/sys:ro \
			-v=/var/lib/docker/:/var/lib/docker:ro \
			-v=/dev/disk/:/dev/disk:ro \
			google/cadvisor
}

function renCAdvisorDockerDeamon() {
  docker pull google/cadvisor && docker restart cadvisor
}

# 通过挂载数据卷 prom-data 来实现 prometheus 配置
function pkgPrometheusDocker() {
  docker run -d \
    --restart=always \
    -p 9090:9090 --name=prom \
    -v "prom-data:/etc/prometheus" \
    prom/prometheus

  docker run -d \
    --restart=always \
    --net="host" --name node-exporter \
    -v "/:/host:ro,rslave" \
    prom/node-exporter --web.listen-address=:9111 --path.rootfs=/host --path.procfs=/host/proc --path.sysfs=/host/sys
}

function renPrometheusDocker() {
   docker pull prom/prometheus && docker pull prom/node-exporter
   docker restart prom && docker restart node-exporter
}

function pkgGrafanaDocker() {
    docker run -i \
      --restart=always \
      --net=host --name=grafana \
			-v "grafana-data:/opt/grafana" \
			-e "GF_SECURITY_ADMIN_PASSWORD=htflPI12mZ2769ZqBfTd" \
			-e "GF_PATHS_CONFIG=/opt/grafana/grafana.ini" \
			-e "GF_PATHS_DATA=/opt/grafana/data" \
			-e "GF_PATHS_LOGS=/opt/grafana/log" \
			-e "GF_PATHS_PLUGINS=/opt/grafana/plugins" \
			-e "GF_SERVER_ROOT_URL=http://monitor.o-w-o.ink" \
      grafana/grafana
}
function renGrafanaDocker() {
  docker pull grafana/grafana && docker restart grafana
}
