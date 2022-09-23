FROM alpine
LABEL org.opencontainers.image.title="rabbitmqadmin"
LABEL org.opencontainers.image.description="Runs rabbitmqadmin"
LABEL org.opencontainers.image.authors="Gildas Cherruel <gildas.cherruel@genesys.com>"
LABEL org.opencontainers.image.version="0.0.3"
LABEL org.opencontainers.image.licenses="MIT"

ENV RABBITMQ_HOST     localhost
ENV RABBITMQ_PORT     15672
ENV RABBITMQ_USER     guest
ENV RABBITMQ_PASSWORD guest
ENV RABBITMQ_VHOST    /

RUN addgroup -S rabbitmq && \
    adduser  -S -g rabbitmq rabbitmq

RUN apk add --no-cache curl && \
    apk add --no-cache python3 && \
    curl -L https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/v3.8.18/deps/rabbitmq_management/bin/rabbitmqadmin -o /usr/bin/rabbitmqadmin && \
    
    chmod +x /usr/bin/rabbitmqadmin
ADD ./runit /usr/bin
RUN chmod +x /usr/bin/runit

USER rabbitmq

ENTRYPOINT [ "/usr/bin/runit" ]
CMD [ "" ]
