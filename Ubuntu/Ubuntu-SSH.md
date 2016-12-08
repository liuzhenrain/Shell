# Ubuntu 16.04 LTS SSH 搬瓦工VPS 使用密钥登录

1. 在KiviVM面板选择 `Install new OS`
2. 选择使用 **`Ubuntu 16.04 LTS`**
    >这里会给出新的root密码和ssh的端口,密码一定要保存下来.防止忘记
3. 点击左侧面板 `Root Shell - interactive`
    >此时会弹出一个弹窗控制台,在控制台中输入 `passwd` 进行密码修改,个人建议修改为你记忆的最清楚的强密码(英文+数字+符号),搬瓦工不接受纯数字弱密码,已多次试验.
4. 使用本地终端登录VPS服务器

    4.1 Windows 使用 `Putty` 或者 Git Bash

    4.2 Mac 使用自带的终端就可以了

       ssh -p (端口号) root@server_ip
       
    4.3 Linux 不会问 **Google**