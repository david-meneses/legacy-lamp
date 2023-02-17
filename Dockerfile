FROM --platform=amd64 php:7.1.10-apache
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get upgrade -y --force-yes

RUN apt-get install -y --force-yes libpng-dev 
RUN apt-get install -y --force-yes libzip-dev
RUN apt-get install -y --force-yes curl
RUN apt-get install -y --force-yes zip unzip 

RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

