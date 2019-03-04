## Required Subscription
Ensure the system is properly subscribed and has rhel-7-server-rpms repository enabled

## Installation

### Install HAProxy
```
yum install haproxy
```

### Configure haproxy for SELinux and HTTP
```
vim /etc/firewalld/services/haproxy-http.xml

<?xml version="1.0" encoding="utf-8"?>
<service>
<short>HAProxy-HTTP</short>
<description>HAProxy load-balancer</description>
<port protocol="tcp" port="80"/>
</service>
```

### Set correct SELinux context and file permissions to the haproxy-http.xml file
```
cd /etc/firewalld/services
restorecon haproxy-http.xml
chmod 640 haproxy-http.xml
```

### For https listeners
```
vim /etc/firewalld/services/haproxy-https.xml

<?xml version="1.0" encoding="utf-8"?>
<service>
<short>HAProxy-HTTPS</short>
<description>HAProxy load-balancer</description>
<port protocol="tcp" port="443"/>
</service>
```

### Set correct SELinux context and file permissions to the haproxy-https.xml file
```
cd /etc/firewalld/services
restorecon haproxy-https.xml
chmod 640 haproxy-https.xml
```

### Configure Certs
```
cat example.com.crt example.com.key > example.com.pem
cp example.com.pem /etc/ssl/private/
```

### Configure HAProxy Config
```
vim /etc/haproxy/haproxy.cfg

# The global and defaults sections of haproxy.cfg may remain unchanged. After the defaults sections, you will need to configure frontend and backend sections

frontend http_web *:80
    mode http
    default_backend rgw

frontend rgw­-https
  bind <insert vip ipv4>:443 ssl crt /etc/ssl/private/example.com.pem
  default_backend rgw

backend rgw
    balance roundrobin
    mode http
    server  rgw1 10.0.0.71:80 check
    server  rgw2 10.0.0.80:80 check

```

### Enable service and start
```
systemctl enable haproxy
systemctl start haproxy
```


## SSL Pass Through Example - ie No Layer7 processing

### Frontend HAProxy Config
```
frontend localhost
  bind *:80
  bind *:443
  option tcplog
  mode tcp
  default_backend nodes
```

### Frontend IPTable rules
```
-A INPUT -p tcp -m tcp --dport 80 -m state --state NEW -j ACCEPT
-A INPUT -p tcp -m tcp --dport 443 -m state --state NEW -j ACCEPT
```

### Backend HAProxy Config
```
   mode tcp
   balance roundrobin
   option ssl-hello-chk
   server node01 192.168.1.11:443 check
   server node02 192.168.1.12:443 check
```

### Backend IPTable rules
```
-A INPUT -p tcp -m tcp --dport 443 -m state --state NEW -j ACCEPT
```

## Logging

### HAProxy to send its messages to rsyslog on 127.0.0.1
```
global
    log         127.0.0.1 local2
[...]
```

### Rsyslog config - rsyslog listen on UDP port 514 for all IP addresses
```
$ModLoad imudp
$UDPServerRun 514

# Optionally you can limit to 127.0.0.1 by adding line #3 below
$UDPServerAddress 127.0.0.1
```

### HAProxy Rsyslog config
```
/etc/rsyslog.d/haproxy.conf

local2.*    /var/log/haproxy.log

or

# You can of course be more specific and create separate log files according to the level of messages:
local2.=info     /var/log/haproxy-info.log
local2.notice    /var/log/haproxy-allbutinfo.log
```

### Restart rsyslog
```
systemctl restart rsyslog
```
