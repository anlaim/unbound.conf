# unbound.conf

![unbound.conf](https://i.imgur.com/zoFgNsM.png)

[DNSCrypt](https://github.com/jedisct1/dnscrypt-proxy) is a piece of lightweight software that everyone should use to boost online privacy and security. It works by encrypting all DNS traffic between the user and DNS resolver, preventing any spying, spoofing or man-in-the-middle attacks.

[Unbound](https://www.unbound.net/) is a validating, recursive, and caching DNS resolver. 

[NirCmd](http://www.nirsoft.net/utils/nircmd.html) is a small command-line utility that allows you to do some useful tasks without displaying any user interface.

## 使用方法

* 下载 [DNSCrypt 32-bit](https://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-win32-full-1.9.4.zip)或[DNSCrypt 64-bit](https://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-win64-full-1.9.4.zip)、[Unbound](http://unbound.net/downloads/unbound-1.6.0.zip)、[NirCmd 32-bit](http://www.nirsoft.net/utils/nircmd.zip)或[NirCmd 64-bit](http://www.nirsoft.net/utils/nircmd-x64.zip)

* 解压`dnscrypt-proxy-win32-full-1.9.4.zip`或`dnscrypt-proxy-win64-full-1.9.4.zip`到`E:\Program Files\DNSCrypt\`；解压`unbound-1.6.0.zip`到`E:\Program Files\unbound\`；解压`nircmd.zip`或`nircmd-x64.zip`到`C:\Windows\System32\`

* 下载[配置文件](https://github.com/CNMan/unbound.conf/archive/master.zip)，解压`unbound`目录中的文件到`E:\Program Files\unbound\`，解压`dnscrypt-proxy`目录中的文件到`E:\Program Files\DNSCrypt\`，解压`localdns.cmd`到`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\`

* 根据实际情况修改[localdns.cmd](https://github.com/CNMan/unbound.conf/blob/master/localdns.cmd#L3)和[unbound.conf](https://github.com/CNMan/unbound.conf/blob/master/unbound/unbound.conf#L4)中的相关目录

* 运行`localdns.cmd`启动DNSCrypt和Unbound

* 参考[dig安装与使用](https://github.com/CNMan/unbound.conf/issues/6)，测试53和9999端口的解析是否正常

* 在网络设置里面把DNS服务器设置成127.0.0.1

![localdns](https://i.imgur.com/4WN9qit.png)

* Linux用户可参考[树莓派安装unbound和dnscrypt-proxy全记录](https://github.com/CNMan/unbound.conf/issues/13)进行配置，大同小异。

## 说明

主要配置文件在北京时间每天5:09、13:09、21:09与上游项目同步更新一次

常用hosts域名配置在`unbound.local-zone.hosts.conf`，配置说明可参考[Unbound+DNSCrypt双保险防DNS污染及劫持](https://goo.gl/IG3K27)

广告域名和恶意软件域名配置在`dnscrypt-blacklist-domains.txt`，由DNSCrypt负责过滤

国内运营商bogus nxdomain ip配置在`unbound.bogus-nxdomain.China.conf`，[烦请帮忙收集各地运营商的bogus nxdomain ip](https://github.com/CNMan/unbound.conf/issues/11)

国内域名配置在`unbound.forward-zone.China.conf`，默认由114.114.114.114和223.5.5.5解析

其他域名由监听在9999端口的DNSCrypt负责解析

修改unbound配置文件后，请先检查有没有错误配置，再重启unbound并刷新DNS解析缓存

```
cd /d "E:\Program Files\unbound\"
unbound-checkconf unbound.conf
unbound-control -c unbound.conf reload
ipconfig /flushdns
```

![unbound-control](https://i.imgur.com/FWjHwjh.png)

## 致谢

* hosts域名列表取自[https://github.com/racaljk/hosts](https://github.com/racaljk/hosts)

* 国内域名列表取自[https://github.com/felixonmars/dnsmasq-china-list](https://github.com/felixonmars/dnsmasq-china-list)，如果你有其他国内域名需要添加，请直接向`dnsmasq-china-list`项目反馈
