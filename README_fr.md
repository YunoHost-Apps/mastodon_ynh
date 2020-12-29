# Mastodon pour YunoHost

[![Integration level](https://dash.yunohost.org/integration/mastodon.svg)](https://dash.yunohost.org/appci/app/mastodon) ![](https://ci-apps.yunohost.org/ci/badges/mastodon.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/mastodon.maintain.svg)    
[![Install Mastodon with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=mastodon)

*[Read this readme in english.](./README.md)* 

> *Ce package vous permet d'installer Mastodon rapidement et simplement sur un serveur YunoHost.  
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble
Mastodon est un réseau social de microblog auto-hébergé et open source. C'est une alternative décentralisée aux plates-formes commerciales comme Twitter. Mastodon évite ainsi les risques qu'une seule société monopolise votre communication à des fins commerciales.

**Version incluse:** 3.2.2

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

## Documentation

 * Documentation officielle : https://docs.joinmastodon.org/

## Caractéristiques spécifiques YunoHost

#### Support multi-utilisateurs

L'authentification LDAP est activée. Tous les utilisateurs YunoHost peuvent s'authentifier.

#### Architectures supportées

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mastodon%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/mastodon/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mastodon%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mastodon/)

## Links

 * Signaler un bug : https://github.com/YunoHost-Apps/mastodon_ynh/issues
 * Site de l'application : https://joinmastodon.org/
 * Dépôt de l'application principale : https://github.com/tootsuite/mastodon
 * Site web YunoHost : https://yunohost.org/

---

Informations pour les développeurs
----------------

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
```
