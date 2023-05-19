## Mise à jour

### Utilisation de *screen* fortement recommandée

`$ sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh --debug `

## Administration avec tooctl

`$ (cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl --help)`

## Bugs connus

- Se déconnecter depuis le portail YunoHost ne vous déconnecte pas de Mastodon. Voir https://github.com/YunoHost/issues/issues/501
