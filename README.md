[Documentation](https://docs.docker.com/)

## Build

```shell
export CONTAINER_REPOSITORY=ghcr.io/yuriy-martini/laravel-demo
```

```shell
export PROJECT_ROOT=~/laravel-demo
```

### Base

```shell
docker build \
  -t $CONTAINER_REPOSITORY/base:latest \
  -f Dockerfile \
  $PROJECT_ROOT
```

### App

```shell
docker build \
  -t $CONTAINER_REPOSITORY/app:latest \
  -f app.Dockerfile \
  .
```

### Webserver

```shell
docker build \
  -t $CONTAINER_REPOSITORY/webserver:latest \
  -f webserver.Dockerfile \
  .
```

### Queue Worker

```shell
docker build \
  -t $CONTAINER_REPOSITORY/queue:latest \
  -f queue.Dockerfile \
  .
```

### Schedule Runner

```shell
docker build \
  -t $CONTAINER_REPOSITORY/schedule:latest \
  -f schedule.Dockerfile \
  .
```
