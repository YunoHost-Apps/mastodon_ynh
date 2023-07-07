## Points importants à lire avant l'installation

1. **Mastodon** nécessite un **nom de domaine** dédié, par exemple : `domaine.tld` ou `mastodon.domaine.tld` sans apps installées sur ce domaine
1. Il est impossible de changer le nom de domaine après l'installation.
1. L'utilisateur sélectionné pendant l'installation sera créé automatiquement dans Mastodon avec des droits d'administration.
1. À la fin de l'installation, un mail est envoyé à cet utilisateur avec un mot de passe généré automatiquement.
1. Pour que votre instance Mastodon reste privée, il est important de fermer les inscriptions. Nous vous invitons à bloquer les instances distantes indésirables depuis l'interface d'administration. Vous pouvez également ajouter un texte sur votre page d'accueil dans l'administration.

## Utilisation de *screen* en cas de déconnexion

L'installation de Mastodon peut être longue, selon les performances du serveur. Pour éviter que le processus soit interrompu par une déconnexion, on peut utiliser `screen`.

```
$ sudo apt install screen
$ screen
$ sudo yunohost app install mastodon
```
Récupérer l'installation après une deconnection :
```
$ screen -d
$ screen -r
```
