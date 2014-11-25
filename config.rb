source {
  type :docker_metrics
  stats_interval 5
}

match("docker.*.*") {
  type :consul
  consul_uri ENV['CONSUL_URI']
  kv_prefix 'fluentd'
  flush_interval 5
}
