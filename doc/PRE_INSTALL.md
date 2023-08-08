## Important points to read before installing

- **Mastodon** require a dedicated **root domain**, eg. `domaine.tld` or `mastodon.domain.tld`, with no other apps installed on that domain. You can't change the domain once installed.
- The user choosen during the installation is automatically created in Mastodon with admin rights
- It seems important to close registrations for your Mastodon, so that it remains a private body. We invite you to block remote malicious instances from the administration interface. You can also add text on your home page.

## Using *screen* in case of disconnect

```
$ sudo apt install screen
$ screen
$ sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh.git
```
Recover after disconnect:
```
$ screen -d
$ screen -r
```
