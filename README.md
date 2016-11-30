# Docker Caddy Server + PHP-FPM

Installs php-fpm with a config intended to be invoked from a Caddyfile `startup` command.

### Usage
````bash
docker pull gfnord/docker-caddy-php
````

### Structure
* `/www`: Web root

### Exposed Ports
* `8031`: http web server

### Credits
* [abiosoft](https://github.com/abiosoft) for [caddy-docker](https://github.com/abiosoft/caddy-docker) which the caddy curl was based on.
forked from mitcdh/docker-yourls
