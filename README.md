# README



```
TEST
```

[如何使用docsify搭建文档类型的网站](https://mp.weixin.qq.com/s/TPXHaTdfTYKrcpm77gPHyA)

[多页文档 (docsify.js.org)](https://docsify.js.org/#/zh-cn/more-pages)

```
# 启动
docsify serve ./
```

项目仓库：
https://git.jetbrains.space/yihong/main/docblog.git



### 图片上传

局域网内上传：

```
C:\Users\106693\Desktop\Files\bat\Upload.bat
```

上传到阿里云上

```
C:\Users\106693\AppData\Local\Programs\Python\Python312\python.exe D:\DE\py\upload\upload.py "D:\DE\py\upload\config.json"
```



好的



### 依赖注入

```
package org.example.springbootregister;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SpringbootRegisterApplication {

    public static void main(String[] args) {
       ApplicationContext context = SpringApplication.run(SpringbootRegisterApplication.class, args);
        Object bean = context.getBean("country");
        System.out.println(bean);
    }

    /*
    将依赖中的Bean对象注册到IOC容器中
     */
    @Bean
    public Country country(){
        return new Country();
    }

}

```

