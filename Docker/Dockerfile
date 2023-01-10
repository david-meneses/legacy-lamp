FROM ubuntu:18.04
LABEL maintainer="David Meneses <david@onlinehelp.team>"
LABEL description="Legacy LAMP: Ubuntu 18.04, Apache2 MariaDB 10.1, PHP7.1"

ENV DEBIAN_FRONTEND noninteractive

RUN apt update &&  \
	apt-get install -yq curl wget gnupg2 ca-certificates lsb-release apt-transport-https nano software-properties-common git locales tzdata

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata


RUN apt-get install -y apache2
RUN a2enmod rewrite

RUN apt-get install -y mariadb-server-10.1 mariadb-client-10.1 mariadb-common

RUN add-apt-repository -y ppa:ondrej/php && \
	add-apt-repository -y ppa:ondrej/apache2 && \
	apt update

RUN apt-get install -yq \ 
php7.1 \ 
libapache2-mod-php7.1 \ 
php7.1-common \ 
php7.1-mysql \ 
php7.1-json \ 
php7.1-gmp \ 
php7.1-ldap \ 
php7.1-curl \ 
php7.1-intl \ 
php7.1-mbstring \ 
php7.1-xmlrpc \ 
php7.1-gd \ 
php7.1-bcmath \ 
php7.1-xml \ 
php7.1-cli \ 
php7.1-zip

ENV PHP_UPLOAD_MAX_FILESIZE=32M
ENV PHP_POST_MAX_SIZE=32M

COPY start.sh start.sh
RUN chmod +x start.sh

COPY phpminiadmin.php /var/wwww/html/phpminiadmin.php

VOLUME ["/var/www/html"]

EXPOSE 3306 80

CMD ./start.sh
