FROM debian 

MAINTAINER philemon pensier <philemon.pensier@ensg.eu>

#proxy settings
ENV http_proxy 'http://10.0.4.2:3128'
ENV https_proxy 'https://10.0.4.2:3128'

RUN apt-get update && apt-get install -y postgresql-9.4-postgis-2.1 

ADD /./data/ /data/

USER postgres

RUN    /etc/init.d/postgresql start &&\
     psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
         createdb -O docker docker &&\  
     psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -f /data/createdb.sql &&\
     shp2pgsql -W "LATIN1" -I -s 2154 /data/30-.shp public.db | psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -d db 

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  trust" >> /etc/postgresql/9.4/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.4/bin/postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]
