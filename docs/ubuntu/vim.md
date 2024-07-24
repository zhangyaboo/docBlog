## vim



> [Linux vi/vim | 菜鸟教程 (runoob.com)](https://www.runoob.com/linux/linux-vim.html)
>
> 



```
vim test.txt

:wq 
:q
:!q


cat test.txt



```









使用vim编辑文件时，超时退出终端，或者没有退出直接关闭终端，造成异常退出的场景，再次编辑时会报以下错误：

```shell
E325: ATTENTION
Found a swap file by the name ".test.txt.swp"
          owned by: root   dated: Thu Jun 27 14:38:06 2019
         file name: ~root/test.txt
          modified: YES
         user name: root   host name: VMcentos
        process ID: 20994
While opening file "test.txt"
             dated: Thu Jun 27 13:42:52 2019

(1) Another program may be editing the same file.  If this is the case,
    be careful not to end up with two different instances of the same
    file when making changes.  Quit, or continue with caution.
(2) An edit session for this file crashed.
    If this is the case, use ":recover" or "vim -r test.txt"
    to recover the changes (see ":help recovery").
    If you did this already, delete the swap file ".test.txt.swp"
    to avoid this message.

Swap file ".test.txt.swp" already exists!
[O]pen Read-Only, (E)dit anyway, (R)ecover, (D)elete it, (Q)uit, (A)bort:
```

使用ll -a 命令查看一下，确实有一个隐藏文件，原来在编辑文件时，系统会copy一份临时文件.test.txt.swap，也会对这个文件进行编辑，执行:w时才会将临时文件中的内容写入到正式文件，执行:q时才会将临时文件删除。

解决办法：

将.test.txt.swp文件删除，rm .test.txt.swp


```
rm .test.txt.swp
```

