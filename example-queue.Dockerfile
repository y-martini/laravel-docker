FROM ghcr.io/yuriy-martini/laravel-demo/base

LABEL org.opencontainers.image.source=https://github.com/yuriy-martini/laravel-demo

CMD ["php", "artisan", "queue:work", "--tries", "3"]
