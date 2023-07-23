## Administrate with tooctl

`$ (cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl --help)`

## Update

**`screen` (or `tmux`) can be used to make sure your session is not interrupted in case of connection problems.**
See [tutorial](https://www.howtogeek.com/662422/how-to-use-linuxs-screen-command/) for more background information.

```
$ screen
$ sudo yunohost app upgrade mastodon
```

## Backups

First of all: Mastodon uses a local cache to save media (such as posted images, videos etc.). This cache can grow huge. 
You could consider cleaning up your local cache first as otherwise your backup will be very big and you might run out of disk space:

To check your space usage, on a command line run:

`$ sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media usage`

If your cache is too big to backup, you can run the following command to clean up Attachments (the first line). Substitute X by the number of days you want to keep, e.g. 1 day. All older images will be deleted but will be refetched from the original server if necessary.

First dry-run to see how much space is freed up (without actually removing):

`$ sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media remove --days=X --dry-run`

If all looks good commit the cleanup:

`$ sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media remove --days=X `

## Known Bugs

- Log-out from YunoHost's portal doesn't log out from Mastodon. See https://github.com/YunoHost/issues/issues/501
