FROM php:7.4-apache

RUN apt-get update && apt-get install -y libmcrypt-dev zlib1g-dev libldap2-dev libsasl2-dev

RUN docker-php-ext-install pdo mysqli && \
docker-php-ext-configure ldap && \
docker-php-ext-install ldap

# Enable Apache mod_rewrite
RUN a2enmod rewrite

