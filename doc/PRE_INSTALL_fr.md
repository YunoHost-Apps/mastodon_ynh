## Points importants à lire avant l'installation

- **Mastodon** nécessite un **nom de domaine** dédié, par exemple : `domaine.tld` ou `mastodon.domaine.tld` sans apps installées sur ce domaine. En raison de la fédération, **il est impossible de changer le nom de domaine après l'installation.**
- L'utilisateur sélectionné pendant l'installation sera créé automatiquement dans Mastodon avec des droits d'administration.
- Pour que votre instance Mastodon reste privée et que la communauté soit sécurisée, il est important que les inscriptions soient fermées et vérifiées. Nous vous invitons à bloquer les instances indésirables depuis l'interface d'administration. Vous pouvez également ajouter un texte sur votre page d'accueil dans l'interface d'administration.

## Utilisation de *screen* en cas de déconnexion

L'installation de Mastodon peut être longue, selon les performances du serveur.  
Pour éviter que le processus soit interrompu par une déconnexion, vous pouvez utiliser `screen`.

```bash
sudo apt install screen
screen
sudo yunohost app install mastodon
```

Récupérer l'installation après une deconnection :

```bash
screen -d
screen -r
```
