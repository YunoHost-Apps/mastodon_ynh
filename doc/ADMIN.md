## Update

### Using *screen* highly recommended

`$ sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh --debug `

## Administrate with tooctl

`$ (cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl --help)`

## Known Bugs

- Log-out from YunoHost's portal doesn't log out from Mastodon. See https://github.com/YunoHost/issues/issues/501
