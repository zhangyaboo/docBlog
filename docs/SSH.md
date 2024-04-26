操作系统

docker



安装

```
docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean
```

nginx

```shell
apt-get install build-essential
apt-get install libtool
```



docker进入容器

[Docker容器进入的4种方式 - 純黑色 - 博客园 (cnblogs.com)](https://www.cnblogs.com/xhyan/p/6593075.html)



```
9059b2ed2b1a42e78f4dce284142a0ab

```





```
https://www.cnblogs.com/ningy1009/p/12665716.html
```



安装git

```

```

[在Ubuntu 18.04上安装Git - 牛奔 - 博客园 (cnblogs.com)](https://www.cnblogs.com/niuben/p/11512992.html)

```
 git config --global user.name "zhangyabo"
 git config --global user.email "zhangyabo20@gmail.com"
 git config --list
```



nodejs

[如何在 Ubuntu 20.04 上安装 Node.js 和 npm-阿里云开发者社区 (aliyun.com)](https://developer.aliyun.com/article/760687)



使用docker安装Jenkins版本无法进行更新，导致后续插件无法安装，因此还是通过使用最原始的安装方式

### Docker

```
docker ps -a

docker stop

docker images
docker rmi imagesId 
```

[勿忘初心，进无止尽！ (cnblogs.com)](https://www.cnblogs.com/Soy-technology/p/12214485.html)

配置SSH

```
Could not bind TCP port 80 because it is already in use by another process on
this system (such as a web server). Please stop the program in question and then
try again.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(R)etry/(C)ancel: R

Successfully received certificate.
Certificate is saved at: /etc/letsencrypt/live/yabozhang.top/fullchain.pem
Key is saved at:         /etc/letsencrypt/live/yabozhang.top/privkey.pem
This certificate expires on 2024-07-17.
These files will be updated when the certificate renews.
Certbot has set up a scheduled task to automatically renew this certificate in the background.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
If you like Certbot, please consider supporting our work by:
 * Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
 * Donating to EFF:                    https://eff.org/donate-le
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
root@ecsa2xY:~# 

```

 ### Nginx

```
#检查配置文件状态，同时可以定位配置文件
nginx -t
nginx -s reload
```

![image-20240418231238867](https://img-for-bucket.oss-cn-shanghai.aliyuncs.com/20240421004042.png)