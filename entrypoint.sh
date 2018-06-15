#!/bin/sh

envsubst '$$NGINX_SERVER_NAME $$NGINX_SERVER_PORT $$NGINX_UPSTREAM_HOST $$NGINX_UPSTREAM_PORT' < /etc/nginx/proxy.conf.template > /etc/nginx/conf.d/proxy.conf

exec "$@"
