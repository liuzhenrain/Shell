# 更新Ubuntu内核到4.11.2

## 下载地址

所有版本查看地址：[Ubuntu-linux-kernel](http://kernel.ubuntu.com/~kernel-ppa/mainline/)

4.11.2

    Ubuntu 32位 : http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.11.2/linux-image-4.11.2-041102-generic_4.11.2-041102.201705201036_i386.deb
    Ubuntu 64位： http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.11.2/linux-image-4.11.2-041102-generic_4.11.2-041102.201705201036_amd64.deb

## 安装

 dpkg -i linux-image-4.11.2-041102-generic_4.11.2-041102.201705201036_i386.deb

### 安装结果

默认应该可以看到现在电脑里面已经有了那些内核了。

```bash
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-4.11.2-041102-generic
Found initrd image: /boot/initrd.img-4.11.2-041102-generic
Found linux image: /boot/vmlinuz-4.4.0-78-generic
Found initrd image: /boot/initrd.img-4.4.0-78-generic
Found linux image: /boot/vmlinuz-4.4.0-62-generic
Found initrd image: /boot/initrd.img-4.4.0-62-generic
```

使用命令查看已安装的内核

dpkg -l|grep linux-image

```bash
root@ubuntu:~# dpkg -l|grep linux-image
ii  linux-image-4.11.2-041102-generic  4.11.2-041102.201705201036                 i386         Linux kernel image for version 4.11.2 on 32 bit x86 SMP
ii  linux-image-4.4.0-62-generic       4.4.0-62.83                                i386         Linux kernel image for version 4.4.0 on 32 bit x86 SMP
ii  linux-image-4.4.0-78-generic       4.4.0-78.99                                i386         Linux kernel image for version 4.4.0 on 32 bit x86 SMP
ii  linux-image-extra-4.4.0-62-generic 4.4.0-62.83                                i386         Linux kernel extra modules for version 4.4.0 on 32 bit x86 SMP
ii  linux-image-extra-4.4.0-78-generic 4.4.0-78.99                                i386         Linux kernel extra modules for version 4.4.0 on 32 bit x86 SMP
ii  linux-image-generic                4.4.0.78.84                                i386         Generic Linux kernel image
```

### 删除不用的内核

`apt-get remove "内核名字,例：linux-image-4.4.0**"`

### 重建引导

update-grub  #更新引导
reboot  #重启

## 打开bbr加速

### 修改系统变量：

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

### 保存生效

sysctl -p

### 执行

sysctl net.ipv4.tcp_available_congestion_control

如果看到：net.ipv4.tcp_available_congestion_control = bbr cubic reno 代表执行OK了，BBR已经开启。