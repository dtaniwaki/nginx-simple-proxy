ARG NGINX_VERSION=1.15.0
FROM nginx:$NGINX_VERSION

RUN apt-get update -q \
  && apt-get install -yq gettext-base \
  && apt-get clean \
  && rm -fr /var/lib/apt/lists/*
COPY proxy.conf.template /etc/nginx/
COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
