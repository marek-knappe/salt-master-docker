FROM debian:jessie

MAINTAINER Marek Knappe <marek.knappe@gmail.com>

RUN apt-get update && \
    apt-get install wget -y && \
    wget -O - https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - && \
    echo "deb http://repo.saltstack.com/apt/debian/8/amd64/latest jessie main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install salt-master salt-ssh -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor && \
mkdir -p /var/log/supervisor

COPY files/supervisord-salt.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/root/.ssh", "/etc/salt", "/var/cache/salt", "/var/logs/salt", "/srv"]

EXPOSE 4505 4506

CMD ["/usr/bin/supervisord"]

