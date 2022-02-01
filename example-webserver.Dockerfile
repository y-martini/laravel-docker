FROM nginx:1.21-alpine

LABEL org.opencontainers.image.source=https://github.com/yuriy-martini/laravel-demo

COPY --from=ghcr.io/yuriy-martini/laravel-demo/base /var/www /var/www
