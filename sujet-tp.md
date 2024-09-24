# Partie 1 | application des règles

## Environnement de travail

Vous avez le choix !!!

Je conseil une VM dans OpenStack (cela vous permettra de vous familiariser avec la plateforme) -> 2cpu, 4Go ram et docker

Vous pouvez aussi utiliser n'importer quelle machine avec Docker qui tourne (pc perso, machine tpr, etc).

## Comment fonctionne Docker ici ?

Dans le dossier `conteneurs/ssh` vous trouverez de quoi construire un conteneur.

Vous trouverez aussi un `docker-compose.yaml` pour lancer le-dit conteneur (voir Readme.md)

Vous remarquerez que ce repo Git est lourd... Si vous n'arrivez pas à 'build' les conteneurs : rendez-vous dans `conteneurs/imges` pour 'load' les images.

## Observation

Ici on cherche à comprendre ce que fait Docker quand on le lance.

Q.0: Avez vous iptables ? les autres Xtables ? nftables ?

Q1.1: Décrivez les interfaces qui existent avant de lancer le conteneur.

Q1.2: Décrivez les interfaces qui apparaissent lorsque vous lancez le conteneur.

Q2.1: Décrivez les règles Xtables qui existent avant de lancer le conteneur.

Q2.2: Décrivez les règles Xtables qui apparaissent lorsque vous lancez le conteneur.

Q2.3: Que font ces règles ?

Q3: Si vous décommentez la partie `ports` du docker-compose, que se passe t-il au niveau des règles Xtables, pourquoi ?

Q4: Expérimentez avec les `docker networks` : quelles sont les règles que ces réseaux créent dans Xtables ? C'est la seule chose qu'ils font ? (https://docs.docker.com/compose/networking/)

## Pratique

Ok, on a bien regarder ce qui se passait sur votre machine (ou du moins le host docker), regardons ce que l'on peut faire avec des règles Xtables.

Si Vous avez bien regarder, il éxiste une partie `cap` (capabilities) dans le docker-compose. C'est ce qui permet d'utiliser Xtables à l'intérieur du conteneur (une sombre histoire d'appels noyaux [https://www.man7.org/linux/man-pages/man7/capabilities.7.html])

Vous pouvez donc modifier les règles Xtables appliquées **dans** le conteneur via le fichier `rules`

Q1: Écrivez les règles pour réaliser les actions suivantes via des commandes Xtables 'legacy':

    * bloquer le ping
    * autoriser uniquement le ping
    * autoriser uniquement le ping dpuis une ip spécifique
    * bloquer le port 22 (vous pouvez ssh pour sur le conteneur pour tester)
    * bloquer tout les ports sauf le port 22
    * autoriser uniquement les connexions ssh depuis une ip spécifique (vous pouvez démarrer un autre conteneur)
    * autoriser uniquement les connexions ssh depuis un addresse mac spécifique
    * autoriser uniquement les connexions sortantes
    * autoriser uniquement les flux déjà éxistant (conntrack)

Q1.bis: Essayez d'écrire les même règles via `nft`


# Partie 2 | Bonnes Pratiques

## Conception d'une architecture WEB

Ici on s'amuse un peu plus et vous devez plûtot vous placer dans la peau d'un architecte réseau/système. Faites des schemas, posez des questions, travaillez en équipe, experimentez des trucs.

Q1: Énumerez les bonnes pratiques que vous voulez mettre en place niveau sécurité réseau dans votre infrastructure.

Q2: Énumerez les conteneurs que vous souhaitez mettre en place, faites un schema ou décrivez votre architecture.

## Réalisation

Q1: à l'aide de `docker-compose` et de plusieurs conteneurs, réalisez une architecture web.

Q2: Maintenant, sécurisez cette architecture via le fichier `rules`. (le but c'est le fw : il faut donc y ajouter les règles)

ps: vous pouvez gerer les ips avec docker compose au besoin

Qbonus: rendre l'architecture hautement disponnible. (keepalived)
