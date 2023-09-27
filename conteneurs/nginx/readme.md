# Objectif

Un serveur SSH qui permet, sans le rebuild, de configurer la "machine" via le fichier `rules`

# Fonctionnement

* Surcouche S6 de conteneur
* au lancement, execution du contenu de `/rules`
* Lancement d'un serveur SSH sur le port 22

# Utilisation

Configuration du fichier `rules`.
* Les règles Xptable
* Les configuration systèmes
* Les affichages / Logs

Configuration du fichier `docker-compose`.
* Network Capabilities
* Addresses IP
* Mac addresses

en fonctoin de votre distribution / version de docker :
```
docker compose up --build
# ou
docker-compose up --build
```

# Tips 

pour obetenir l'adresse IP du conteneur sans exposer :



```
#> docker ps

CONTAINER ID   IMAGE     COMMAND   CREATED          STATUS          PORTS     NAMES
4b3abdc4773c   ssh-ssh   "/init"   27 minutes ago   Up 56 seconds   22/tcp    ssh-ssh-1

#> docker inspect ssh-ssh-1 | jq '.[].NetworkSettings.Networks'

{
  "ssh_default": {
    "IPAMConfig": null,
    "Links": null,
    "Aliases": [
      "ssh-ssh-1",
      "ssh",
      "4b3abdc4773c"
    ],
    "NetworkID": "6e22941c37518801072512e28e5c6247da9ca3073a80720c3cff65e1b8cbfb0c",
    "EndpointID": "81ba77acd0a678c9fd0d47908a234ca9ef6aac0df4f6a5e1f01d41cd9e65c3d1",
    "Gateway": "172.24.0.1",
    "IPAddress": "172.24.0.2",            # <--- interessant ça
    "IPPrefixLen": 16,
    "IPv6Gateway": "",
    "GlobalIPv6Address": "",
    "GlobalIPv6PrefixLen": 0,
    "MacAddress": "02:42:ac:18:00:02",    # <--- ça aussi non ?
    "DriverOpts": null
  }
}

```
