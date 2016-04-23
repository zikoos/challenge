FROM fedora:21

MAINTAINER TSI

RUN yum install -y keepalived

RUN echo "net.ipv4.ip_nonlocal_bind = 1" >> /etc/sysctl.conf

COPY ./start_keep.sh /usr/local/sbin/start_keep.sh
RUN chmod u+x /usr/local/sbin/start_keep.sh

ENTRYPOINT [ "/bin/bash", "/usr/local/sbin/start_keep.sh" ]
