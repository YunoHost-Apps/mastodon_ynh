# Mastodon for YunoHost

[![Latest Version](https://img.shields.io/badge/version-1.4.1-green.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/releases)
[![Status](https://img.shields.io/badge/status-testing-yellow.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/milestones)
[![Dependencies](https://img.shields.io/badge/dependencies-includes-lightgrey.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh#dependencies)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat)](https://raw.githubusercontent.com/YunoHost-Apps/mastodon_ynh/master/LICENSE)
[![Yunohost version](https://img.shields.io/badge/yunohost-2.5.6_tested-orange.svg?style=flat)](https://github.com/YunoHost/yunohost)
[![GitHub issues](https://img.shields.io/github/issues/YunoHost-Apps/mastodon_ynh.svg?style=flat)](https://github.com/YunoHost-Apps/mastodon_ynh/issues)

:warning: Cette application ne fonctionne que sur x86, x86_64 et non sur ARM (Raspberry,Olimex,Labriqueinternet,...). T_T

:warning: Cette application utilise les packages backports de Debian, nous vous recommendons de ne pas installer cette application directement en production

:warning: This app work only on x86, x86_64 and not on ARM (Raspberry,Olimex,InternetCube,...). T_T

:warning: This application uses the Debian backports packages, do not install this application directly in production

## Mastodon c'est quoi ?

Mastodon est un réseau social gratuit et open source. Une alternative décentralisée aux plates-formes commerciales, elle évite les risques d'une seule société qui monopolise votre communication. Choisissez un serveur sur lequel vous faites confiance - selon votre choix, vous pouvez interagir avec tous les autres. N'importe qui peut exécuter sa propre instance de Mastodon et participer au réseau social de façon transparente.

[Source code](https://github.com/tootsuite/mastodon)

### Installation

`$ sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh.git`

L'utilisateur admin est crée automatiquement comme: user@domain.tld

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

The admin user is automatically created as: user@domain.tld

### Update

`$ sudo yunohost app upgrade --verbose mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh.git`

## Recommendation

You can't install Mastodon in subdirectory, you must use a domain or subdomain for this application.

It seems important to close the inscriptions for your Mastodon, so that it remains a private body. We invite you to block remote malicious instances from the administration interface. You can also add text on your home page.
