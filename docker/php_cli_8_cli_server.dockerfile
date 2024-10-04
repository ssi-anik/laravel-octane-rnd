FROM sirajul/php:cli-83-latest

RUN /usr/local/bin/install-php-extensions swoole

ARG FRANKENPHP_VERSION="1.1.2"
ARG FRANKENPHP_ARCH="aarch64"

ARG ROADRUNNER_VERSION="2024.1.0"
ARG ROADRUNNER_ARCH="amd64"

RUN mkdir -p /opt/rr \
    && curl -s -L https://github.com/roadrunner-server/roadrunner/releases/download/v${ROADRUNNER_VERSION}/roadrunner-${ROADRUNNER_VERSION}-linux-${ROADRUNNER_ARCH}.tar.gz | tar xvz -C /opt/rr --strip-components 1 \
    && mv /opt/rr/rr /usr/local/bin \
    && chmod 0755 /usr/local/bin/rr \
    && rm -rf /opt/rr

RUN curl -s -L https://github.com/dunglas/frankenphp/releases/download/v${FRANKENPHP_VERSION}/frankenphp-linux-${FRANKENPHP_ARCH} -o "/usr/local/bin/frankenphp" \
    && chmod 0755 /usr/local/bin/frankenphp

WORKDIR /var/www/html
