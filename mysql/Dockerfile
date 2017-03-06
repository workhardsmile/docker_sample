FROM daocloud.io/library/mysql:5.6

MAINTAINER  Frank Wu "gang.wu@istuary.com"
# Write Permission
RUN usermod -u 1000 mysql && chown mysql.mysql /var/run/mysqld/

EXPOSE 3306
VOLUME ["/opt"]
