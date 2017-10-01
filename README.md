# caddy

[![wemake.services](https://img.shields.io/badge/style-wemake.services-green.svg?label=&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC%2FxhBQAAAAFzUkdCAK7OHOkAAAAbUExURQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP%2F%2F%2F5TvxDIAAAAIdFJOUwAjRA8xXANAL%2Bv0SAAAADNJREFUGNNjYCAIOJjRBdBFWMkVQeGzcHAwksJnAPPZGOGAASzPzAEHEGVsLExQwE7YswCb7AFZSF3bbAAAAABJRU5ErkJggg%3D%3D)](http://wemake.services) [![Build Status](https://travis-ci.org/wemake-services/caddy-docker.svg?branch=master)](https://travis-ci.org/wemake-services/caddy-docker) [![caddy's version](https://img.shields.io/badge/version-0.10.9-blue.svg)](https://github.com/mholt/caddy/tree/v0.10.9)

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

This image is created be used in `docker-compose.yml`. Here's an example:

```yaml
version: '2'
services:
  caddy:
    image: "wemakeservices/caddy-docker:latest"
    volumes:
      - ./docker/caddy/Caddyfile:/root/.caddy/Caddyfile
    ports:
      - "2015:2015"
      - "80:80"
      - "443:443"
    depends_on:
      - web

  web:
    build: .
    command: command: python manage.py runserver 0.0.0.0:5000
    ports:
      - "5000:5000"
```

### Changing default Caddyfile

Just specify another `Caddyfile` via command line:

```bash
docker run -p 2015:2015 -v $PWD/test/Caddyfile:/root/.caddy/Caddyfile wemakeservices/caddy-docker
```

### Changing Caddy's version

This image supports `VERSION` build-time argument:

```bash
docker build --build-arg VERSION=0.10.0 -t caddy:0.10.0 .
```


## Developing

If you are building a container from source, you will need to build it as follows:

```bash
docker build -t caddy:latest .
```

And then run it locally:

```bash
docker run -p 2015:2015 caddy:latest
```
