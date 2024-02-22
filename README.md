<!--
N.B.: This README was automatically generated by https://github.com/YunoHost/apps/tree/master/tools/readme_generator
It shall NOT be edited by hand.
-->

# Mastodon for YunoHost

[![Integration level](https://dash.yunohost.org/integration/mastodon.svg)](https://dash.yunohost.org/appci/app/mastodon) ![Working status](https://ci-apps.yunohost.org/ci/badges/mastodon.status.svg) ![Maintenance status](https://ci-apps.yunohost.org/ci/badges/mastodon.maintain.svg)

[![Install Mastodon with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mastodon)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install Mastodon quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview

Mastodon is a free, open-source microblogging social network. It is a decentralized alternative to commercial platforms like Twitter and avoids the risks of a single company monopolizing your communication for commercial purposes. 

**Shipped version:** 4.2.7~ynh1

**Demo:** https://joinmastodon.org/

## Screenshots

![Screenshot of Mastodon](./doc/screenshots/mastodon.png)

<<<<<<< HEAD
## Disclaimers / important information

## Important points to read before installing

1. **Mastodon** require a dedicated **root domain**, eg. mastodon.domain.tld
1. The user choosen during the installation is automatically created in Mastodon with admin rights
1. At the end of the installation a mail is sent to the user with the automatically generated password
1. It seems important to close the inscriptions for your Mastodon, so that it remains a private body. We invite you to block remote malicious instances from the administration interface. You can also add text on your home page.

## Configuration

### Install

#### Using *screen* in case of disconnect
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

#### Using *screen* highly recommended

`$ sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh --debug `

### Administrate with tootctl

`$ (cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl --help)`

## YunoHost specific features

#### Multi-users support

LDAP authentication is activated. All YunoHost users can authenticate.

Log-out from YunoHost's portal doesn't log out from Mastodon. See https://github.com/YunoHost/issues/issues/501

=======
>>>>>>> 8d58702 (Convert to v2 (#383))
## Documentation and resources

* Official app website: <https://joinmastodon.org/>
* Official admin documentation: <https://docs.joinmastodon.org/>
* Upstream app code repository: <https://github.com/mastodon/mastodon>
* YunoHost Store: <https://apps.yunohost.org/app/mastodon>
* Report a bug: <https://github.com/YunoHost-Apps/mastodon_ynh/issues>

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing).

To try the testing branch, please proceed like that.

``` bash
sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
or
sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>