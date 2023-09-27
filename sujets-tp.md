# TP 1 | application des règles

## Comment fonctionne Docker ?

Dans le dossier `conteneurs/ssh` vous trouverez de quoi construire un conteneur.

Vous trouverez aussi un `docker-compose.yaml` pour lancer le-dit conteneur (voir Readme.md)


## Observation

Q1: Décrivez les interfaces qui apparaissent lorsque vous lancez le conteneur.

Q2: Décrivez les règles Xtables qui apparaissent lorsque vous lancez le conteneur.

Q2.bis: Que font ces règles ?

Q3: Expérimentez avec les `docker networks` : quelles sont les règles que ces réseaux créent dans Xtables ? C'est la seule chose qu'ils font ? (https://docs.docker.com/compose/networking/)

## Pratique

Vous pouvez modifier les règles Xtables appliquées dans le conteneur via le fichier `rules`

Q1: Écrivez les règles pour réaliser les actions suivantes via des commandes Xtables 'legacy':

    * bloquer le ping
    * autoriser uniquement le ping
    * autoriser uniquement le ping dpuis une ip spécifique
    * bloquer le port 22 (vous pouvez ssh pour sur le conteneur pour tester)
    * bloquer tout les ports sauf le port 22
    * autoriser uniquement les connections ssh depuis une ip spécifique (vous pouvez démarer un autre conteneur)
    * autoriser uniquement les connections ssh depuis un addresse mac spécifique
    * autoriser uniquement les connections sortantes
    * autoriser uniquement les flux déjà éxistant

Q1.bis: essayer d'écrire les même règles via `nft`


# TP 2 | Bonnes Pratiques

## Conception d'une architecture WEB

Q1: Énumerez les bonnes pratiques que vous voulez mettre en place niveau sécurité réseau dans votre infrastructure

Q2: Énumerez les conteneurs que vous souhaitez mettre en place, faites un schema ou décrivez votre architecture

## Réalisation

Q1: à l'aide de `docker-compose`, de plusieurs conteneurs et fichiers `rules`, réalisez une architecture web sécurisée avec un accès admin OOB. (le but c'est le fw : il faut donc y ajouter les règles)

ps: vous pouvez gerer les ips avec docker compose

Q1.bis: rendre l'architecture hautement disponnible. (keepalived)
