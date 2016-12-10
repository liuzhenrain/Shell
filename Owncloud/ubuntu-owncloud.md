# Ubuntu 16.04 安装 Owncloud 私有云服务

## 命令

    wget -nv https://download.owncloud.org/download/repositories/stable/Ubuntu_16.04/Release.key -O Release.key
    apt-key add - < Release.key
    sh -c "echo 'deb http://download.owncloud.org/download/repositories/stable/Ubuntu_16.04/ /' > /etc/apt/sources.list.d/owncloud.list"
    apt-get update
    apt-get install owncloud
    以上一步都不能少.
    其他平台请访问:https://download.owncloud.org/download/repositories/stable/owncloud/

## 安装 Mysql 5.7.16

    在搬瓦工的 Ubuntu 16.04 LTS 平台安装 Owncloud 一定会出现错误.没有安装 mysql ,而且他的 apache 服务不是 Http 是 apache2.
    安装方式:
        apt-get install -y mysql-server
        ps -ef | grep mysql #确认是否安装成功
        mysql -u root -p #登录 Mysql
        create database ocdata; #创建 ocdata 数据库
        GRANT ALL ON ocdata.* TO 'owncloud' IDENTIFIED BY 'password';   #创建一个用户为:owncloud,密码为 password 的用户,并且将 ocdata数据的权限给 owncloud 用户
        quit # 退出数据库
        cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
        vim /etc/mysql/my.conf
        在[mysqld]下追加:character-set-server=utf8
        在[mysql]下追加:default-character-set=utf8 #没有就在最后一行手动添加[mysql]
        service mysql restart

## 配置
    1. 错误
        `apache2.service is not active, cannot reload.` 状况.其实很简单,使用命令: `service apache2 start` 
    2. 打开 ip/owncloud 进行配置,注意选择(数据库与保存位置)
    
