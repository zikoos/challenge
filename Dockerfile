FROM consol/tomcat-8.0


RUN apt-get update && apt-get -y install unzip
RUN wget -q http://sourceforge.net/projects/geoserver/files/GeoServer/2.8.2/geoserver-2.8.2-war.zip -O /tmp/geoserver.zip
RUN unzip -q /tmp/geoserver.zip -d /tmp
RUN mv /tmp/geoserver.war /opt/tomcat/webapps/geoserver.war

#download
RUN curl -L -o pgpool-II-3.4.0.tar.gz http://www.pgpool.net/download.php?f=pgpool-II-3.4.0.tar.gz -e http_proxy=10.0.4.2:3128 
RUN tar zxvf pgpool-II-3.4.0.tar.gz

# Build pgpool2
WORKDIR /pgpool-II-3.4.0
RUN ./configure
RUN make
RUN make install

#config
RUN mkdir /var/run/pgpool
ADD ./pgpool.conf /usr/local/etc/
RUN mkdir /var/run/pgpool
ADD ./pgpool.conf /usr/local/etc/

# Build pgpool2 extensions for postgres
WORKDIR /pgpool-II-3.4.0/src/sql
RUN make
RUN make install
RUN ldconfig

WORKDIR /





CMD /opt/tomcat/bin/deploy-and-run.sh
