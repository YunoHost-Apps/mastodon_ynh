<!--
注意：此 README 由 <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> 自动生成
请勿手动编辑。
-->

# YunoHost 上的 Mastodon

[![集成程度](https://dash.yunohost.org/integration/mastodon.svg)](https://ci-apps.yunohost.org/ci/apps/mastodon/) ![工作状态](https://ci-apps.yunohost.org/ci/badges/mastodon.status.svg) ![维护状态](https://ci-apps.yunohost.org/ci/badges/mastodon.maintain.svg)

[![使用 YunoHost 安装 Mastodon](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mastodon)

*[阅读此 README 的其它语言版本。](./ALL_README.md)*

> *通过此软件包，您可以在 YunoHost 服务器上快速、简单地安装 Mastodon。*  
> *如果您还没有 YunoHost，请参阅[指南](https://yunohost.org/install)了解如何安装它。*

## 概况

Mastodon is a free, open-source microblogging social network.  
It is a decentralized alternative to commercial platforms like Twitter and avoids the risks of a single company monopolizing your communication for commercial purposes.


**分发版本：** 4.3.1~ynh1

**演示：** <https://joinmastodon.org/>

## 截图

![Mastodon 的截图](./doc/screenshots/mastodon.png)

## 文档与资源

- 官方应用网站： <https://joinmastodon.org/>
- 官方管理文档： <https://docs.joinmastodon.org/>
- 上游应用代码库： <https://github.com/mastodon/mastodon>
- YunoHost 商店： <https://apps.yunohost.org/app/mastodon>
- 报告 bug： <https://github.com/YunoHost-Apps/mastodon_ynh/issues>

## 开发者信息

请向 [`testing` 分支](https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing) 发送拉取请求。

如要尝试 `testing` 分支，请这样操作：

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
或
sudo yunohost app upgrade mastodon -u https://github.com/YunoHost-Apps/mastodon_ynh/tree/testing --debug
```

**有关应用打包的更多信息：** <https://yunohost.org/packaging_apps>
