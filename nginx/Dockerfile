FROM hub.c.163.com/library/nginx:1.11-alpine

MAINTAINER  Frank Wu "gang.wu@istuary.com"

WORKDIR /etc/nginx
RUN mkdir -p /data/web/log
VOLUME ["/data/web"]

COPY  nginx.conf   /etc/nginx/nginx.conf
COPY  sites-enabled/*   /etc/nginx/conf.d/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
