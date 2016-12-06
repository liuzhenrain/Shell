#!/bin/bash
echo 'this script will to install Python2.7.12 to centos 6.x'
version='2.7.12'
python_url = "https://www.python.org/ftp/python/$version/Python-${version}.tgz"

# 更新yum
echo "更新yum"
yum -y update

# 安装需要的工具或库文件
echo "安装需要的工具或库文件"
yum groupinstall -y "Development tools"
yum install -y openssl-devel zlib-devel ncurses-devel bzip2-devel readline-devel
yum install -y libtool-ltdl-devel sqlite-devel tk-devel tcl-devel xz-libs
sleep 5

# 先检查本地的Python版本
echo "检查本地Python版本 $(python -V &2>1)"
python -V 2>&1 | grep "$version"
if [ $? -eq 0 ]; then
    echo "当前python版本已经和设定的版本一致，不需要更新了"
    exit 0
fi

echo "下载并安装Python"
wget --no-check-certificate $python_url
tar -zxf Python-${version}.tgz
cd Python-${version}
./configure --prefix=/usr/local
make
make altinstall
sleep 5

echo "检查安装的Python版本好是否是指定的版本"
python -V 2>&1 | grep "$version"
if [ $? -ne 0 ]; then
    echo "python -V is not your installed version"
    /usr/local/bin/python -V 2>&1 | grep "$version"
    if [ $? -ne 0 ]; then
        echo "Installation failed. use '/usr/local/bin/python -V' to have a check"
    fi
    exit 1
fi
sleep 5





