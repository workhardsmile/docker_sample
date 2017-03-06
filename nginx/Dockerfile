FROM daocloud.io/nginx:1.9.0

MAINTAINER  Frank Wu "gang.wu@istuary.com"
ADD  sources.list /etc/apt/sources.list
ADD  nginx.conf   /etc/nginx/nginx.conf
ADD  sites-enabled/*   /etc/nginx/conf.d/
RUN  mkdir -p /opt/htdocs
RUN  mkdir -p /opt/log/nginx
RUN  chown -R www-data.www-data /opt/htdocs /opt/log
RUN  apt-get -o Acquire::Check-Valid-Until=false update -y
RUN  apt-get -o Acquire::Check-Valid-Until=false install -y vim

EXPOSE 80
VOLUME ["/opt"]

