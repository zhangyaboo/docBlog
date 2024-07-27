

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

在 Ubuntu 系统上，为了使指定的 Git 目录在执行 `git pull` 或 `git push` 操作时不用再次输入用户名和密码，可以通过以下几种方法实现：

### 方法1：使用 Git 凭证助手（推荐）

Git 提供了一个凭证助手，可以在首次输入用户名和密码后记住它们，以便在后续操作中自动使用。

1. **安装 Git 凭证助手：**

   如果你使用的是 Git 2.11 及以上版本，`credential.helper` 默认已经包含在 Git 中。否则，你可以通过以下命令安装：

   ```bash
   sudo apt install git
   ```

2. **配置 Git 凭证助手：**

   在 Git 配置中启用凭证助手：

   ```bash
   git config --global credential.helper store
   ```

3. **运行 `git pull` 或 `git push` 命令：**

   当你第一次运行 `git pull` 或 `git push` 时，系统会提示输入用户名和密码。之后，凭证助手会将它们保存在 `~/.git-credentials` 文件中，后续操作将自动使用这些凭证。

### 方法2：将凭证存储在 `.netrc` 文件中

1. **编辑 `.netrc` 文件：**

   创建或编辑主目录中的 `.netrc` 文件：

   ```bash
   nano ~/.netrc
   ```

2. **在文件中添加 Git 凭证：**

   根据你的 Git 服务器 URL，添加以下内容：

   ```
   machine github.com
   login your_username
   password your_password
   ```

   请将 `github.com` 替换为你的 Git 服务器域名，将 `your_username` 和 `your_password` 替换为你的 Git 用户名和密码。

3. **设置 `.netrc` 文件权限：**

   确保该文件只有当前用户可读写：

   ```bash
   chmod 600 ~/.netrc
   ```

### 方法3：使用 SSH 密钥（更安全的方法）

1. **生成 SSH 密钥：**

   如果你还没有 SSH 密钥，可以生成一个：

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

   按提示操作并记住生成的文件路径（默认是 `~/.ssh/id_rsa`）。

2. **添加 SSH 密钥到 SSH 代理：**

   启动 SSH 代理并添加你的 SSH 密钥：

   ```bash
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_rsa
   ```

3. **将公钥添加到 Git 服务器：**

   打开 `~/.ssh/id_rsa.pub` 文件，复制其中的内容，并将其添加到你的 Git 服务器的 SSH 密钥设置中。

4. **使用 SSH URL 克隆 Git 仓库：**

   使用 SSH URL 克隆你的 Git 仓库：

   ```bash
   git clone git@github.com:your_username/your_repository.git
   ```

   这样，每次 `git pull` 或 `git push` 时，将使用 SSH 密钥进行身份验证，而无需输入用户名和密码。

### 验证

不论你使用哪种方法，配置完成后，尝试在你的 Git 目录中运行 `git pull` 或 `git push`，以确认无需再次输入用户名和密码。

这些方法将帮助你在 Ubuntu 系统上为指定的 Git 目录设置用户名和密码，使其在执行 `git pull` 或 `git push` 时自动进行身份验证。选择适合你需求的方法，推荐使用 SSH 密钥以提高安全性。
