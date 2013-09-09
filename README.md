# Kibana Trial Set

This is simple trial set of [Kibana 3](http://three.kibana.org/).

This repository includes

- Simple rails app
- Kibana 3
- fluentd.conf
- JMeter configuration

## Getting Started

### Start rails

```sh
$ cd app
$ bundle
$ rails s
```

### Start ElasticSearch

Install and start ElasticSearch.

If you run on Mac, you can use homebrew.

```sh
brew install elasticsearch
elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml
```

And I recommend to add this mapping template to map correct types to properties.

```json
curl -XPUT localhost:9200/_template/kibana -d '
{
  "template" : "logstash*",
  "mappings" : {
    "_default_" : {
      "properties" : {
        "user_id": {
          "type": "integer"
        },
        "@timestamp": {
          "format": "dateOptionalTime",
          "type": "date"
        },
        "action": {
          "type": "string"
        },
        "controller": {
          "type": "string"
        },
        "method": {
          "type": "string"
        },
        "path": {
          "type": "string"
        },
        "runtime": {
          "type": "float"
        },
        "status": {
          "type": "integer"
        },
        "user_agent": {
          "type": "string"
        }
      }
    }
  }
}
'
```

### Start fluentd

```sh
$ cd fluentd
$ bundle
$ bundle exec fluentd -c fluentd.conf
```

### Start Kibana

```sh
$ cd kibana
$ bundle
$ bundle exec ruby -rsinatra -e ''
$ open http://localhost:9200/index.html
```

### Start JMeter (Optional)

To get logs easily, use JMeter.

```sh
brew install jmeter
cd jmeter
jmeter -t test_requests.jmx
```
