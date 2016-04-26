
# Installation du projet

## Prérequis

Pour les prérequis, référez vous au fichier d'introduction.

## HAproxy



## KeepAlived



## Consul

Téléchager consul à l'adresse suivante:

[https://www.consul.io/downloads.html](https://www.consul.io/downloads.html)

Télécharger le binaire, ainsi que le "UI" pour visualiser les noeuds.

Copier ensuite le binaire dans le dossier /usr/local/bin/ et consul-ui dans /$HOME/ui .

Exécuter l'interface de consul:

`consul agent -dev -ui -ui-dir /$HOME/consul/ui -bind 172.31.40.67 -client 172.31.40.67`

Vous devez également mettre à jour la variable d'environnement $DOCKER_OPTS dans le fichier `/etc/default/docker` : 

`DOCKER_OPTS="--storage-driver=overlay -D -H tcp://0.0.0.0:2375 --cluster-store=consul://172.31.40.67:8500 --cluster-advertise=eth0:2375"`

Ceci assure que le démon Docker est accessible depuis le manager.

Démarez ensuite votre cluster:

`docker run --rm swarm create`

Cela générera une clé unique pour le cluster.

Ajoutez ensuite les noeuds au cluster:

`docker run -d swarm join --advertise 172.31.56.50 consul://172.31.40.67:8500`

Démarrez le manager: 

`docker run -d -p 2376:2375 swarm manage -H 0.0.0.0:2375 consul://192.168.1.27:8500/`

Il ne reste plus qu'à modifier le Docker host pour exécutez les commandes Docker:

`export DOCKER_HOST="tcp://172.31.40.67:2376"`

Grâce à consul "UI", nous pouvons visualiser le résultat:

![consul](../master/diagrammes/consul.png)

## Lancement du projet

Le lancement se fait simplement via la commande : 

`docker-compose up`


Après avoir lancé la commande docker-compose, on peut désormais se rendre sur la page: 
* http://127.0.0.1:8080/geoserver
* login: admin, password: geoserver
* ajouter un nouveau workspace
* ajouter un nouvel entrepôt (une base postGis)
	* nom de la base : db
	* hostname : adresse IP du conteneur postgis
	* user : postgres
	* passwd : postgres
* il ne reste plus qu'à publier la couche, cocher au passage compute from native bounds

![result](../master/diagrammes/result.png)



