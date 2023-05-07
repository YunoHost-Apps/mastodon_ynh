## Important points to read before installing

1. **Mastodon** require a dedicated **root domain**, eg. mastodon.domain.tld
1. The user choosen during the installation is automatically created in Mastodon with admin rights
1. At the end of the installation a mail is sent to the user with the automatically generated password
1. It seems important to close the inscriptions for your Mastodon, so that it remains a private body. We invite you to block remote malicious instances from the administration interface. You can also add text on your home page.

## Configuration

### Install

#### Using *screen* in case of disconnect

`screen` (or `tmux`) can be used to make sure your session is not interrupted in case of connection problems. 
See [tutorial](https://www.howtogeek.com/662422/how-to-use-linuxs-screen-command/) for more background information.
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

**Please use `screen` as the upgrade process can take a long time!**

#### A note about backups

First of all: Mastodon uses a local cache to save media (such as posted images, videos etc.). This cache can grow huge. 
You could consider cleaning up your local cache first as otherwise your backup will be very big and you might run out of disk space:

To check your space usage, on a command line run:

`$ sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media usage`

If your cache is too big to backup, you can run the following command to clean up Attachments (the first line). Substitute X by the number of days you want to keep, e.g. 1 day. All older images will be deleted but will be refetched from the original server if necessary.

First dry-run to see how much space is freed up (without actually removing):

`$ sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media remove --days=X --dry-run`

If all looks good commit the cleanup:

`$ sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media remove --days=X `

#### Upgrade

The actual upgrade can be done using the following command:

`$ sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh --debug `

Upgrading from 3.5.3 to 4.1.2 directly has not been integration-tested. It is recommended to do a two-step upgrade:

First upgrade to 4.0.2~ynh2:

`$ sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh/tree/94381183ca2d14da72234b53c9a83972ffb16e54 --debug `

Check your installation. If all looks well, upgrade to 4.1.2~ynh1:

`$ sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh --debug `

### Administrate with tooctl

`$ (cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl --help)`

## YunoHost specific features

#### Multi-users support

LDAP authentication is activated. All YunoHost users can authenticate.

Log-out from YunoHost's portal doesn't log out from Mastodon. See https://github.com/YunoHost/issues/issues/501
