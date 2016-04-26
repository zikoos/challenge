# Application permettant de diffuser de la donnée géographique de façon résiliante

---------------------------------------------------------------------------------------------------

Le but de ce projet est concevoir un SIG de type "cloud résilient", diffusant de la données géographique de manuère résilente. Ce projet a été réalisé par Philémon Pensier et Zakaria Ait-Omar, élèves de l'école nationale des sciences géographiques (ENSG) dans le cadre du master TSI (Technologies des Systèmes d'Information).

## Prérequis

Vous devez tout d'abord disposer de 3 ordinateurs équipés de Linux, ainsi que de Docker sur chaque machine. Pour réaliser ce projet, nous n'avons eu recours à aucun Raspberry PI. Vous devez également avoir installé docker-compose sur toutes les machines. Pour la suite, référez vous au document installation.md.

## Choix techniques

Pour répondre à ce besoin, nous avons mis en place les outils suivants:
* 3 machines Linux (un manager et deux esclaves), l'application doit en effet être résiliante
* postgresql et son extension spatiale postgis pour stocker les données géographiques
* geoserver pour publier les données géographiques
* PGpool pour assurer la duplication des données dans chacun des noeuds.
* HAproxy pour le rôle de Load Balancer
* Keepalived pour la répartition de charge et pour la haute disponibilité
* L'outil Docker swarm pour administer le cluster
* L'outil Consul pour ajouter les noeuds

### Architecture matérielle

![materiel](../master/diagrammes/diagramme_materiel.png)

### Architecture logicielle

![materiel](../master/diagrammes/logiciel.png)

### Architecture physique

![materiel](../master/diagrammes/admin.png)



