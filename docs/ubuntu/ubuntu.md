

查询机器架构

```
root@zhang:~# uname --m
x86_64
```

如果回显为 aarch64 ，则表示为ARM架构；如果回显为 x86_64 ，则表示为x86架构。



## webSSH

```
# 下载到服务器
wget 'https://github.com/nirui/sshwifty/releases/download/untagged-c7204ec41cb180a0101d/sshwifty_0.2.11-beta-release_linux_amd64.tar.gz'
# 解压文件
tar -xf sshwifty_0.2.11-beta-release_linux_amd64.tar.gz
```

去球，要https证书

## Screen

大部分情况下，我们使用`SSH`终端远程连接服务的时候，在界面启动服务并关闭终端后，程序也会停止运行，部分程序在启动后也会一直占用终端布拉布拉打印日志。而`screen`就可以非常好的解决上述问题，帮助我们在后台运行各项服务和程序。

以Ubuntu安装为例
```shell
## 安装
apt update
apt install screen
```
使用

```shell
# 创建
screen -S name
# 保存离开
# 快捷键：ctrl+A+D
# 查询
screen -ls
# 进入
screen -r name
# 停止推出
screen -X -S name quit
```

## Socket代理

在网络环境中，使用代理服务器可以提升访问速度、增加安全性和隐私性。通过代理服务器，客户端的请求会首先被代理服务器接收并处理，然后再转发到目标服务器。这种方式可以隐藏客户端的真实IP地址，同时提供加密传输以保护数据安全。

本文将详细介绍如何使用Shadowsocks和SwitchyOmega实现浏览器通过代理IP访问的功能，包括服务端和客户端的配置，以及实现原理。

### 服务端配置

#### 1. 安装Shadowsocks服务器

在代理服务器（公网主机）上安装Shadowsocks服务器。以下是基本的安装步骤（以Ubuntu为例）：

1. **更新包列表**：

   ```bash
   sudo apt update
   ```

2. **安装Shadowsocks**：

   ```bash
   sudo apt install shadowsocks-libev
   ```

#### 2. 配置Shadowsocks服务器

1. **编辑配置文件**：

   ```bash
   sudo nano /etc/shadowsocks-libev/config.json
   ```

2. **配置文件内容示例**：

   ```json
   {
       "server": "0.0.0.0",
       "server_port": 8388,
       "local_address": "127.0.0.1",
       "local_port": 1080,
       "password": "your_password",
       "timeout": 300,
       "method": "aes-256-gcm"
   }
   ```

   - `server`：`0.0.0.0`表示监听所有网络接口。
   - `server_port`：Shadowsocks服务器监听的端口（如8388）。
   - `local_address`：本地监听地址。
   - `local_port`：本地监听端口。
   - `password`：用于加密的密码。
   - `timeout`：超时时间。
   - `method`：加密方法。

3. **设置开机自启**：

   ```bash
   sudo systemctl enable shadowsocks-libev
   ```

4. **启动Shadowsocks服务**：

   ```bash
   sudo systemctl start shadowsocks-libev
   ```

5. **确保服务已成功启动**：

   ```bash
   sudo systemctl status shadowsocks-libev
   ```

### 客户端配置

#### 1. 安装Shadowsocks客户端

在本地电脑上安装Shadowsocks客户端。

1. **下载Shadowsocks客户端**（以Windows为例）：
   - 访问Shadowsocks的官方页面，下载并安装Shadowsocks客户端。

2. **配置Shadowsocks客户端**：
   - 打开Shadowsocks客户端，进入配置页面。
   - 输入以下参数：
     - **服务器地址**：如 `203.0.113.1`
     - **服务器端口**：如 `8388`
     - **密码**：如 `your_password`
     - **加密方法**：如 `aes-256-gcm`
   - 保存配置并连接。

#### 2. 配置浏览器代理

1. **安装SwitchyOmega插件**：
   - 在Chrome Web Store搜索并安装SwitchyOmega插件。

2. **配置代理**：
   - 打开SwitchyOmega插件，创建一个新的情景模式。
   - 在代理服务器设置中，输入代理服务器的IP地址和端口号（如127.0.0.1:1080）。
   - 保存设置，并激活该情景模式。

### 实现原理

通过Shadowsocks和SwitchyOmega，可以实现浏览器流量通过代理服务器转发的功能。

