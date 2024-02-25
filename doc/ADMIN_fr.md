## Administration avec tooctl

`$ cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl --help`

## Mise à jour

**`screen` (ou `tmux`) peut être utilisé pour vous assurer que votre session n'est pas interrompue en cas de problème de connection.**  
Consultez ce [tutoriel](https://www.howtogeek.com/662422/how-to-use-linuxs-screen-command/) pour plus de détails.

```bash
screen
sudo yunohost app upgrade mastodon
```

Récupérer la session screen après une déconnexion :

```bash
screen -d
screen -r
```

## Sauvegardes

Tout d'abord : Mastodon utilise un cache local pour sauvegarder les médias (comme les images, vidéos, etc). Ce cache peut devenir énorme.  
Vous devriez réfléchir à vider votre cache local avant de faire une sauvegarde, qui pourrait être énorme et vous pourriez manquer d'espace de stockage.

Pour vérifier l'utilisation du stockage, en ligne de commande utilisez :

```bash
sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media usage
```

Si le cache est trop gros pour être sauvegardé, vous pouvez lancer la commande suivante pour en supprimer les médias attachés.  
Changez `X` par le nombre de cache à conserver, par ex. 1 jour.  
Tous les médias plus anciens seront supprimés, mais ils pourront être rechargé du serveur d'origine si nécessaire.

En premier faite un essai à blanc pour voir combien de place sera libérée (sans rien supprimer):

```bash
sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media remove --days=X --dry-run`
```

Si cela semble bon, effectuez le nettoyage :

```bash
sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl media remove --days=X
```

Consulter [la documentation officielle](https://docs.joinmastodon.org/admin/tootctl/#media-remove) pour plus de détails.

## Avant la suppression de votre instance Mastodon

Avant de désinstaller définitivement Mastodon, vous devez lancer `tootctl self-destruct` pour annoncer à la fédération la suppression de vos utilisateurs et de votre instance.  
Sinon, vos données resteront dans le cache de la fédération pour toujours.

⚠️ Assurez-vous de savoir exactement ce que vous faites avant d'exécuter cette commande.  
⚠️ **Cette opération n'est PAS réversible et peut prendre beaucoup de temps.**  
⚠️ Le serveur sera dans un ÉTAT BRISÉ après la fin de cette commande.  
⚠️Un processus Sidekiq en cours d'exécution est nécessaire, **donc ne stoppez pas le serveur avant que les files d'attente ne soient complètement vidées**.

```bash
screen
sudo cd /var/www/mastodon/live && sudo -u mastodon RAILS_ENV=production PATH=/opt/rbenv/versions/mastodon/bin bin/tootctl self-destruct --dry-run
```

Retirez la partie `--dry-run` uniquement lorsque vous avez la certitude que que vous voulez vraiment supprimer votre instance Mastodon.

Consulter [la documentation officielle](https://docs.joinmastodon.org/admin/tootctl/#self-destruct) pour plus de détails.

## Bugs connus

- Se déconnecter depuis le portail YunoHost ne vous déconnecte pas de Mastodon. Voir <https://github.com/YunoHost/issues/issues/501>
