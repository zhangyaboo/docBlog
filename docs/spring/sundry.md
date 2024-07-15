在Spring框架中，依赖注入（Dependency Injection, DI）是一个核心概念，它使得对象可以将其依赖关系（例如其他对象）动态地传递给它们，而不是在代码中硬编码这些依赖关系。你提到的两种注入方式分别是字段注入和构造函数注入。以下是这两种注入方式的区别和特点：

### 字段注入

```java
@Autowired
DataDemoMapper dataDemoMapper;
```

**特点**：

1. **简洁**：字段注入的代码量少，只需在字段上添加 `@Autowired` 注解。
2. **方便**：不需要编写构造函数，适合需要注入很多依赖的类。
3. **可读性**：字段注入的位置比较明显，一眼就能看出哪些字段是注入的。

**缺点**：

1. **测试难度**：由于没有公开的构造函数，在单元测试时比较难模拟和注入依赖。
2. **不可变性**：字段注入允许对象在生命周期的任意时刻改变依赖关系，容易导致依赖关系的管理混乱。
3. **不推荐使用**：Spring官方和大多数开发者社区更推荐构造函数注入，因为它更符合SOLID原则中的单一职责原则（SRP）和依赖倒置原则（DIP）。

### 构造函数注入

```java
final DataDemoMapper dataDemoMapper;

public HelloController(DataDemoMapper dataDemoMapper) {
    this.dataDemoMapper = dataDemoMapper;
}
```

**特点**：

1. **明确的依赖**：通过构造函数注入，类的依赖关系在创建时就被明确声明出来，增强了代码的可读性和可维护性。
2. **可测试性**：构造函数注入使得类更容易进行单元测试，因为依赖关系可以在构造函数参数中传递。
3. **不可变性**：使用 `final` 关键字确保依赖关系在对象创建后不再改变，提高了代码的安全性和稳定性。
4. **符合设计原则**：符合SOLID原则中的单一职责原则和依赖倒置原则，更加面向对象设计。

**缺点**：

1. **代码量增加**：需要编写构造函数，代码量稍微增加。
2. **需要更多的配置**：如果类有很多依赖，需要在构造函数中逐一列出，显得繁琐。

### 总结

- **字段注入**适合简单的依赖关系和快速开发，但不利于测试和维护。
- **构造函数注入**更加符合面向对象设计原则，适合复杂系统的开发，具有更好的可测试性和代码可维护性。

Spring官方和大多数开发者社区更推荐使用构造函数注入，因为它的优势在大型项目中更为明显。



## springboot

为什么要用springboot快速构建项目

传统方式构建spring应用程序，导入项目繁琐

使用springboot:

特点：

```
依靠**起步依赖**，利用maven依赖传递性

**自动配置**

内置Tomcat,Jetty，无需WAR

外部化配置：将配置文件放入项目外，更新直接重新启动即可

不需要xml，改为更加方便的yml
```



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



### 手动创建SpringBoot

123

创建maven依赖，引入启依赖坐标，引入web依赖（版本号有依赖坐标

```
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.5</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
```

修改启动类

```
@SpringBootApplication
public class SpringDemoApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringDemoApplication.class, args);
    }
}
```

创建资源文件夹以及启动配置文件

![image-20240509235226664](D:\Projects\jetbrains\docblog\README.assets\image-20240509235226664.png)

配置文件

官方文档

[Common Application Properties (spring.io)](https://docs.spring.io/spring-boot/docs/current/reference/html/application-properties.html#appendix.application-properties)



不同配置文件类型

properties

yml yaml:更有层级



> 虚拟目录是什么？

![image-20240509235655704](D:\Projects\jetbrains\docblog\README.assets\image-20240509235655704.png)



yml配置信息书写与获取

整合第三方技术 

配置文件



整合Mybatis

![image-20240510210150651](https://img-for-bucket.oss-cn-shanghai.aliyuncs.com/20240510210152.png)

![image-20240510210213709](https://img-for-bucket.oss-cn-shanghai.aliyuncs.com/20240510210216.png)







![image-20240510223955157](D:\Projects\jetbrains\docblog\README.assets\image-20240510223955157.png)

> - `mysqld --standalone` 在后台启动；
> - `mysqld --console`在控制台窗口启动





maven项目的结构要熟悉

![image-20240510235510033](https://img-for-bucket.oss-cn-shanghai.aliyuncs.com/20240510235513.png)

![image-20240510235641680](https://img-for-bucket.oss-cn-shanghai.aliyuncs.com/20240510235647.png)

Q：maven项目报Test出出错

Q：springboot整合mybatis依赖启动报错





![image-20240512204500555](https://img-for-bucket.oss-cn-shanghai.aliyuncs.com/20240512204503.png)

默认扫描启动类下同级目录所有包，

![image-20240512211848243](D:\Projects\jetbrains\docblog\README.assets\image-20240512211848243.png)



### Bean注解



原spring注解

![image-20240512212012383](D:\Projects\jetbrains\docblog\README.assets\image-20240512212012383.png)

第三方jar包无法直接添加注解

@Bean

@Import

![image-20240512212205398](D:\Projects\jetbrains\docblog\README.assets\image-20240512212205398.png)

![image-20240512212322345](D:\Projects\jetbrains\docblog\README.assets\image-20240512212322345.png)

将jar包安装的maven仓库，引入web依赖会启动Tomcat

![image-20240512212533215](D:\Projects\jetbrains\docblog\README.assets\image-20240512212533215.png)





![image-20240512212625879](D:\Projects\jetbrains\docblog\README.assets\image-20240512212625879.png)

![image-20240512212822162](D:\Projects\jetbrains\docblog\README.assets\image-20240512212822162.png)

![image-20240512212832262](D:\Projects\jetbrains\docblog\README.assets\image-20240512212832262.png)

![image-20240512213416050](D:\Projects\jetbrains\docblog\README.assets\image-20240512213416050.png)

#### 注册对象需要其他Bean

?

> TODO spring 

#### Import

当不在启动类目录下

![image-20240512214757206](D:\Projects\jetbrains\docblog\README.assets\image-20240512214757206.png)

![image-20240512214921987](D:\Projects\jetbrains\docblog\README.assets\image-20240512214921987.png)

![image-20240512215000579](D:\Projects\jetbrains\docblog\README.assets\image-20240512215000579.png)

Import({xxx})

##### 接口

![image-20240512215147463](D:\Projects\jetbrains\docblog\README.assets\image-20240512215147463.png)

![image-20240512215245536](D:\Projects\jetbrains\docblog\README.assets\image-20240512215245536.png)



![image-20240512215548961](D:\Projects\jetbrains\docblog\README.assets\image-20240512215548961.png)



![image-20240512215804608](D:\Projects\jetbrains\docblog\README.assets\image-20240512215804608.png)



![image-20240512215856039](D:\Projects\jetbrains\docblog\README.assets\image-20240512215856039.png)

![image-20240512215820541](D:\Projects\jetbrains\docblog\README.assets\image-20240512215820541.png)



希望有配置文件的时候进行注入，没有的时候不进行注入

``` 
@Value("${name1.name2}")//获取配置文件中的值
```

![image-20240512222957446](D:\Projects\jetbrains\docblog\README.assets\image-20240512222957446.png)

DispatcherServlet和web启动依赖是否存在有关

![image-20240512223615879](D:\Projects\jetbrains\docblog\README.assets\image-20240512223615879.png)



- Bean扫描

- Bean注册

- 注册条件