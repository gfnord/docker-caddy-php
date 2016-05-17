FROM alpine:edge
MAINTAINER Mitchell Hewes <me@mitcdh.com>

ENV CADDY_FEATURES=git

# install caddy
RUN apk add --update curl openssh-client git tar \
 && curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/build?os=linux&arch=amd64&features=${CADDY_FEATURES}" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 && chmod 0755 /usr/bin/caddy \
 && setcap 'cap_net_bind_service=+ep' /usr/bin/caddy \
 && /usr/bin/caddy -version \
 && rm -rf /var/cache/apk/*

# add user and group
RUN addgroup -S www-data && \
 adduser -S -G www-data -g "Web Server" -h "/www" web-srv

EXPOSE 2015
VOLUME /www
WORKDIR /www

USER web-srv
CMD ["/usr/bin/caddy"]