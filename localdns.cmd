@ECHO OFF
REM START DNSCrypt
nircmd exec2 hide "E:\Program Files\DNSCrypt\" "E:\Program Files\DNSCrypt\dnscrypt-proxy.exe" dnscrypt-proxy-cisco.conf

REM START Unbound
nircmd exec2 hide "E:\Program Files\unbound\" "E:\Program Files\unbound\unbound.exe" -c unbound.conf
