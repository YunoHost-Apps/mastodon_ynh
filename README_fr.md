# Mastodon pour YunoHost

[![Integration level](https://dash.yunohost.org/integration/mastodon.svg)](https://dash.yunohost.org/appci/app/mastodon)  
[![Install mastodon with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=mastodon)

*[Read this readme in english.](./README.md)* 

> *Ce package vous permet d'installer mastodon rapidement et simplement sur un serveur Yunohost.  
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

[![Latest Version](https://img.shields.io/badge/version-2.7.1-green.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/releases)
[![Status](https://img.shields.io/badge/status-testing-yellow.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/milestones)
[![Dependencies](https://img.shields.io/badge/dependencies-includes-lightgrey.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh#dependencies)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat)](https://raw.githubusercontent.com/YunoHost-Apps/mastodon_ynh/master/LICENSE)
[![Yunohost version](https://img.shields.io/badge/yunohost-2.7.12_tested-orange.svg?style=flat)](https://github.com/YunoHost/yunohost)
[![GitHub issues](https://img.shields.io/github/issues/YunoHost-Apps/mastodon_ynh.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/issues)

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
 * Documentation YunoHost: Si une documentation spécifique est nécessaire, n'hésitez pas à contribuer.

## Caractéristiques spécifiques YunoHost

#### Supported architectures

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mastodon%20%28Community%29.svg)](https://ci-apps.yunohost.org/ci/apps/mastodon/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mastodon%20%28Community%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mastodon/)
* Jessie x86-64b - [![Build Status](https://ci-stretch.nohost.me/ci/logs/mastodon%20%28Community%29.svg)](https://ci-stretch.nohost.me/ci/apps/mastodon/)

## Links

 * Signaler un bug: https://github.com/YunoHost-Apps/mastodon_ynh/issues
 * Site de l'application: Lien vers le site officiel de cette application
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
