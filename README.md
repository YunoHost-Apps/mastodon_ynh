# Mastodon for YunoHost

[![Latest Version](https://img.shields.io/badge/version-_--_-green.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/releases)
[![Status](https://img.shields.io/badge/status-testing-yellow.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/milestones)
[![Dependencies](https://img.shields.io/badge/dependencies-includes-lightgrey.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh#dependencies)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat)](https://raw.githubusercontent.com/YunoHost-Apps/mastodon_ynh/master/LICENSE)
[![Yunohost version](https://img.shields.io/badge/yunohost-2.4.2_tested-orange.svg?style=flat)](https://github.com/YunoHost/yunohost)
[![GitHub issues](https://img.shields.io/github/issues/YunoHost-Apps/mastodon_ynh.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/issues)

## Mastodon c'est quoi ?

Mastodon est un réseau social gratuit et open source. Une alternative décentralisée aux plates-formes commerciales, elle évite les risques d'une seule société qui monopolise votre communication. Choisissez un serveur sur lequel vous faites confiance - selon votre choix, vous pouvez interagir avec tous les autres. N'importe qui peut exécuter sa propre instance de Mastodon et participer au réseau social de façon transparente.

[Source code](https://github.com/tootsuite/mastodon)

### Installation

`$ sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh.git`

Une fois l'installation effectuée, vous pouvez créer un compte manuellement sur Mastodon depuis votre navigateur. Lorsque vous avez crée le premier utilisateur vous pouvez créer l'administrateur de votre Mastodon. Pour celà, il faut impérativement passer par une interface en ligne de commande et taper les commandes suivantes :

**se connecter en sudo sur l'utilisateur**

`$ sudo su mastodon`

**se placer dans le répertoire où est installé Mastodon**

`$ cd /opt/mastodon/live`

**lancer la commande de création de l'administrateur**

`$ RAILS_ENV=production bin/bundle exec rails mastodon:make_admin USERNAME=*Nom de votre utilisateur*`

### Mise à jour

`$ sudo yunohost app upgrade --verbose mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh.git`

## Recommandations

Vous ne pouvez pas installer Mastodon en subdirectory, vous devez obligatoirement utiliser un domaine ou un sous-domaine pour cette application.

Il semble important de fermer les inscriptions pour votre Mastodon, pour que ça reste une instance privé. Nous vous invitons à bloquer les instances distantes malfaisantes depuis l'interface d'administration. Vous pouvez également ajouter un texte sur votre page d'accueil dans l'administration.

## What is Mastodon?

Mastodon is a free, open-source social network. A decentralized alternative to commercial platforms, it avoids the risks of a single company monopolizing your communication. Pick a server that you trust — whichever you choose, you can interact with everyone else. Anyone can run their own Mastodon instance and participate in the social network seamlessly.

[Source code](https://github.com/tootsuite/mastodon)

### Install

`$ sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh.git`

After installation, you can create an account manually on Mastodon from your browser. When you have created the first user you can create the administrator of your Mastodon. For this, it is imperative to go through a command line and type the following commands:

**sudo to the user**

`$ sudo su mastodon`

**change directory where Mastodon is installed**

`$ cd /opt/mastodon/live`

**launch the command to create the administrator**

`$ RAILS_ENV=production bin/bundle exec rails mastodon:make_admin USERNAME=*username*`

### Update

`$ sudo yunohost app upgrade --verbose mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh.git`

## Recommendation

You can't install Mastodon in subdirectory, you must use a domain or subdomain for this application.

It seems important to close the inscriptions for your Mastodon, so that it remains a private body. We invite you to block remote malicious instances from the administration interface. You can also add text on your home page.
