# 使用python实现Typora图片上传功能

## 实现效果



## Typora自定义命令

使用自定命令上传的时候需要了解`Typora`上传命令的输入和输出格式，如下：

 <img src="http://img-for-bucket.oss-cn-shanghai.aliyuncs.com/202406192323090.png" alt="image-20240619231658092" style="zoom:67%;" />

命令，是的没错，双斜杠，读取路径的时候

```shell
your order "C:\\Users\\106693\\AppData\\Local\\Temp\\Typora\\typora-icon2.png" "C:\\Users\\106693\\AppData\\Local\\Temp\\Typora\\typora-icon.png"
```

返回格式，注意有个`Upload Success:`

```shell
Upload Success:
http://172.30.6.120:8090/server/index.php?s=/api/attachment/visitFile&sign=99b479a9ec2ebfa6a1faba71611ca83d
http://172.30.6.120:8090/server/index.php?s=/api/attachment/visitFile&sign=f20cb1333e76593ed1cd120b2ee2f55b
```



## python脚本命令

需要用到`oss2`，安装命令如下：

```shell
pip install oss2
```

python脚本命令如下:

```python
# -*- coding: utf-8 -*-

import sys
import json
import oss2
import time
import os

def load_config():
    with open('config.json', 'r', encoding='utf-8') as file:
        return json.load(file)

def generate_unique_filename(original_filename):
    # 获取文件后缀
    ext = os.path.splitext(original_filename)[1]
    # 获取当前时间，并格式化为唯一的文件名
    unique_name = time.strftime("%Y%m%d%H%M%S", time.localtime()) + str(int(time.time() * 1000) % 1000) + ext
    return unique_name

def upload_to_oss(file_paths, config):
    access_key_id = config['access_key_id']
    access_key_secret = config['access_key_secret']
    endpoint = config['endpoint']
    bucket_name = config['bucket_name']

    auth = oss2.Auth(access_key_id, access_key_secret)
    bucket = oss2.Bucket(auth, endpoint, bucket_name)
    
    urls = []

    for file_path in file_paths:
        file_path = file_path.replace("\\", "/")
        object_name = generate_unique_filename(file_path)

        # 上传文件
        bucket.put_object_from_file(object_name, file_path)
        
        # 生成文件的URL
        url = 'http://{}.{}/{}'.format(bucket_name, endpoint, object_name)
        urls.append(url)
    
    return urls

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python upload.py <file_path1> <file_path2> ...")
        sys.exit(1)
    
    file_paths = sys.argv[1:]
    config = load_config()
    urls = upload_to_oss(file_paths, config)
    
    print("Upload Success:")
    for url in urls:
        print(url)

```

JSON配置文件如下，在py文件相同目录下：

```JSON
{
    "access_key_id": "your-access-key-id",
    "access_key_secret": "your-access-key-secret",
    "endpoint": "oss-cn-hangzhou.aliyuncs.com",
    "bucket_name": "your-bucket-name"
}
```

命令如下：

```
cd D:\Projects\python && python upload.py "C:\\Users\\Yabo\\AppData\\Local\\Temp\\Typora\\typora-icon2.png"
```

![image-20240619232607040](C:\Users\Yabo\Desktop\test图床.assets\image-20240619232607040.png)

测试正常，没有问题，但是放在Typora中就不行了



```
 python D:\Projects\python\upload.py
```



![image-20240619235251445](C:\Users\Yabo\Desktop\test图床.assets\image-20240619235251445.png)

看了下报错信息，大概是没有找到文件。

好家伙，路径都没切换，能找到见鬼了；

试了几次，貌似都不太行，估计是不能切换路径；

那把配置文件分离出来有什么用啊？？？？

G，直接把配置文件路径输入进去吧；

```
 python D:\Projects\python\upload.py "D:\Projects\python\config.json"
```

什么，还出问题？

python的环境变量没配置好？直接路径

```shell
C:/Users/xxxx/AppData/Local/Programs/Python/Python312/python.exe D:\Projects\python\upload.py "D:\Projects\python\config.json"
```



## 打包

不打包的话，执行这条脚本需要python的环境，以及对应的第三方的包。因此要分享给其他使用的话需要进行打包。

```shell
# 安装打包工具
pip install Pyinstaller
# 打包命令
Pyinstaller -D upload.py
```



