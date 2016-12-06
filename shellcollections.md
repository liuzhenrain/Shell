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
>> 从服务器下载文件，将上传的命令反过来就行。针对整个目录，在scp之后加上 `-r` 参数

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
    Port 22 ~如果有其他的填入其他的端口
    Idetityfile /g/AWS/banwagong ~密钥文件，如果有就填入
