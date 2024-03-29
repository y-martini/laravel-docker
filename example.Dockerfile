FROM php:7.2-fpm as base

RUN \
    apt-get update \
    && apt-get install -y \
        libzip-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql \
        zip

WORKDIR /var/www

FROM base as vendor

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY composer.json composer.lock ./

RUN composer install \
    --no-autoloader \
    --no-dev \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

COPY . .

RUN \
    composer dumpautoload && \
    php artisan storage:link

FROM node:alpine as node_build

WORKDIR /root

COPY \
    package.json \
    yarn.lock \
    webpack.mix.js \
    ./
COPY resources/js resources/js/
COPY resources/sass resources/sass/

RUN \
  yarn --production \
  && yarn prod

FROM base

LABEL org.opencontainers.image.source=https://github.com/yuriy-martini/laravel-demo

COPY --from=vendor /var/www /var/www

COPY --from=node_build /root/public/mix-manifest.json public/
COPY --from=node_build /root/public/js public/js/
COPY --from=node_build /root/public/css public/css/

ENTRYPOINT [ "/var/www/docker/entrypoint.sh" ]
