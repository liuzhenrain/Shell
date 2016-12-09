# Ubuntu 16.04 安装 Owncloud 私有云服务

## 命令

    wget -nv https://download.owncloud.org/download/repositories/stable/Ubuntu_16.04/Release.key -O Release.key
    apt-key add - < Release.key
    sh -c "echo 'deb http://download.owncloud.org/download/repositories/stable/Ubuntu_16.04/ /' > /etc/apt/sources.list.d/owncloud.list"
    apt-get update
    apt-get install owncloud
    以上一步都不能少.
    其他平台请访问:https://download.owncloud.org/download/repositories/stable/owncloud/

## 配置
    1. 错误
        `apache2.service is not active, cannot reload.` 状况.其实很简单,使用命令: `service apache2 start` 
    2. 打开 ip/owncloud 进行配置,注意选择(数据库与保存位置)
    N7%MM7p%*6QV59r2
