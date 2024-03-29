### Vim配置文件.vimrc

Vim编辑器相关的所有功能开关都可以通过**.vimrc**文件进行设置。

**.vimrc**配置文件分系统配置和用户配置两种。

系统vimrc配置文件存放在Vim的安装目录，默认路径为`/usr/share/vim/.vimrc`。可以使用命令`echo $VIM`来确定Vim的安装目录。

用户vimrc文件，存放在用户主目录下`~/.vimrc`。可以使用命令`echo $HOME`确定用户主目录。

*注意*：用户配置文件优先于系统配置文件，Vim启动时会优先读取当前用户根目录下的**.vimrc**文件。所以与个人用户相关的个性化配置一般都放在`~/.vimrc`中。

```bash
# 安装文件
[root@huzhi-code ~]# rpm -qa | grep vim
vim-filesystem-7.4.160-5.el7.x86_64
vim-minimal-7.4.160-1.el7.x86_64
vim-common-7.4.160-5.el7.x86_64
vim-enhanced-7.4.160-5.el7.x86_64
[root@huzhi-code ~]#

# 全局配置
[root@huzhi-code ~]# cat /etc/vimrc

# 配置示例
[root@huzhi-code ~]# cat /usr/share/vim/vim74/vimrc_example.vim

# 自定义配置
[root@huzhi-code ~]# ll -a | grep vim
drwxr-x---   3 root root        22 Sep 24 11:35 .vim
-rw-------   1 root root      8456 Sep 24 11:10 .viminfo
-rw-r--r--   1 root root      6943 Sep 24 11:07 .vimrc
-rw-r--r--   1 root root      1702 Sep 24 11:43 .vimrc.bundles
-rw-r--r--   1 root root      2562 Sep 24 11:43 .vimrc.bundles_settings
-rw-r--r--   1 root root      2396 Sep 24 11:44 .vimrc.keys
[root@huzhi-code ~]#

```

### Vim 插件

插件管理器
* [vim-plug](https://github.com/junegunn/vim-plug)
* [Vundle.vim](https://github.com/VundleVim/Vundle.vim)

```bash
# 使用 vim-plug 插件管理器
[root@huzhi-code ~]# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
>     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[root@huzhi-code .vim]# pwd
/root/.vim
[root@huzhi-code .vim]# tree -a .
.
└── autoload
    └── plug.vim

1 directory, 1 file
[root@huzhi-code .vim]#
```


### 参考
* https://linux.cn/article-9751-1.html
* http://www.ruanyifeng.com/blog/2018/09/vimrc.html
* https://segmentfault.com/a/1190000016330314
