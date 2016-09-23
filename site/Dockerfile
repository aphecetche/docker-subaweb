FROM php:5.6-apache

RUN apt-get update && apt-get install -y libmcrypt-dev zlib1g-dev

RUN docker-php-ext-install pdo mysql mysqli mcrypt zip

# Enable Apache mod_rewrite
RUN a2enmod rewrite

