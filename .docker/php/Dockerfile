FROM php:7.4-fpm-alpine3.11

RUN docker-php-ext-install pdo pdo_mysql

COPY php.ini /usr/local/etc/php/php.ini
COPY php-fpm-pool.conf /usr/local/etc/php-fpm.d/www.conf

ENV UID 1000
ENV GID 1000

RUN curl -sSk https://getcomposer.org/installer | php -- --disable-tls && \
   mv composer.phar /usr/local/bin/composer

RUN apk --no-cache add shadow && \
    usermod -u ${UID} www-data && \
    groupmod -g ${GID} www-data && \
    chown www-data:www-data /var/www/html /home/www-data

WORKDIR /var/www/html

COPY --chown=www-data:www-data app .

EXPOSE 9000

USER www-data
CMD ["php-fpm"]