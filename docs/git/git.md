

# Git 常用命令

查看所有分支

```shell
git branch -a
```



1. 新建本地分支： a. 使用命令git checkout -b 本地分支名 ，新建一个本地分支并切换到该分支。例如，如果你想创建一个名为dev的新分支，你可以运行git checkout -b dev。

```
git checkout -b 本地分支名
```



2. 关联远程分支： a. 使用命令git branch --set-upstream-to=origin/远程分支名 本地分支名, 将本地分支与远程分支关联起来。例如，如果你想将本地的dev分支与远程的origin/dev分支关联起来，你可以运行git branch --set-upstream-to=origin/dev dev。 

```
git branch --set-upstream-to=origin/远程分支名 本地分支名
```



3. 查看本地分支与远程分支的映射关系： a. 使用命令git branch -vv可以查看本地分支与远程分支的映射关系。 以上就是在Git中创建本地分支并关联远程分支的步骤

```
git branch -vv
```



git checkout . #本地所有修改的。没有的提交的，都返回到原来的状态

git stash #把所有没有提交的修改暂存到stash里面。可用git stash pop回复。

git reset --hard HASH #返回到某个节点，不保留修改。

git reset --soft HASH #返回到某个节点。保留修改

 

git clean -df #返回到某个节点

git clean 参数

  -n 显示 将要 删除的 文件 和  目录

  -f 删除 文件

  -df 删除 文件 和 目录

 



最近git还是遇到一些问题的。记录一下；

偷看别人代码的时候，把分支更新到最新的了，结果莫名多出来一些commit,完了还和远程的冲突了，真的是麻了；

如何抛弃本地的变动，将本地代码和远程分支的保持一致？
操作如下：

```shell
# 获取远程分支的最新信息
git fetch origin
# 将本地分支重置为远程分支最新一版
git reset --hard "origin/xxxx/xxxx"
```

真头疼，commit的时候忘记修改注释了，被老大看到肯定会被骂，还好没有push上去
操作如下：

```shell
# 撤回本地提交记录
git reset --soft HEAD~1
# 检查本地变动状态
git status
```

### 注意

操作会清除本地的所有未提交的变动，好处是强行将本地分支和远程保持一致，并且不会对远程分支有任何影响



https://blog.csdn.net/chen134225/article/details/95475960



```
ctrl shift alt j
ctrl -/+
ctrl shift -/+

滚轮
```

