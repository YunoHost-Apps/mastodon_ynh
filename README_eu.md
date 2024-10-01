<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Mastodon YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/mastodon.svg)](https://ci-apps.yunohost.org/ci/apps/mastodon/) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/mastodon.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/mastodon.maintain.svg)

[![Instalatu Mastodon YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mastodon)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Mastodon YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

Mastodon is a free, open-source microblogging social network.  
It is a decentralized alternative to commercial platforms like Twitter and avoids the risks of a single company monopolizing your communication for commercial purposes.


**Paketatutako bertsioa:** 4.2.13~ynh1

**Demoa:** <https://joinmastodon.org/>

## Pantaila-argazkiak

![Mastodon(r)en pantaila-argazkia](./doc/screenshots/mastodon.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://joinmastodon.org/>
- Administratzaileen dokumentazio ofiziala: <https://docs.joinmastodon.org/>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/mastodon/mastodon>
- YunoHost Denda: <https://apps.yunohost.org/app/mastodon>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/mastodon_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
edo
sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
