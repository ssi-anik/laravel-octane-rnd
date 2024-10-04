FROM sirajul/php:zts-83-latest

RUN /usr/local/bin/install-php-extensions swoole

WORKDIR /var/www/html
