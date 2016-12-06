# 查看文件的权限
ls -al $filepath

# 修改文件权限 我也不知道到底啥意思
chmod 777 $filepath
chmod a-rwx $filepath

# 重启，停止，开始Shadowscoks服务
sudo supervisorctl start shadowsocks #在aws上，因为我添加了supervisor，将shadowsocks变成一个服务了。
# 修改shadowsocks.json配置
sudo vi /etc/shadowsocks.json
# centos 重启ssh服务
/etc/init.d/sshd restart
# 上传本地文件到服务端
# linux/unix/Mac
scp -P 22(如果是默认的不需要这个) /path/local_filename username@server_ip:/server_dir_path
# windows 请使用git bush客户端
sc -P 22(如果是默认22端口则不需要) /path/local_filename username@server_ip:/server_dir_path
# 从服务器下载文件，将上传的命令反过来就行。

# linux/unix/Mac 登录服务器
ssh -p 22 username@server_ip -i /private_key_path