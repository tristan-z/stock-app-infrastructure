# stock-app-infrastructure

### Setup

run `kubectl apply -f` on all files within k8s directory

Make the elasticsearch loadbalancer accessible within minikube:

`minikube service elasticsearch-loadbalancer`

Sample Output:


        |-----------|----------------------------|-------------|---------------------------|
        | NAMESPACE |            NAME            | TARGET PORT |            URL            |
        |-----------|----------------------------|-------------|---------------------------|
        | default   | elasticsearch-loadbalancer | http/80     | http://192.168.49.2:30320 |
        |-----------|----------------------------|-------------|---------------------------|


Use the above ip for interfacing with elasticsearch.


Upload Data:

curl -H 'Content-Type: application/json' -XPOST http://192.168.49.2:30320/testindex/_doc/_bulk?pretty --data-binary @sampledata.json



Sample search request:


        curl -X GET "http://192.168.49.2:30320/_search?pretty" -H 'Content-Type: application/json' -d'
        {
        "query": {
            "range": {
                "Volume": {
                    "gte": "100000000"
                }
            }
        }
        }
        '

