#!/bin/bash
DAVICAL_SYSNAME='${DAVICAL_SYSNAME:-DaviCal Server}'
VHOST_NAME='${VHOST_NAME:-localhost}'
VHOST_ADMIN='${VHOST_ADMIN:-webmaster@localhost}'
cd /etc/nginx/sites-available
sed -i "s/VHOST_NAME/"$VHOST_NAME"/g" default
mv default $VHOST_NAME
ln -s /etc/nginx/sites-available/$VHOST_NAME /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
cd /etc/davical
sed -i "s/VHOST_ADMIN/"$VHOST_ADMIN"/g" config.php
sed -i "s/VHOST_NAME/"$VHOST_NAME"/g" config.php
sed -i "s/DAVICAL_SYSNAME/'"$DAVICAL_SYSNAME"'/g" config.php
service postgresql start && service php7.0-fpm start && service nginx start
