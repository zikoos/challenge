FROM debian:latest

MAINTAINER philemon pensier <https://github.com/ppensier>

ADD /data/ /data/

RUN apt-get update && \
    apt-get install -y postgresql-9.4-postgis-2.1 

#start postgresql service
RUN /etc/init.d/postgresql start 

RUN su - postgres
#USER postgres

#RUN psql -U postgres

RUN echo toto 

#RUN psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -f /data/createdb.sql

#RUN shp2pgsql -W "LATIN1" -I -s 2154 /data/30-.shp public.db | psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -d db

