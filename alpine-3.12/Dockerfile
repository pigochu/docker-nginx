FROM alpine:3.12

LABEL maintainer="pigochu@gmail.com"

# Default NGINX UID is 101 , you can change this value
ENV NGINX_UID=101

COPY alpine-3.12/docker-entrypoint.sh /

RUN apk update && \
    apk upgrade && \
    apk add shadow && \
    apk add nginx && \
    apk add nginx-mod-http-cache-purge && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    chmod +x /docker-entrypoint.sh && \
    mkdir /run/nginx && \
    rm -Rf /var/lib/apk/*



ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 80
STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]

