FROM sirajul/php:zts-83-latest

ARG ARCH="amd64"

RUN mkdir -p /opt/rr \
    && curl -s -L https://github.com/roadrunner-server/roadrunner/releases/download/v2024.1.0/roadrunner-2024.1.0-linux-${ARCH}.tar.gz | tar xvz -C /opt/rr --strip-components 1 \
    && mv /opt/rr/rr /usr/local/bin \
    && chmod 0755 /usr/local/bin/rr \
    && rm -rf /opt/rr

WORKDIR /var/www/html
