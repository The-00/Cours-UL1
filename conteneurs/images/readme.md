# Pour les erreurs : registry-docker.ui -> connection refused

executer les commandes suivantes : 

```

cat ssh.tar | docker load
cat nginx.tar | docker load

```


# pour utiliser cette image :

REMPLACER

```
   build: .
```

PAR

```
   images: ttrova/cours:ssh
```
