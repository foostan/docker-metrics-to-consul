source {
  type :docker_metrics
  stats_interval 5
}

match("docker.*.*") {
  type :convert
  tag 'consul.docker.metrics'
}

match("consul.docker.metrics") {
  type :copy
  store {
    type :consul
    consul_uri ENV['CONSUL_URI']
    kv_prefix ENV['KV_PREFIX']
    flush_interval 5
  }

  store {
    type :stdout
  }
}
