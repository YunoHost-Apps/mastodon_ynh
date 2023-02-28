<!--
N.B.: This README was automatically generated by https://github.com/YunoHost/apps/tree/master/tools/README-generator
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

**Shipped version:** 4.0.2~ynh2

**Demo:** https://joinmastodon.org/

## Screenshots

![Screenshot of Mastodon](./doc/screenshots/mastodon.png)

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

#### Using separate domains for Serving and Identity

It is possible to use one domain for serving (like social.example.com) and another for the user identities (like @user@example.com).
In this installation simple set the Local Domain field with the relevant domain.
If the Identity domain is locally managed and properly entered, appropriate redirects will be set up, otherwise you will need to set them up manually.

Example of setting up the required redirect in nginx:
```
{
  server example.com;
  # Other example.com settings...
  ### This is the relevant part:
  location ~ ^/.well-known/(host-meta|nodeinfo|webfinger)/ {
    return 301 https://__DOMAIN__$request_uri;
  }
  ### Until here is the relevant part
}
```

### Update

#### Using *screen* highly recommended

`$ sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh --debug `

### Administrate with tooctl

`$ (cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl --help)`

## YunoHost specific features

#### Multi-users support

LDAP authentication is activated. All YunoHost users can authenticate.

Log-out from YunoHost's portal doesn't log out from Mastodon. See https://github.com/YunoHost/issues/issues/501

## Documentation and resources

* Official app website: <https://joinmastodon.org/>
* Official admin documentation: <https://docs.joinmastodon.org/>
* Upstream app code repository: <https://github.com/mastodon/mastodon>
* YunoHost documentation for this app: <https://yunohost.org/app_mastodon>
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
