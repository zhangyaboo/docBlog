

## Docker



开机自启

```
systemctl enable docker
```



运行docker镜像

```
docker run -it --name wordpress -p 9999:80 -v /usr/local/share/wordpress:/var/www/html -d wordpress
```



```
docker run -d --restart=always --name 设置容器名 使用的镜像
（上面命令  --name后面两个参数根据实际情况自行修改）
 
# Docker 容器的重启策略如下：
 --restart具体参数值详细信息：
       no　　　　　　　 // 默认策略,容器退出时不重启容器；
       on-failure　　  // 在容器非正常退出时（退出状态非0）才重新启动容器；
       on-failure:3    // 在容器非正常退出时重启容器，最多重启3次；
       always　　　　  // 无论退出状态是如何，都重启容器；
       unless-stopped  // 在容器退出时总是重启容器，但是不考虑在 Docker 守护进程启动时就已经停止了的容器。
```

```
docker run -it --name wordpress -p 9999:80 -v /usr/local/share/wordpress:/var/www/html -d --restart=always wordpress 
```



```
docker update --restart=always 容器ID(或者容器名)
（容器ID或者容器名根据实际情况修改）
```

```
docker update --restart=always wordpress
（容器ID或者容器名根据实际情况修改）
```









### Q1:安装的时候数据库无法连接

```
?
在使用wordpress连接数据库的时候，为什么使用172.17.0.4，而不是localhost
172.17.0.4 mysql使用dockerjin
```



### Q2:安装后登录显示错误

![img](https://i-blog.csdnimg.cn/blog_migrate/f7b54bf3ab64409a28a7203116a2c5ef.png)



### 

![image-20240928211338432](http://img-for-bucket.oss-cn-shanghai.aliyuncs.com/20240928211341490.png)