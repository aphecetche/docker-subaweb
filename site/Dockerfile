FROM php:7.1-apache

RUN apt-get update && apt-get install -y libmcrypt-dev zlib1g-dev libldap2-dev libsasl2-dev

RUN docker-php-ext-install pdo mysqli mcrypt zip && \
docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ --with-ldap-sasl && \
docker-php-ext-install ldap

# Enable Apache mod_rewrite
RUN a2enmod rewrite

