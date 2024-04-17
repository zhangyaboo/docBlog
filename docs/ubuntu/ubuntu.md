

查询机器架构

```
root@zhang:~# uname --m
x86_64
```

如果回显为 aarch64 ，则表示为ARM架构；如果回显为 x86_64 ，则表示为x86架构。



### 安装webSSH

```
# 下载到服务器
wget 'https://github.com/nirui/sshwifty/releases/download/untagged-c7204ec41cb180a0101d/sshwifty_0.2.11-beta-release_linux_amd64.tar.gz'
# 解压文件
tar -xf sshwifty_0.2.11-beta-release_linux_amd64.tar.gz
```

去球，要https证书