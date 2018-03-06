FROM php:5.6-fpm

RUN apt-get update && \
    apt-get install -y git php5-gd libzip-dev php-xml-parser libpng-dev php-xml

RUN pecl install -o -f dbase && \
    rm -rf /tmp/pear

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd

RUN mkdir -p /usr/local/etc/php/conf.d && \
    echo "memory_limit=4G" >> /usr/local/etc/php/conf.d/docker-php-additions.ini
