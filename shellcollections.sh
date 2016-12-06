# 查看文件的权限
ls -al $filepath

# 修改文件权限 我也不知道到底啥意思
chmod 777 $filepath
chmod a-rwx $filepath

# 重启，停止，开始Shadowscoks服务
sudo supervisorctl start shadowsocks #在aws上，因为我添加了supervisor，将shadowsocks变成一个服务了。
# 修改shadowsocks.json配置
sudo vi /etc/shadowsocks.json