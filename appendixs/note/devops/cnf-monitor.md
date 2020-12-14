# Grafana 和 Prometheus 配置和使用

## Grafana

`/opt/grafana/` `grafana.ini`

```
#################################### SMTP / Emailing #####################

[smtp]
enabled = true
host = smtp.qiye.aliyun.com:465 # http://mailhelp.mxhichina.com/smartmail/admin/detail.vm?knoId=5871700
user = monitor@o-w-o.ink
password = password
from_address = monitor@o-w-o.ink
from_name = Grafana

[metrics]
enabled = true
```

## Prometheus

`prom-data/prometheus/` `prometheus.yml`

```yaml
# my global config
global:
  scrape_interval: 15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  # scrape_timeout set to the global default (10s).

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
  - "node_down.yml"
  # - "first_rules.yml"
  # - "second_rules.yml"

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: 'prometheus'
    static_configs:
      - targets: [ 'ip:9090' ]

  - job_name: 'cadvisor'
    static_configs:
      - targets: [ 'ip:6889' ]

  - job_name: 'node'
    scrape_interval: 8s
    static_configs:
      - targets: [ 'ip:9100' ]

  - job_name: 'jenkins'
    metrics_path: "prometheus"
    scrape_interval: 8s
    static_configs:
      - targets: [ 'ip:8080' ]

```

### 规则文件配置

`prom-data/prometheus/` `node_down.yml`

```yaml
groups:
  - name: node_down
    rules:
      - alert: InstanceDown
        expr: up == 0
        for: 1m
        labels:
          user: test
        annotations:
          summary: "Instance {{ $labels.instance }} down"
          description: "{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 1 minutes."
```