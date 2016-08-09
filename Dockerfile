FROM registry.dataos.io/docker_openfalcon/centos:centos7.2.1511
MAINTAINER wangfw@asiainfo.com

ENV HOME=/home/work
ENV WORKSPACE=$HOME/open-falcon

WORKDIR /home
ADD scripts /home/work/scripts
ADD open-falcon.tar.gz /home/work/
RUN sh /home/work/scripts/env.sh
ADD conf/supervisord.conf /etc/supervisor/supervisord.conf
ADD conf/redis.conf /etc/redis.conf
CMD ["/usr/bin/supervisord"]
