## Administrate with tooctl

`$ (cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl --help)`

## Update

**`screen` (or `tmux`) can be used to make sure your session is not interrupted in case of connection problems.**
See [tutorial](https://www.howtogeek.com/662422/how-to-use-linuxs-screen-command/) for more background information.

```bash
screen
sudo yunohost app upgrade mastodon
```

## Backups

First of all: Mastodon uses a local cache to save media (such as posted images, videos etc.). This cache can grow huge.
You could consider cleaning up your local cache first as otherwise your backup will be very big and you might run out of disk space:

To check your space usage, on a command line run:

```bash
sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media usage
```

If your cache is too big to backup, you can run the following command to clean up Attachments (the first line). Substitute X by the number of days you want to keep, e.g. 1 day. All older images will be deleted but will be refetched from the original server if necessary.

First dry-run to see how much space is freed up (without actually removing):

```bash
sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media remove --days=X --dry-run`
```

If all looks good commit the cleanup:

```bash
sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media remove --days=X`
```

Check [the official documentation](https://docs.joinmastodon.org/admin/tootctl/#media-remove) for more details.

## Before your Mastodon instance deletion

Before definitively uninstalling Mastodon, you have to run `tootctl self-destruct` to broadcast your users and instance deletion to the federation.  
Otherwise your data will remain in federation cache for ever.

⚠️ Make sure you know exactly what you are doing before running this command.
⚠️ This operation is NOT reversible, and it can take a long time.
⚠️ The server will be in a BROKEN STATE after this command finishes.
⚠️ A running Sidekiq process is required, so do not shut down the server until the queues are fully cleared.

```bash
screen
sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl self-destruct
```

Check [the official documentation](https://docs.joinmastodon.org/admin/tootctl/#self-destruct) for more details.

## Known Bugs

- Log-out from YunoHost's portal doesn't log out from Mastodon. See <https://github.com/YunoHost/issues/issues/501>
