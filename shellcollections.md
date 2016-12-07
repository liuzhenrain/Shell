# 个人总结的一些 shell 命令

## 查看文件的权限

    ls -al $filepath

## 修改文件权限 我也不知道到底啥意思

    chmod 777 $filepath
    chmod a-rwx $filepath

## 重启，停止，开始Shadowscoks服务

    sudo supervisorctl start shadowsocks #在aws上，因为我添加了supervisor，将shadowsocks变成一个服务了。

## 修改shadowsocks.json配置

    sudo vi /etc/shadowsocks.json

## centos 重启ssh服务

    /etc/init.d/sshd restart

## 上传本地文件到服务端

> linux/unix/Mac , windows windows 请使用git bash客户端
>> 如果使用默认的22端口，则不需要 `-P 22` ; 如果使用密码登录，则不需要 `-i keyfile`
从服务器下载文件，将上传的命令反过来就行。针对整个目录，在scp之后加上 `-r` 参数

    scp -P 22 -i keyfile /path/local_filename username@server_ip:/server_dir_path

## linux/unix/Mac 登录服务器,windows 需要使用 git bash 才能用这个命令

    ssh -p 22 username@server_ip -i /private_key_path #如果使用密码登录，则不需要 `-i /private_key_path` 命令

## 以下为 shell 接收用户输入

    read -p "Enter your name:" name
    echo "Hello $name, welcome to my program"

## 配置 ssh config 文件，帮助减少 ssh 登录时的操作。

>windows 使用 gitbash 客户端即可与 linux/unix/Mac 操作一致。
>>**请注意 不要修改 windows 下 gitbash 客户端的默认设置，他的默认目录应该是 ~ 对应 c/User/Administrator 目录**

    vi ./.ssh/config
    填入如下数据：
    Host name
    Hostname server_ip
    User username
    Port 22 *如果有其他的填入其他的端口*
    Idetityfile /g/AWS/banwagong *密钥文件，如果有就填入*

## shell 特殊应用

* 2>&1
    - e.g: python2.8 \-V 2>&1
    - 在shell中，每个进程都和三个系统文件相关联：标准输入stdin，标准输出stdout和标准错误stderr，三个系统文件的文件描述符分别为0，1和2。
    - 所以2>&1 就是将错误信息输出到标准输出打印出来.如果使用 python2.8 \-V 2>1 则不会打印出错误而是将错误输出到了1这个文件中

* $用法
    - `$$` Shell本身的PID(ProcessID)
    - `$!` Shell最后运行的后台Process的PID
    - `$?` Shell最后运行的命令的结束代码(返回值)
    - `$-` 使用 `Set` 命令设定的 Flag 一览
    - `$*` 所有参数列表.如 "$*"用「"」括起来的情况,以"$1 $2 ... $n"的形式输出所有参数
    - `$@` 所有参数列表.如"$@"用「"」括起来的情况,以"$1","$2"..."$n"的形式输出所有参数
    - `$#` 添加到Shell的参数个数
    - `$0` Shell本身的文件名
    - `$1-$n` 添加到Shell的各参数值.`$1`是第一参数,`$2`是第二参数...

---
>插入一个关于vscode的配置

    // 将设置放入此文件中以覆盖默认值和用户设置。
    {
        // 第一个是英文字体,第二个是中文字体,使用雅黑会默认变成宋体,丑到死
        "editor.fontFamily":"Consolas,Dengxian",
        "editor.formatOnType": true
    }
