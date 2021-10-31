FROM php:7.4-fpm-alpine3.13

RUN apk add --no-cache openssl supervisor bash mysql-client nodejs npm g++ icu-dev \
    nginx libpng-dev libsodium libsodium-dev nginx-mod-stream php7-fpm php7-common \
    php7-xml php7-xmlrpc php7-curl php7-gd php7-imagick php7-cli php7-dev \
    php7-imap php7-mbstring php7-opcache php7-soap php7-zip php7-intl php7-bcmath unzip \
    pcre-dev ${PHPIZE_DEPS} sysstat libcurl\
    freetype-dev libjpeg-turbo-dev libpng-dev php-sqlite3 php7-pear php7-dev gcc musl-dev make \
    && pecl install redis-5.1.1 scrypt-1.4.2 \
    && docker-php-ext-install pdo pdo_mysql gd sodium mysqli bcmath intl \
    && docker-php-ext-configure intl \
    && docker-php-ext-enable redis scrypt \
    && mkdir -p /run/nginx

WORKDIR /var/www/cleanetto

COPY --chown=www-data:www-data . /var/www/cleanetto

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

RUN composer install --no-interaction --prefer-dist --optimize-autoloader

RUN mv app_nginx.conf /etc/nginx/conf.d/default.conf

RUN mv nginx.conf /etc/nginx/nginx.conf

RUN npm install

RUN npm i vue-loader

RUN npm run prod

RUN chmod +x entrypoint.sh

EXPOSE 80

CMD ["/var/www/cleanetto/entrypoint.sh"]
