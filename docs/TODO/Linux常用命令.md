



重命名

```
mv tes1.txt sharplee1.txt
```

```
 mv -i tes2.txt sharplee2.txt
```



通过cp命令来重命名一个文件目录，下面是把test2目录重命名为test3目录。

```
[root@sharplee creatfile]# cp -r test2 test3
```





将文件 file.txt 复制到目录 /path/to/destination/ 中：

```
cp file.txt /path/to/destination/
```

使用指令 **cp** 将当前目录 **test/** 下的所有文件复制到新目录 **newtest** 下，输入如下命令：

```
cp –r test/ newtest          
```

注意：用户使用该指令复制目录时，必须使用参数 **-r** 或者 **-R** 。

复制文件，并在目标文件已存在时进行确认：

```
cp -i file.txt /path/to/destination/
```