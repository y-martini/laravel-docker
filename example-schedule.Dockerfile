FROM ghcr.io/yuriy-martini/laravel-demo/base

LABEL org.opencontainers.image.source=https://github.com/yuriy-martini/laravel-demo

COPY schedule/entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
