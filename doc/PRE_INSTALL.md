## Important points to read before installing

- **Mastodon** require a dedicated **root domain**, eg. `domain.tld` or `mastodon.domain.tld`, with no other apps installed on that domain. Due to the federation, **you will not be able to change the domain once installed.**
- The user chosen during the installation is automatically created in Mastodon with admin rights
- To ensure that your Mastodon instance remains private and that the community is secure, it is important that registrations are closed and verified. We invite you to block remote malicious instances from the administration interface. You can also add text on your home page using the administration interface.

## Using *screen* in case of disconnect

Mastodon can take a long time to install, depending on server performance.  
To avoid the process being interrupted by a disconnection, you can use `screen`.

```bash
sudo apt install screen
screen
sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh.git
```

Recover the screen session after disconnect:

```bash
screen -d
screen -r
```
