# 安装 ShadowSocks

## 环境搭建

1. 确认Python版本是不是2.*的，默认搬瓦工的KVM的机器是没有python2的，需要另行安装

    `apt-get install python`

1. 安装pip

    `apt install python-pip`

    安装之后需要使用 `pip install --upgrade pip`进行升级操作

1. 安装shadowsocks Python 版 `pip install shadowsocks`

## 配置Shadowsocks

### 配置 shadowsocks.json

```bash
vim /etc/shadowsocks.json
# 加入如下数据
{
    "server":"0.0.0.0", # 如果连接不了，改为vps地址
    "server_port":8388,
    "port_password":{
        "443":"password"
    },
    "timeout":300,
    "method":"chacha20",
    "fast_open":false
}
```

### 增加加密方式 chacha20

```bash
apt-get install build-essential
wget https://github.com/jedisct1/libsodium/releases/download/1.0.8/libsodium-1.0.8.tar.gz
tar xf libsodium-1.0.8.tar.gz && cd libsodium-1.0.8
./configure && make -j2
make install
ldconfig
```

### 修改系统配置，仅针对Kvm设备

``` bash
echo "soft nofile 51200" >> /etc/security/limits.conf
echo "hard nofile 51200" >> /etc/security/limits.conf
ulimit -n 51200

vim /etc/sysctl.conf
# 加入以下所有内容
fs.file-max = 51200
net.core.rmem_max = 67108864
net.core.wmem_max = 67108864
net.core.netdev_max_backlog = 250000
net.core.somaxconn = 4096
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 0
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.ip_local_port_range = 10000 65000
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_mem = 25600 51200 102400
net.ipv4.tcp_rmem = 4096 87380 67108864
net.ipv4.tcp_wmem = 4096 65536 67108864
net.ipv4.tcp_mtu_probing = 1
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
#内容结束
sysctl -p
```