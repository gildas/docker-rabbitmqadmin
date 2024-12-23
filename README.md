# docker-rabbitmqadmin
Run rabbitmqadmin 4.0.5 in a Docker container

Examples:

```
$ docker run --rm \
  --env RABBITMQ_HOST=mq.acme.com \
  --env RABBITMQ_USER=guest \
  --env RABBITMQ_PASSWORD=test \
  gildas/rabbitmqadmin \
  list exchanges
```
