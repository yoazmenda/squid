
FROM ubuntu:12.04

# update all
RUN apt-get -y update \
&& apt-get -y upgrade \
&& apt-get -y install squid

# backup original squid.conf
RUN cp /etc/squid3/squid.conf /etc/squid3/squid.conf.default

EXPOSE 3128/tcp

COPY entrypoint.sh /sbin/entrypoint.sh
COPY entrypoint.sh /sbin/entrypoint.sh
COPY squid.conf /etc/squid3/squid.conf
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]