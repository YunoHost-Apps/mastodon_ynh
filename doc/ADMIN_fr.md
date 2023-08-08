## Administration avec tooctl

`$ cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl --help`

## Mise à jour

**`screen` (ou `tmux`) peut être utilisé pour vous assurer que votre session n'est pas interrompue en cas de problème de connection.**
Consultez ce [tutoriel](https://www.howtogeek.com/662422/how-to-use-linuxs-screen-command/) pour plus de détails.

```
$ screen
$ sudo yunohost app upgrade mastodon
```

## Sauvegardes

Tout d'abord : Mastodon utilise un cache local pour sauvegarder les médias (comme les images, vidéos, etc). Ce cache peut devenir énorme.
Vous devriez réfléchir à vider votre cache local avant de faire une sauvegarde, qui pourrait être énorme et vous pourriez manquer d'espace de stockage.

Pour vérifier l'utilisation du stockage, en ligne de commande utilisez :

`$ sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media usage`

Si le cache est trop gros pour être sauvegardé, vous pouvez lancer la commande suivante pour en supprimer les médias attachés. Changez `X` par le nombre de cache à conserver, par ex. 1 jour. Tous les médias plus anciens seront supprimés, mais ils pourront être rechargé du serveur d'origine si nécessaire.

En premier faite un essai à blanc pour voir combien de place sera libérée (sans rien supprimer):
`$ sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media remove --days=X --dry-run`

Si cela semble bon, effectuez le nettoyage :
`$ sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media remove --days=X `

## Bugs connus

- Se déconnecter depuis le portail YunoHost ne vous déconnecte pas de Mastodon. Voir https://github.com/YunoHost/issues/issues/501
