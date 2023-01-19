FROM php:7.1.33-apache
ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get upgrade -y\
    && apt-get install -y libpng-dev \
    && apt-get install -y libzip-dev \
    && apt-get install -y curl \
    && apt-get install -y zip unzip 

RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

