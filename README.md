# Mastodon for YunoHost

[![Integration level](https://dash.yunohost.org/integration/mastodon.svg)](https://dash.yunohost.org/appci/app/mastodon)  
[![Install Mastodon with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=mastodon)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allow you to install Mastodon quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview
Mastodon is a free, open-source social network. A decentralized alternative to commercial platforms, it avoids the risks of a single company monopolizing your communication. Pick a server that you trust â€” whichever you choose, you can interact with everyone else. Anyone can run their own Mastodon instance and participate in the social network seamlessly.

**Shipped version:** 3.1.0

## Important points to read before installing

1. **Mastodon** require a dedicated **root domain**, eg. mastodon.domain.tld
1. The user choosen during the installation is automatically created in Mastodon with admin rights
1. At the end of the installation a mail is sent to the user with the automatically generated password
1. It seems important to close the inscriptions for your Mastodon, so that it remains a private body. We invite you to block remote malicious instances from the administration interface. You can also add text on your home page.

## Screenshots

![](https://framalibre.org/sites/default/files/mastodon.png)

[Source code](https://github.com/tootsuite/mastodon)

## Configuration

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
### Update

#### Using __screen__ highly recommended

`$ sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh --debug `

## Documentation

 * Official documentation: https://docs.joinmastodon.org/

## YunoHost specific features

#### Supported architectures

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mastodon%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/mastodon/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mastodon%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mastodon/)
* Jessie x86-64b - [![Build Status](https://ci-stretch.nohost.me/ci/logs/mastodon%20%28Apps%29.svg)](https://ci-stretch.nohost.me/ci/apps/mastodon/)

## Links

 * Report a bug: https://github.com/YunoHost-Apps/mastodon_ynh/issues
 * App website: https://joinmastodon.org/
 * Upstream app repository: https://github.com/tootsuite/mastodon
 * YunoHost website: https://yunohost.org/

---

Developers info
----------------

Please do your pull request to the [testing branch](https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
or
sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
```
