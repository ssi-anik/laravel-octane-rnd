FROM sirajul/php:zts-83-latest

RUN /usr/local/bin/install-php-extensions openswoole

WORKDIR /var/www/html
