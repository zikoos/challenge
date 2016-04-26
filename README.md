# Application permettant de diffuser de la donnée géographique de façon résiliante

---------------------------------------------------------------------------------------------------

Le but de ce projet est concevoir un SIG de type "cloud résilient", diffusant de la données géographique de manuère résilente. Ce projet a été réalisé par Philémon Pensier et Zakaria Ait-Omar, élèves de l'école nationale des sciences géographiques (ENSG) dans le cadre du master TSI (Technologies des Systèmes d'Information).

## Prérequis

Vous devez tout d'abord disposer de 3 ordinateurs équipés de Linux, ainsi que de Docker sur chaque machine. Pour réaliser ce projet, nous n'avons eu recours à aucun Raspberry PI. Vous devez également avoir installé docker-compose sur toutes les machines. Pour la suite, référez vous au document installation.md

## Choix techniques

choix techniques à détailler ...

### Architecture logique

### Architecture administrative

### Architecture physique


Now: two containers per node:

* postgresql+postgis container for your database. Both are communicating together (binding).

* geoserver container to publish your data

These application could work on more than two material nodes, because the application is resilient (using haproxy and docker swarm tools).


