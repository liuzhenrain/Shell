echo "在centos上自动安装vim并且进行配置"
yum -y install vim
curl "https://raw.githubusercontent.com/liuzhenrain/Shell/master/vim/.vimrc" > ~/.vimrc
