# TODO 待整理内容

分享Java相关技术
TEST crontrab -e是否更新
reboot->vim->Ok
TEST IN JOB 14:32:15
git user idea


[如何使用docsify搭建文档类型的网站](https://mp.weixin.qq.com/s/TPXHaTdfTYKrcpm77gPHyA)

[多页文档 (docsify.js.org)](https://docsify.js.org/#/zh-cn/more-pages)

项目仓库：
https://git.jetbrains.space/yihong/main/docblog.git




域名

git仓库


```
https://git.jetbrains.space/yihong/main/docblog.git
```



## springboot

![image-20240509232738269](https://img-for-bucket.oss-cn-shanghai.aliyuncs.com/20240509232741.png)

传统方式构建spring应用程序，

![image-20240509232835791](D:\Projects\jetbrains\docblog\README.assets\image-20240509232835791.png)

导入项目繁琐

使用springboot:

依靠**起步依赖**，利用maven依赖传递性

**自动配置**

内置Tomcat,Jetty，无需WAR

外部化配置：将配置文件放入项目外，更新直接重新启动即可

不需要xml，改为更加方便的yml



### 2.使用SpringBoot3创建一个web项目

![image-20240509233714739](D:\Projects\jetbrains\docblog\README.assets\image-20240509233714739.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.5</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>org.example</groupId>
    <artifactId>spring-demo</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>spring-demo</name>
    <description>spring-demo</description>
    <properties>
        <java.version>17</java.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

```

```
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.5</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
```

项目依赖版本均和父亲依赖相关



启动类

```
@SpringBootApplication
@MapperScan("org.example.springdemo.mapper")
public class SpringDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringDemoApplication.class, args);
    }

}
```

注解

```
@RestController
@RequestMapping("test")
public class DemoTest {
    @GetMapping("/hello")
    public String helloTest(){
        return "hello,spring!!";
    }

```

