# Mastodon for YunoHost

[![Latest Version](https://img.shields.io/badge/version-2.4.5-green.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/releases)
[![Status](https://img.shields.io/badge/status-testing-yellow.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/milestones)
[![Dependencies](https://img.shields.io/badge/dependencies-includes-lightgrey.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh#dependencies)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat)](https://raw.githubusercontent.com/YunoHost-Apps/mastodon_ynh/master/LICENSE)
[![Yunohost version](https://img.shields.io/badge/yunohost-2.7.12_tested-orange.svg?style=flat)](https://github.com/YunoHost/yunohost)
[![GitHub issues](https://img.shields.io/github/issues/YunoHost-Apps/mastodon_ynh.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/issues)

[![Install Mastodon with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=mastodon)

:warning: MAJ 05/06/17 :Cette application peut maintenant fonctionner sur ARM, mais l'installation prend plusieurs heures et il faut ajouter un swapfile de 1Go.

:warning: Cette application utilise les packages backports de Debian, nous vous recommendons de ne pas installer cette application directement en production

:warning: UPDATE 05/06/17 :This app can work now on ARM, but installation takes several hours and you must add a swapfile of 1GB.

:warning: This application uses the Debian backports packages, do not install this application directly in production

## Mastodon c'est quoi ?

Mastodon est un réseau social gratuit et open source. Une alternative décentralisée aux plates-formes commerciales, elle évite les risques d'une seule société qui monopolise votre communication. Choisissez un serveur sur lequel vous faites confiance - selon votre choix, vous pouvez interagir avec tous les autres. N'importe qui peut exécuter sa propre instance de Mastodon et participer au réseau social de façon transparente.

[Source code](https://github.com/tootsuite/mastodon)

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

#### Utilisation de __screen__ en cas de déconnection
```
$ sudo apt-get install screen
$ screen
$ sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh.git
```
Récuperer l'installation après une deconnection:
```
$ screen -d
$ screen -r
```
L'utilisateur admin est crée automatiquement comme: user@domain.tld

### Mise à jour
#### Utilisation de __screen__ fortement recommandé

`$ sudo yunohost app upgrade --verbose mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh.git`

## Recommandations

Vous ne pouvez pas installer Mastodon en subdirectory, vous devez obligatoirement utiliser un domaine ou un sous-domaine pour cette application.

Il semble important de fermer les inscriptions pour votre Mastodon, pour que ça reste une instance privé. Nous vous invitons à bloquer les instances distantes malfaisantes depuis l'interface d'administration. Vous pouvez également ajouter un texte sur votre page d'accueil dans l'administration.

## What is Mastodon?

Mastodon is a free, open-source social network. A decentralized alternative to commercial platforms, it avoids the risks of a single company monopolizing your communication. Pick a server that you trust — whichever you choose, you can interact with everyone else. Anyone can run their own Mastodon instance and participate in the social network seamlessly.

[Source code](https://github.com/tootsuite/mastodon)

#### Adding "swapfile" If you have less than 2Go of RAM
```
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1024000
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```
add this line on /etc/fstab
```
/swapfile       none    swap    sw      0       0
```

### Install
#### Using __screen__ in case of disconnect
```
$ sudo apt-get install screen
$ screen
$ sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh.git
```
Recover after disconnect:
```
$ screen -d
$ screen -r
```
The admin user is automatically created as: user@domain.tld

### Update
#### Using __screen__ highly recommended

`$ sudo yunohost app upgrade --verbose mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh.git`

## Recommendation

You can't install Mastodon in subdirectory, you must use a domain or subdomain for this application.

It seems important to close the inscriptions for your Mastodon, so that it remains a private body. We invite you to block remote malicious instances from the administration interface. You can also add text on your home page.
