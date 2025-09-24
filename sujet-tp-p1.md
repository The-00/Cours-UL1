# Partie 1 | application des règles

## Environnement de travail

Vous avez le choix !!!

Je conseil une VM dans OpenStack (cela vous permettra de vous familiariser avec la plateforme) -> 2cpu, 4Go ram et docker + https://docs.docker.com/engine/install/

Vous pouvez aussi utiliser n'importer quelle machine avec Docker qui tourne (pc perso, machine tpr, etc).

## Comment fonctionne Docker ici ?

Dans le dossier `conteneurs/ssh` vous trouverez de quoi construire un conteneur.

Vous trouverez aussi un `docker-compose.yaml` pour lancer le-dit conteneur (voir Readme.md)

Vous remarquerez que ce repo Git est lourd... Si vous n'arrivez pas à 'build' les conteneurs : rendez-vous dans `conteneurs/imges` pour 'load' les images.

## Observation

Ici on cherche à comprendre ce que fait Docker quand on le lance.

Q.0: Avez vous iptables ? les autres Xtables ? nftables ?

Q1.1: Décrivez les interfaces qui existent avant de lancer le conteneur.

Q1.2: Décrivez les règles Xtables qui existent avant de lancer le conteneur.

Q2.1: Décrivez les interfaces qui apparaissent lorsque vous lancez le conteneur.

Q2.2: Décrivez les règles Xtables qui apparaissent lorsque vous lancez le conteneur. Si rien ne change : pourquoi ?

Q3: Si vous décommentez la partie `ports` du docker-compose, que se passe t-il au niveau des règles Xtables, pourquoi ?

Q4: Expérimentez avec les `docker networks` : quelles sont les règles que ces réseaux créent dans Xtables ? C'est la seule chose qu'ils font ? (https://docs.docker.com/compose/networking/)

## Pratique

Ok, on a bien regarder ce qui se passait sur votre machine (ou du moins le host docker), regardons ce que l'on peut faire avec des règles Xtables.

Si Vous avez bien regarder, il éxiste une partie `add_cap` (capabilities) dans le docker-compose. C'est ce qui permet d'utiliser Xtables à l'intérieur du conteneur (une sombre histoire d'appels noyaux [https://www.man7.org/linux/man-pages/man7/capabilities.7.html])

Vous pouvez donc modifier les règles Xtables appliquées **dans** le conteneur via le fichier `rules`. Cela peut vous permettre de réviser votre syntaxe.

Q1: Écrivez les règles pour réaliser les actions suivantes via des commandes Xtables 'legacy' (pas toutes en même temps, sinon il y à des choses qui vont se contredire):

    * bloquer le ping
    * autoriser uniquement le ping
    * autoriser uniquement le ping dpuis une ip spécifique
    * bloquer le port 22 (vous pouvez ssh pour sur le conteneur pour tester)
    * bloquer tout les ports sauf le port 22
    * autoriser uniquement les connexions ssh depuis une ip spécifique (vous pouvez démarrer un autre conteneur)
    * autoriser uniquement les connexions ssh depuis un addresse mac spécifique
    * autoriser uniquement les connexions sortantes
    * autoriser uniquement les flux déjà éxistant (conntrack)

Q2: Essayez d'écrire les même règles via `nft`, vous pouvez vous aider de `iptables-translate` (attention, le format n'est pas tout à fait celui d'un fichier de config comme dans le cours).

