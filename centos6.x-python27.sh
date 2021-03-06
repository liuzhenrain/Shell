#!/bin/bash
# 本文curl 地址 ：https://raw.githubusercontent.com/liuzhenrain/Shell/master/centos6.x-python27.sh
# 不另外fork应该不会发生变化的
echo 'this script will to install Python2.7.12 to centos 6.x'
version='2.7.12'
python_url="https://www.python.org/ftp/python/$version/Python-${version}.tgz"

# 更新yum
echo "1.更新yum"
yum -y update

# 先检查本地的Python版本
echo "2.检查本地Python版本 $(python -V &2>1)"
python -V 2>&1 | grep "$version"
if [ $? -eq 0 ]; then
    echo "当前python版本已经和设定的版本一致，不需要更新了"
    exit 0
fi

# 安装需要的工具或库文件
echo "3.安装需要的工具或库文件"
yum groupinstall -y "Development tools"
yum install -y openssl-devel zlib-devel ncurses-devel bzip2-devel readline-devel
yum install -y libtool-ltdl-devel sqlite-devel tk-devel tcl-devel xz-libs
sleep 5


echo "4.下载并安装Python"
echo $python_url
wget --no-check-certificate $python_url
tar -zxf Python-${version}.tgz
cd Python-${version}
./configure --prefix=/usr/local
make
make altinstall
sleep 5

echo "5.检查安装的Python版本号是否是指定的版本"
python2.7 -V 2>&1 | grep "$version"
if [ $? -ne 0 ]; then
    echo "python -V is not your installed version"
    /usr/local/bin/python2.7 -V 2>&1 | grep "$version"
    if [ $? -ne 0 ]; then
        echo "Installation failed. use '/usr/local/bin/python -V' to have a check"
    fi
    exit 1
else
    echo "已经正确安装版本$(python2.7 -V),位置:$(which python2.7)"
fi
sleep 5:q

echo "6.设定软连接，将系统默认的python连接到刚刚创建的版本上"
mv /usr/bin/python /usr/bin/python266
ln -s /usr/local/bin/python2.7 /usr/bin/python

echo "7.当前Python版本号为:$(python -V 2>&1)"
echo "请继续设定yum的Python指定版本"
echo "============================="
echo "==    #!/usr/bin/python    =="
echo "==    修改为:               =="
echo "==    #!/usr/bin/python266 =="
echo "============================="
sleep 10
vim /usr/bin/yum
echo "8.安装Python Setuptools工具包以及pip"
wget --no-check-certificate https://bootstrap.pypa.io/ez_setup.py -O - | python
easy_install pip
exit