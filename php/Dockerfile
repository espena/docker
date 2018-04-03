FROM php:5.6-fpm

RUN apt-get update && \
    apt-get install -y git libzip-dev libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  && \
    docker-php-ext-configure xml --with-libxml-dir=/usr/include/

RUN docker-php-ext-install -j$(nproc) gd xml

RUN pecl install -o -f dbase && \
    rm -rf /tmp/pear

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd

RUN mkdir -p /usr/local/etc/php/conf.d && \
    echo "memory_limit=4G" >> /usr/local/etc/php/conf.d/docker-php-additions.ini

CMD tail -f /dev/null
