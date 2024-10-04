FROM sirajul/php:zts-83-latest
#FROM dunglas/frankenphp:1.1.2-builder-php8.3.6-bookworm

ARG ARCH="aarch64"
#RUN curl -s -L https://github.com/dunglas/frankenphp/releases/download/v1.1.2/frankenphp-linux-x86_64 -o "/usr/local/bin/frankenphp" \
RUN curl -s -L https://github.com/dunglas/frankenphp/releases/download/v1.1.2/frankenphp-linux-${ARCH} -o "/usr/local/bin/frankenphp" \
    && chmod 0755 /usr/local/bin/frankenphp

WORKDIR /var/www/html