- **浏览器 -> 本地代理客户端**：浏览器通过SwitchyOmega插件配置，将所有请求转发到本地Shadowsocks客户端（127.0.0.1:1080）。
- **本地代理客户端 -> 代理服务器**：Shadowsocks客户端将请求加密并发送到远程Shadowsocks服务器（203.0.113.1:8388）。
- **代理服务器 -> 目标网站**：Shadowsocks服务器接收到请求后，解密并转发到目标网站。
- **目标网站 -> 代理服务器 -> 本地代理客户端 -> 浏览器**：目标网站的响应通过相同路径返回到浏览器。

### 总结

通过上述步骤，你可以成功配置Shadowsocks代理服务器和客户端，并使用SwitchyOmega插件在浏览器中实现代理功能。这样的配置能够提升访问速度、增加安全性和隐私性。

#### 优点

- **安全**：通过加密传输保护数据。
- **隐私**：隐藏客户端的真实IP地址。

#### 所需条件

- 一台公网服务器和一台能上网的电脑
- 软件：Shadowsocks、SwitchyOmega、浏览器

#### 步骤总结

1. 在服务器上安装并配置Shadowsocks服务端。
2. 在客户端电脑上安装并配置Shadowsocks客户端。
3. 在浏览器中安装SwitchyOmega插件并配置代理。
4. 测试连接，确保一切工作正常。

通过这些步骤，你可以轻松实现浏览器通过代理服务器访问互联网，从而提升网络安全和隐私性。



## frp内网穿透

要实现内网穿透，可以使用一些常见的内网穿透软件，如：

1. **frp (Fast Reverse Proxy)**：高性能的反向代理应用，可以实现内网服务的穿透。
2. **ngrok**：易于使用的反向代理工具。
3. **ZeroTier**：一个虚拟网络，可以轻松地将设备连接到同一个网络中。

这里以 frp 为例，来讲解如何设置内网穿透：

A为局域网内的主机，B为拥有公网IP的服务器主机

### 安装 frp

1. **下载 frp**

在服务器 B 和主机 A 上都下载 frp：

```bash
# 在服务器 B 上
wget https://github.com/fatedier/frp/releases/download/v0.40.0/frp_0.40.0_linux_amd64.tar.gz
tar -xzf frp_0.40.0_linux_amd64.tar.gz
cd frp_0.40.0_linux_amd64

# 在主机 A 上
wget https://github.com/fatedier/frp/releases/download/v0.40.0/frp_0.40.0_linux_amd64.tar.gz
tar -xzf frp_0.40.0_linux_amd64.tar.gz
cd frp_0.40.0_linux_amd64
```

2. **配置服务器 B（frps.ini）**

在服务器 B 上创建 `frps.ini` 配置文件：

```ini
[common]
bind_port = 7000
```

启动 frp 服务端：

```bash
./frps -c ./frps.ini
```

3. **配置主机 A（frpc.ini）**

在主机 A 上创建 `frpc.ini` 配置文件：

```ini
[common]
server_addr = <服务器B的公网IP>
server_port = 7000

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6000

[mysql]
type = tcp
local_ip = 127.0.0.1
local_port = 3306
remote_port = 6001
```

启动 frp 客户端：

```bash
./frpc -c ./frpc.ini
```

### 使用方式

- 现在可以通过服务器 B 的公网 IP 访问主机 A 的 SSH 服务：

```bash
ssh -p 6000 <用户名>@<服务器B的公网IP>
```

- 也可以通过服务器 B 的公网 IP 访问主机 A 的 MySQL 服务：

```bash
mysql -h <服务器B的公网IP> -P 6001 -u <用户名> -p
```

### 注意事项

- 确保防火墙允许相应的端口（如7000, 6000, 6001）通过。
- 根据需要修改配置文件中的端口和其他参数。

这样，通过 frp，你就可以在公网服务器 B 上访问到局域网主机 A 上的 SSH 和 MySQL 服务了。



## Root账户登陆

在 Ubuntu 中，默认情况下，root 用户是禁用直接登录的。要启用 root 用户登录，可以按照以下步骤操作：

### 1. 设置 root 密码

首先，需要设置 root 用户的密码：

```bash
sudo passwd root
```

系统会提示你输入新的 root 密码，然后确认密码。

### 2. 启用 root 登录

编辑 SSH 配置文件，允许 root 用户通过 SSH 登录：

