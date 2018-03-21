FROM alpine:3.7

LABEL maintainer="Nikita Sobolev <sobolevn@wemake.services>"

ARG VERSION="0.10.11"

RUN apk update && apk upgrade \
  && apk add --no-cache openssh-client git \
  && apk add --no-cache --virtual .build-dependencies tar curl

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://github.com/mholt/caddy/releases/download/v${VERSION}/caddy_v${VERSION}_linux_amd64.tar.gz" \
    | tar --no-same-owner -C /usr/bin -xz \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version \
 && apk del .build-dependencies

EXPOSE 80 443 2015
VOLUME /root/.caddy

COPY Caddyfile /etc/Caddyfile

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
