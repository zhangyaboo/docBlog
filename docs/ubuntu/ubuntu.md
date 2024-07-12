

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

## screen

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

## socket代理



## frp内网穿透



