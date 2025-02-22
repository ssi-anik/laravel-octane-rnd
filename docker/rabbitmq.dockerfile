FROM rabbitmq:3.12-management

RUN apt-get update &&  apt-get install -y --no-install-recommends nano curl

# https://stackoverflow.com/a/69217201/2190689
RUN curl -L https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v3.12.0/rabbitmq_delayed_message_exchange-3.12.0.ez > $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.12.0.ez
RUN chown rabbitmq:rabbitmq $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.12.0.ez
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange

# https://stackoverflow.com/a/53403267/2190689
ENV RABBITMQ_USER user
ENV RABBITMQ_PASSWORD password

COPY ./docker/rabbitmq_entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
