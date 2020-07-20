#!/bin/sh
# vim:sw=4:ts=4:et

set -e

if [ "$1" = "nginx" -o "$1" = "nginx-debug" ]; then
    # change UID
    usermod -u $NGINX_UID nginx
    #　chown -Rf nginx /var/cache/nginx/*
    # chown -Rf nginx /var/lib/nginx/tmp/*
    # chown nginx:nginx /var/lib/nginx/tmp
    chown nginx:nginx /var/lib/nginx
    echo "Modify user nginx uid to $NGINX_UID"
fi

exec "$@"