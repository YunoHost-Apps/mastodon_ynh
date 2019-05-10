# Mastodon pour YunoHost

[![Integration level](https://dash.yunohost.org/integration/mastodon.svg)](https://dash.yunohost.org/appci/app/mastodon)  
[![Install Mastodon with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=mastodon)

*[Read this readme in english.](./README.md)* 

> *Ce package vous permet d'installer Mastodon rapidement et simplement sur un serveur Yunohost.  
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

:warning: MAJ 05/06/17 :Cette application peut maintenant fonctionner sur ARM, mais l'installation prend plusieurs heures et il faut ajouter un swapfile de 1Go.

:warning: Cette application utilise les packages backports de Debian, nous vous recommendons de ne pas installer cette application directement en production

## Vue d'ensemble
Mastodon est un réseau social gratuit et open source. Une alternative décentralisée aux plates-formes commerciales, elle évite les risques d'une seule société qui monopolise votre communication. Choisissez un serveur sur lequel vous faites confiance - selon votre choix, vous pouvez interagir avec tous les autres. N'importe qui peut exécuter sa propre instance de Mastodon et participer au réseau social de façon transparente.

**Version incluse:** 2.7.4

## Captures d'écran

![](https://framalibre.org/sites/default/files/mastodon.png)

## Configuration

#### Ajout d'un "swapfile" si vous avez moins de 2Go de RAM
```
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1024000
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```
ajouter cette ligne dans /etc/fstab
```
/swapfile       none    swap    sw      0       0
```

### Installation

#### Utilisation de __screen__ en cas de dÃ©connection
```
$ sudo apt-get install screen
$ screen
$ sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh.git
```
RÃ©cuperer l'installation aprÃ¨s une deconnection:
```
$ screen -d
$ screen -r
```
L'utilisateur admin est crÃ©e automatiquement comme: user@domain.tld

### Mise Ã  jour
#### Utilisation de __screen__ fortement recommandÃ©

`$ sudo yunohost app upgrade --verbose mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh.git`

## Recommandations

Vous ne pouvez pas installer Mastodon en subdirectory, vous devez obligatoirement utiliser un domaine ou un sous-domaine pour cette application.

Il semble important de fermer les inscriptions pour votre Mastodon, pour que Ã§a reste une instance privÃ©. Nous vous invitons Ã  bloquer les instances distantes malfaisantes depuis l'interface d'administration. Vous pouvez Ã©galement ajouter un texte sur votre page d'accueil dans l'administration.

## Documentation

 * Documentation officielle: https://docs.joinmastodon.org/

## Caractéristiques spécifiques YunoHost

#### Supported architectures

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mastodon%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/mastodon/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mastodon%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mastodon/)
* Jessie x86-64b - [![Build Status](https://ci-stretch.nohost.me/ci/logs/mastodon%20%28Apps%29.svg)](https://ci-stretch.nohost.me/ci/apps/mastodon/)

## Links

 * Signaler un bug: https://github.com/YunoHost-Apps/mastodon_ynh/issues
 * Site de l'application: https://joinmastodon.org/
 * Site Github de l'application: https://github.com/tootsuite/mastodon
 * Site web YunoHost: https://yunohost.org/

---

Informations pour les développeurs
----------------

**Seulement si vous voulez utiliser une branche de test pour le codage, au lieu de fusionner directement dans la banche principale.**
Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
```
