FROM alpine
LABEL maintainer="Gildas Cherruel <gildas@breizh.org>"
LABEL version="0.0.1"
LABEL description="Runs rabbitmqadmin"

ENV RABBITMQ_HOST=localhost
ENV RABBITMQ_PORT=15672
ENV RABBITMQ_USER=guest
ENV RABBITMQ_PASSWORD=guest
ENV RABBITMQ_VHOST=/

RUN addgroup -S rabbitmq && \
    adduser  -S -g rabbitmq rabbitmq

RUN apk add --no-cache curl && \
    apk add --no-cache python && \
    curl -L https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/v3.7.4/bin/rabbitmqadmin -o /usr/bin/rabbitmqadmin && \
    chmod +x /usr/bin/rabbitmqadmin

USER rabbitmq

ENTRYPOINT [ "/usr/bin/rabbitmqadmin", "--host", "$RABBITMQ_HOST", "--port", "$RABBITMQ_PORT", "--vhost", "$RABBITMQ_VHOST", "--username", "$RABBITMQ_USER", "--password", "$RABBITMQ_PASSWORD" ]
CMD [ "" ]
