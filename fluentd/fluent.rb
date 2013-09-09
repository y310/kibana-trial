
## built-in TCP input
## $ echo <json> | fluent-cat <tag>
source {
  type :forward
}


## match tag=debug.** and dump to console
match('debug.**') {
  type :stdout
}

match('kibana') {
  type :elasticsearch
  host 'localhost'
  port 9200
  index_name 'fluentd'
  type_name 'fluentd'
  logstash_format true
  flush_interval 1
}
