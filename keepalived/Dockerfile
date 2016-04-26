FROM ubuntu:14.04.4 
MAINTAINER TSI
ENV http_proxy 'http://10.0.4.2:3128'
ENV https_proxy 'http://10.0.4.2:3128'

RUN apt-get update -y && \
  apt-get upgrade -y

RUN apt-get install keepalived -y
ADD start_keep.sh /
ADD ./keepalived.config /etc/keepalived/
ADD config_keepalived.sh /
RUN chmod +x /config_keepalived.sh
RUN chmod +x /start_keep.sh 
ENTRYPOINT ["/start_keep.sh"]
