# Application permettant de diffuser de la donnée géographique de façon résiliante

---------------------------------------------------------------------------------------------------

Ce projet a été réalisé par Philémon Pensier et Zakaria Ait-Omar, élèves de l'école nationale des sciences géographiques (ENSG) dans le cadre du master TSI (Technologies des Systèmes d'Information).

## Architecture de l'application

Now: two containers per node:

* postgresql+postgis container for your database. Both are communicating together (binding).

* geoserver container to publish your data

These application could work on more than two material nodes, because the application is resilient (using haproxy and docker swarm tools).

## Installation

Now just execute this file: run_docker.sh

Then, follow the instructions. These instructions are coming soon ...


