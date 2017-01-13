FROM php:5.6-fpm
RUN pecl install -o -f dbase && rm -rf /tmp/pear && echo "extension=dbase.so" > /usr/local/etc/php/conf.d/dbase.ini
RUN docker-php-ext-install mysqli
