# caddy

[![wemake.services](https://img.shields.io/badge/style-wemake.services-green.svg?label=&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC%2FxhBQAAAAFzUkdCAK7OHOkAAAAbUExURQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP%2F%2F%2F5TvxDIAAAAIdFJOUwAjRA8xXANAL%2Bv0SAAAADNJREFUGNNjYCAIOJjRBdBFWMkVQeGzcHAwksJnAPPZGOGAASzPzAEHEGVsLExQwE7YswCb7AFZSF3bbAAAAABJRU5ErkJggg%3D%3D)](http://wemake.services) [![Build Status](https://travis-ci.org/wemake-services/caddy-docker.svg?branch=master)](https://travis-ci.org/wemake-services/caddy-docker) [![Dockerhub](https://img.shields.io/docker/pulls/wemakeservices/caddy-docker.svg)](https://hub.docker.com/r/wemakeservices/caddy-docker/) [![image size](https://images.microbadger.com/badges/image/wemakeservices/caddy-docker.svg)](https://microbadger.com/images/wemakeservices/caddy-docker) [![caddy's version](https://img.shields.io/badge/version-0.10.10-blue.svg)](https://github.com/mholt/caddy/tree/v0.10.10)

![Caddy](https://caddyserver.com/resources/images/brand/caddy-black.png)

A `docker` image for [Caddy](https://caddyserver.com).


## License

This image uses a [release from `github`](https://github.com/mholt/caddy/releases), so it is a subject to the project's [Apache 2.0 license](https://github.com/mholt/caddy/blob/master/LICENSE.txt) and not to [the EULA license](https://github.com/mholt/caddy/blob/master/dist/EULA.txt).

You can use it for almost everything.
This project is licensed under MIT. See [LICENSE.md](LICENSE.md) for details.


## Running

```bash
docker run -p 2015:2015 wemakeservices/caddy-docker
```

### docker-compose example

This image is created to be used in `docker-compose.yml`. Here's an example:

```yaml
version: '3'
services:
  caddy:
    image: "wemakeservices/caddy-docker:latest"
    volumes:
      - ./some/path:/root/.caddy  # to save certificates on disk
      - ./some/Caddyfile:/etc/Caddyfile  # to mount custom Caddyfile
    ports:
      - "2015:2015"
      - "80:80"
      - "443:443"
    depends_on:
      - web

  web:
    build: .
    command: python manage.py runserver 0.0.0.0:5000
    ports:
      - "5000:5000"
```

### Changing default Caddyfile

Just specify another `Caddyfile` via command line:

```bash
docker run -p 2015:2015 -v `pwd`/test/Caddyfile:/etc/Caddyfile wemakeservices/caddy-docker
```

### Backing-up certificates

Let's Encrypt has [rate limits](https://letsencrypt.org/docs/rate-limits/). It is wise to reuse certificates and back them up:

```bash
docker run -p 2015:2015 -v `pwd`/backup:/root/.caddy wemakeservices/caddy-docker
```

It is also possible to combine this trick with [`Changing default Caddyfile`](https://github.com/wemake-services/caddy-docker#changing-default-caddyfile).

### Changing Caddy's version

This image supports `VERSION` build-time argument:

```bash
docker build --build-arg VERSION=0.10.0 -t caddy:0.10.0 .
```


## See also

- Automated Caddy reverse proxy for docker containers: [`caddy-gen`](https://github.com/wemake-services/caddy-gen)


## Developing

If you are building a container from source, you will need to build it as follows:

```bash
docker build -t caddy:latest .
```

And then run it locally:

```bash
docker run -p 2015:2015 caddy:latest
```
