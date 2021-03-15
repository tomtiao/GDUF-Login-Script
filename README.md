# 脚本登录 GDUF

[English](README-en.md)

**需要解决的问题超出了做脚本的初衷**

**已存档**

**可搭配 TamperMonkey 插件[自动登录 GDUF](https://gist.github.com/tomtiao/9a44ac8090ba3e745987675ac5ccf888)**

等待登录页面弹出至少需要 5 秒钟，手动输入非 https 网址跳转到登录页面可以加快到 2 秒，右键运行脚本只需要 1 秒。

## 特点

- 无需打开浏览器登录校园网

## 系统需求

### Windows

仅在 PowerShell 5.1 上测试过 PowerShell 脚本，Windows 10 1607 及更新版本预装 PowerShell 5.1，其他版本的 Windows 可能需要安装 [Windows Management Framework 5.1](https://aka.ms/wmf5download)。

**不要**在 Windows 中使用 Shell 脚本。

### 类 Unix（包括 macOS 及某些路由器）

仅在 Ubuntu、Padavan 和 macOS 中使用 Bash 测试过 Shell 脚本。

- Linux 脚本可能需要根据 ifconfig 返回的内容手动修改，处于不改基本没法用的状态。

- macOS 应该可以正常运行。

- 在路由器上搭配固件自动运行脚本可实现自动登录，并在断网时自动重连。

## 如何使用

### Windows 环境

1. 下载脚本

2. 使用你喜欢的编辑器打开脚本

3. 根据注释修改网卡名称、用户名及密码

4. 保存后右键脚本单击“使用 PowerShell 运行"

### 类 Unix 环境

- Linux

  - 自行测试。

- macOS

  1. 下载脚本

  2. 使用你喜欢的编辑器打开脚本

  3. 根据注释修改网卡名称、用户名及密码

  4. 保存后在终端中输入 ```chmod +x <脚本路径>``` 使之可以运行

  5. 输入 ```<脚本路径>``` 运行脚本

- Padavan 固件的路由器

  1. 开启 SSH 服务器（如果没有）

  2. 通过 SSH 连接到路由器

  3. 上传或将脚本复制粘贴以传输到路由器

  4. 在 SSH 中输入 ```chmod +x <脚本路径>``` 使之可以运行

  5. 在 SSH 中输入 ```<脚本路径>``` 运行脚本

  6. （可选）如果需要路由器开机后自动登录，将脚本放入固件开机运行项目中

  7. （可选）如果需要断线自动重连，可以搭配使用固件的 Crontab 守护服务启用脚本。

      - 每五分钟调用一次脚本：```*/5 * * * * <脚本路径>```

      - 有关 Crontab 的语法可以使用[这个交互式环境](https://crontab.guru/)学习

- 其他固件

  - 自行测试。

## 遇到问题怎么办

- 使用上的问题可以通过 GitHub 的 [Discussions](https://github.com/tomtiao/GDUF-Login-Script/discussions) 功能询问。

- 如果你发现脚本有问题，或想要改进脚本，可以通过 [Issues](https://github.com/tomtiao/GDUF-Login-Script/issues) 创建一个 Issue。
