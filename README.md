# Mastodon for YunoHost

[![Integration level](https://dash.yunohost.org/integration/mastodon.svg)](https://dash.yunohost.org/appci/app/mastodon)  
[![Install mastodon with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=mastodon)

*[Lire ce readme en fran�ais.](./README_fr.md)*

> *This package allow you to install mastodon quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

:warning: UPDATE 05/06/17 :This app can work now on ARM, but installation takes several hours and you must add a swapfile of 1GB.

:warning: This application uses the Debian backports packages, do not install this application directly in production

## Overview
Mastodon is a free, open-source social network. A decentralized alternative to commercial platforms, it avoids the risks of a single company monopolizing your communication. Pick a server that you trust — whichever you choose, you can interact with everyone else. Anyone can run their own Mastodon instance and participate in the social network seamlessly.

**Shipped version:** 2.7.4

## Screenshots

![](https://framalibre.org/sites/default/files/mastodon.png)

[Source code](https://github.com/tootsuite/mastodon)

## Configuration

### Adding "swapfile" If you have less than 2Go of RAM
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

### Adding cron to free space

Here's a quick tip to free a lot of space on your instance.
Indeed the media (images and videos, attachments) of other instances are cached on your server and are never deleted.
This consumes a lot of space and Mastodon being instantaneous, there is little chance that old media will serve. Thus, we can set up a daily cron that will remove cache external media, more than X days old.

We edit the crontab :
```
crontab -e -u mastodon
```
We add:
```
@daily cd /var/www/mastodon/live && RAILS_ENV=production NUM_DAYS=30 /var/www/mastodon/.rbenv/shims/bundle exec rails
mastodon:media:remove_remote
```

[Source](https://angristan.fr/installer-instance-mastodon-debian-8/#mise_en_place_du_cron)

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

## Documentation

 * Official documentation: https://docs.joinmastodon.org/

## YunoHost specific features

#### Supported architectures

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mastodon%20%28Community%29.svg)](https://ci-apps.yunohost.org/ci/apps/mastodon/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mastodon%20%28Community%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mastodon/)
* Jessie x86-64b - [![Build Status](https://ci-stretch.nohost.me/ci/logs/mastodon%20%28Community%29.svg)](https://ci-stretch.nohost.me/ci/apps/mastodon/)

## Links

 * Report a bug: https://github.com/YunoHost-Apps/mastodon_ynh/issues
 * App website: https://joinmastodon.org/
 * Github App website: https://github.com/tootsuite/mastodon
 * YunoHost website: https://yunohost.org/

---

Developers info
----------------

**Only if you want to use a testing branch for coding, instead of merging directly into master.**
Please do your pull request to the [testing branch](https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
or
sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
```
