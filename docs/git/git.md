

# Git 常用命令

查看所有分支

```
git branch -a
```







\1. 新建本地分支： a. 使用命令git checkout -b 本地分支名 ，新建一个本地分支并切换到该分支。例如，如果你想创建一个名为dev的新分支，你可以运行git checkout -b dev。



 \2. 关联远程分支： a. 使用命令git branch --set-upstream-to=origin/远程分支名 本地分支名, 将本地分支与远程分支关联起来。例如，如果你想将本地的dev分支与远程的origin/dev分支关联起来，你可以运行git branch --set-upstream-to=origin/dev dev。 3. 查看本地分支与远程分支的映射关系： a. 使用命令git branch -vv可以查看本地分支与远程分支的映射关系。 以上就是在Git中创建本地分支并关联远程分支的步骤





git checkout . #本地所有修改的。没有的提交的，都返回到原来的状态

git stash #把所有没有提交的修改暂存到stash里面。可用git stash pop回复。

git reset --hard HASH #返回到某个节点，不保留修改。

git reset --soft HASH #返回到某个节点。保留修改

 

git clean -df #返回到某个节点

git clean 参数

  -n 显示 将要 删除的 文件 和  目录

  -f 删除 文件

  -df 删除 文件 和 目录

 

https://blog.csdn.net/chen134225/article/details/95475960





106693/小车暂垫系统-暂垫明细表栏位调整-20231010495401