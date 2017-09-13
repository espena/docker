FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    git \
    patch \
    nginx \
    php \
    php-fpm \
    postgresql \
    postgresql-contrib \
    libyaml-perl \
    libdbd-pg-perl \
    libdbi-perl \
    libpq-dev \
    php-xml \
    php-cgi \
    php-curl \
    php-pgsql \
    php-imap

RUN git clone https://gitlab.com/davical-project/davical.git && \
    git clone https://gitlab.com/davical-project/awl.git && \
    mv davical/ /usr/share/ && \
    mv awl/ /usr/share/ && \
    chown -R root:www-data /usr/share/davical && \
    chown -R root:www-data /usr/share/awl && \
    cd /usr/share/davical/ && \
    find ./ -type d -exec chmod u=rwx,g=rx,o= '{}' \; && \
    find ./ -type f -exec chmod u=rw,g=r,o= '{}' \; && \
    cd /usr/share/awl/ && \
    find ./ -type d -exec chmod u=rwx,g=rx,o= '{}' \; && \
    find ./ -type f -exec chmod u=rw,g=r,o= '{}' \;

COPY pg_hba.conf.patch /etc/postgresql/9.5/main/pg_hba.conf.patch
COPY vhost.conf /etc/nginx/sites-available/default
COPY davical_config.php /etc/davical/config.php
COPY hostconfig.sh /root/hostconfig.sh

RUN cd /etc/postgresql/9.5/main && patch pg_hba.conf < pg_hba.conf.patch && \
    chmod +x ~/hostconfig.sh && \
    service postgresql start && \
    cd /usr/share/davical/dba && \
    chown root:root create-database.sh && \
    sync && \
    chmod 755 /usr/share/davical/dba/create-database.sh && \
    chmod 755 /usr/share/davical/dba/update-davical-database && \
    usermod -a -G root,www-data postgres && \
    su postgres -c /usr/share/davical/dba/create-database.sh && \
    service postgresql stop

#CMD ~/hostconfig.sh && \
#    tail -f /dev/null

CMD tail -f /dev/null
