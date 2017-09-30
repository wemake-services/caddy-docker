# caddy [![caddy's version](https://img.shields.io/badge/version-0.10.9-blue.svg)](https://github.com/mholt/caddy/tree/v0.10.9)

A `docker` image for [Caddy](https://caddyserver.com).


## License

This image uses a [release from `github`](https://github.com/mholt/caddy/releases), so it is a subject to the project's [Apache 2.0 license](https://github.com/mholt/caddy/blob/master/LICENSE.txt) and not to [the EULA license](https://github.com/mholt/caddy/blob/master/dist/EULA.txt).

You can use it for almost everything.


## Running

```bash
docker run -p 2015:2015 wemake.services/caddy
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

