Docker metrics to Consul
=======================
Docker metrics store to Key/Value Storage of Consul by Fluentd.

Starting Container
------------
```
$docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v /sys/fs/cgroup/:/sys/fs/cgroup:ro -e CONSUL_URI=http://your-consul-host:8500 foostan/docker-metrics-to-consul
```
