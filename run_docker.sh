#!/bin/bash

echo configure docker containers

echo pulling postgis image
docker pull mdillon/postgis

#launch database
echo launching database
docker run --name postgis -d mdillon/postgis

#Création de la base de données
echo creation de la base de données
docker run --link postgis:db -ti -v $HOME/postgres_data:/var/lib/postgresql mdillon/postgis sh -c 'exec psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -f /var/lib/postgresql/createdb.sql'

echo sleeping
sleep 3m

#Copy shapefile into the database created
echo copy the shapefile into the databse
docker run --link postgis:db -ti -v $HOME/postgres_data:/var/lib/postgresql mdillon/postgis sh -c 'exec shp2pgsql -W "LATIN1" -I -s 2154 /var/lib/postgresql/30-.shp public.db | psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -d db'

echo now commit the image
docker commit postgis ppensier/postgis


#pull geoserver
#echo pulling geoserver
#docker pull kartoza/geoserver

#lancement de geoserver
#echo launching geoserver, it takes often time
#docker run --name geoserver --link postgis:postgis -p 8080:8080 -d kartoza/geoserver

