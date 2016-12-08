# Ubuntu 16.04 LTS SSH 搬瓦工VPS 使用密钥登录

1. 在KiviVM面板选择 `Install new OS`
2. 选择使用 **`Ubuntu 16.04 LTS`**
    >这里会给出新的root密码和ssh的端口,密码一定要保存下来.防止忘记
3. 点击左侧面板 `Root Shell - interactive`
    >此时会弹出一个弹窗控制台,在控制台中输入 `passwd` 进行密码修改,个人建议修改为你记忆的最清楚的强密码(英文+数字+符号),搬瓦工不接受纯数字弱密码,已多次试验.
4. 使用本地终端登录VPS服务器
    * 4.1 Windows 使用 `Putty` 或者 Git Bash
    * 4.2 Mac 使用自带的终端就可以了
        > ssh -p (端口号) root@server_ip

    * 4.3 Linux 不会问 **Google**

5. 在终端输入 `ssh-keygen`， 连续按三次回车
6. 输入命令 `cd .ssh` -> `cat id_rsa.pub >> authorized_keys`
7. 退出服务器端，可以直接输入`exit`即可
8. 从服务器下载 `id_rsa` 文件,具体下载方式:
    > Linux / Mac 直接使用 scp 即可,windows 请使用 wincp 或者 git Bash
    > 下载完成之后 Mac/Linux 使用 `chmod 600 id_rsa` 修改权限
9. 使用`ssh -p 22 -i id_rsa_path root@server_ip`测试登录,如果可以代表密钥正确,此时同样需要输入密码.
10. 将密码登录关闭
    > 使用 `vim /etc/ssh/sshd_config`

    > 找到 **`PasswordAuthentication yes`** 默认应该是被注释掉的.将注释去掉,把 yes 改为 no.保存退出
11. 退出服务器,使用第`9`条命令登录服务器

---
## Mac 平台快捷登录设置

    cd ~
    cp your_id_rsa_path .ssh/
    vim .ssh/config
    # 输入下面的数据
    Host banwagong
    HostName your_server_ip
    Port 29111 #默认搬瓦工应该是非22端口
    User root   #除非你修改了,默认应该是 root 账户
    Identityfile ~/.ssh/id_rsa_path 