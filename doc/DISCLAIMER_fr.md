## Points importants à lire avant l'installation

1. **Mastodon** nécessite un **nom de domaine** dédié, par exemple : mastodon.domain.tld
1. L'utilisateur sélectionné pendant l'installation sera créé automatiquement dans Mastodon avec des droits d'administration.
1. À la fin de l'installation, un mail est envoyé à cet utilisateur avec un mot de passe généré automatiquement.
1. Pour que votre instance Mastodon reste privée, il est important de fermer les inscriptions. Nous vous invitons à bloquer les instances distantes indésirables depuis l'interface d'administration. Vous pouvez également ajouter un texte sur votre page d'accueil dans l'administration.

## Captures d'écran

![](https://framalibre.org/sites/default/files/mastodon.png)

## Configuration

### Installation

#### Utilisation de *screen* en cas de déconnection
```
$ sudo apt-get install screen
$ screen
$ sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh.git
```
Récupérer l'installation après une deconnection :
```
$ screen -d
$ screen -r
```
L'utilisateur admin est créé automatiquement comme : user@domain.tld

### Mise à jour

#### Utilisation de *screen* fortement recommandée

`$ sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh --debug `

### Administration avec tootctl

`$ (cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl --help)`

## Caractéristiques spécifiques YunoHost

#### Support multi-utilisateur

L'authentification LDAP est activée. Tous les utilisateurs YunoHost peuvent s'authentifier.

Se déconnecter depuis le portail YunoHost ne vous déconnecte pas de Mastodon. Voir https://github.com/YunoHost/issues/issues/501