```bash
sudo nano /etc/ssh/sshd_config
```

找到以下行，并将 `PermitRootLogin` 设置为 `yes`：

```text
#PermitRootLogin prohibit-password
```

修改为：

```text
PermitRootLogin yes
```

保存并退出编辑器。

### 3. 重启 SSH 服务

重启 SSH 服务以应用更改：

```bash
sudo systemctl restart ssh
```

### 4. 登录为 root 用户

现在你可以使用 root 用户通过 SSH 登录到服务器：

```bash
ssh root@<服务器IP>
```

如果是本地登录，可以使用以下命令切换到 root 用户：

```bash
su -
```

然后输入刚刚设置的 root 密码。

### 注意事项

启用 root 用户直接登录会增加安全风险，因此建议在启用 root 登录后，采取以下措施以增强安全性：

1. **使用强密码**：确保 root 密码足够复杂和强大。
2. **限制 SSH 登录**：只允许特定 IP 地址通过 SSH 登录。
3. **使用密钥认证**：替代密码认证，使用 SSH 密钥对来进行身份验证。
4. **启用防火墙**：配置防火墙只允许特定的端口和 IP 地址访问。

以上步骤可以帮助你在 Ubuntu 中启用 root 用户登录，但要谨慎使用并确保服务器的安全。



## 开启自启动

在 Ubuntu 中，可以通过创建 systemd 服务文件来设置开机自启动，以下为配置 frp 在启动时自动运行，并在后台运行为例。以下是详细步骤：

### 配置 frp 服务自启动

1. **创建 frp 服务文件**

首先，在 `/etc/systemd/system/` 目录下创建 frp 服务文件，例如 `frps.service`（针对服务器端）或 `frpc.service`（针对客户端）：

```bash
sudo nano /etc/systemd/system/frps.service
```

添加以下内容：

```ini
[Unit]
Description=FRP Server Service
After=network.target

[Service]
Type=simple
ExecStart=/path/to/frp/frps -c /path/to/frp/frps.ini
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

将 `/path/to/frp/frps` 和 `/path/to/frp/frps.ini` 替换为你的 frp 可执行文件和配置文件的实际路径。

对于 frp 客户端，创建 `frpc.service` 文件并添加以下内容：

```ini
[Unit]
Description=FRP Client Service
After=network.target

[Service]
Type=simple
ExecStart=/path/to/frp/frpc -c /path/to/frp/frpc.ini
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

同样，将 `/path/to/frp/frpc` 和 `/path/to/frp/frpc.ini` 替换为你的 frp 客户端可执行文件和配置文件的实际路径。

2. **重新加载 systemd 配置**

创建服务文件后，重新加载 systemd 配置：

```bash
sudo systemctl daemon-reload
```

3. **启用并启动 frp 服务**

启用 frp 服务，使其在系统启动时自动运行：

```bash
sudo systemctl enable frps.service
sudo systemctl start frps.service
```

对于 frp 客户端：

```bash
sudo systemctl enable frpc.service
sudo systemctl start frpc.service
```

4. **检查服务状态**

可以使用以下命令检查 frp 服务的状态：

```bash
sudo systemctl status frps.service
```

对于 frp 客户端：

```bash
sudo systemctl status frpc.service
```

### Ubuntu 系统设置服务自启动的通用方法

以下是 Ubuntu 中设置任何服务自启动的通用步骤：

1. **创建服务文件**

在 `/etc/systemd/system/` 目录下创建一个 `.service` 文件。例如，`myservice.service`：

```bash
sudo nano /etc/systemd/system/myservice.service
```

添加服务配置内容：

```ini
[Unit]
Description=My Custom Service
After=network.target

[Service]
Type=simple
ExecStart=/path/to/your/executable
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

2. **重新加载 systemd 配置**

创建或修改服务文件后，重新加载 systemd 配置：

```bash
sudo systemctl daemon-reload
```

3. **启用并启动服务**

启用服务，使其在系统启动时自动运行：

```bash
sudo systemctl enable myservice.service
sudo systemctl start myservice.service
```

4. **检查服务状态**

使用以下命令检查服务状态：

```bash
sudo systemctl status myservice.service
```

通过这些步骤，你可以在 Ubuntu 系统中配置 frp 服务或其他自定义服务在启动时自动运行，并在后台运行。
