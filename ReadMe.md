| Description |  Linux | Windows |
| --- | --- | --- |
| Find size of files/directories recursively | `du -ah ~/Downloads/ | sort -rh | head -10` or `find . -type f -printf "%s\t%p\n" | sort -nr` | `Get-ChildItem | Where-Object { $_.PSIsContainer } | ForEach-Object { $_.Name + ": " + "{0:N2}" -f ((Get-ChildItem $_ -Recurse | Measure-Object Length -Sum -ErrorAction SilentlyContinue).Sum / 1MB) + " MB" }` |
| Find checksum | `cksum FILE_NAME`, `md5sum FILE_NAME`, `sha512sum FILE_NAME` | `CertUtil -hashfile pathToFileToCheck [HashAlgorithm]` ex: CertUtil -hashfile C:\TEMP\MyDataFile.img MD5 |
| AD Manage users and computers |  | `dsa.msc` |
| LDAP Browser / Query | `/usr/lib64/mozldap/ldapsearch -D "cn=directory manager" -w SECRET -p 636 -h server.example.com -b "dc=example,dc=com" -s sub "cn=user name / computer name"` | `adsiedit` |
| List Services | `systemctl list-units --type=service --state=active` | `services.msc` |
| List Service dependencies | `systemctl list-dependencies docker` |  |
| Group policy editor | NA | `gpedit.msc` |
| List of processes and associated services |  | `tasklist /svc` |
| Bulk kill processes | `kill -9 PID's` | `TASKKILL /IM chromedriver.exe /F` |
| Remote command execution |  | `Invoke-Command -Computername $RemoteComputer -ScriptBlock { Get-ChildItem "C:\Program Files" }` |
| Take VMWare snapshots |  | `$VMs = Get-VM SEARCH_PATTERN, New-Snapshot -VM $VMs -Name "SNAPSHOT NAME" -Description "SNAPSHOT DESCRIPTION"` |
| Remove VMWare snapshots dry-run |  | `get-vm -Name *PRD*ENG* | get-snapshot | where {$_.Name -match "SNAPSHOT_NAME"} | remove-snapshot –whatif` |
| Add CA at Machine level | `curl -k URL_TO_DOWNLOAD_PEM > /etc/pki/ca-trust/source/anchors/FILE_NAME && update-ca-trust && certutil -A -d /etc/pki/nssdb -n 'NAME OF THE CA' -t CT,C,C -a -i /etc/pki/ca-trust/source/anchors/FILE_NAME PIPE certutil -machine -accept Certchain.p7b` | `certutil -machine -accept Certchain.p7b` |
| DNS Lookups | `dig -x 8.8.8.8`, `dig @8.8.8.8 domainName`, `dig @8.8.8.8 +norecurse domainName`, `dig @8.8.8.8 +trace domainName` | `nslookup domainName` |
| Find the default executable that gets picked up | `which` | `where` |
| System wide temp location |  | `%TEMP%` |
| Find processes with handles on a particular file or set of files | `fuser` | `sysinternal's handle tool` ex: Here this finds the PID with handlee on log files and kills the processes `for /f "skip=4 tokens=3" %i in ('handle ..\logs\') do taskkill /pid %i` |
| List environment variables from current session | `export` | `set` and `set PREFIX_TEXT` |
| System information | `uname` | `systeminfo` |
| List ports and processes using those ports | `netstat -anp` | `netstat -ano` |
| IPv6 resolution | `dig AAAA DOMAIN_NAME` or `nslookup -query=AAAA DOMAIN_NAME` | `nslookup -query=AAAA DOMAIN_NAME` |


| Description |  Command |
| --- | --- |
| Add CA to certificate the npm trust store | `npm config set cafile C:\Users\Administrator\Downloads\CA_CHAIN.pem` |
| Verify if the key-pairs match |  `diff  <(openssl x509 -in ssl.crt -pubkey -noout) <(openssl rsa -in ssl.key -pubout)` |
| Create CSR from existing key-pair | `openssl req -sha256 -new -key domainName.key -out domainName.csr` |
| Create a self-signed certificate from existing keys | `openssl x509 -req -sha256 -days 365 -in domainName.csr -signkey domainName.key -out domainName.crt` |
| Create new key pairs and CSR | `openssl req -out domainName.csr -new -newkey rsa:4096 -nodes -keyout domainName.key` |
| Create new key pair and self-signed certificate, private key password protected | `openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 356` |
| Create new key pair and self-signed certificate, private key not password protected | `openssl req -nodes -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 356` |
| SSL Handshake debug | `openssl s_client -showcerts -connect google.com:443 -debug -nbio -state -tls1 and grep -i state` |
| Get Certificates | `openssl s_client -showcerts -connect DOMAIN_NAME:443 </dev/null 2>/dev/null and openssl x509 -outform PEM >mycertfile.pem` |
| Print Certificate | `openssl x509 -in temp.pem -text -noout` |
| Create key-pair | `openssl genrsa -des3 -out private-for-san.pem 2048` |
| Export public key | `openssl rsa -in private-for-san.pem -outform PEM -pubout -out public-for-san.pem` |
| Export private key unencrypted | `openssl rsa -in private-for-san.pem -out private_unencrypted.pem -outform PEM` |
| Print CSR | `openssl req -noout -text -in domainName.csr` |
| Print certs in a cert container | `openssl pkcs7 -print_certs -in certContainer.p7b` |
| Enable SNI with s_client | `openssl s_client -connect google.com:443 -servername google.com` |
| Import P7b into JKS | `keytool -importcert -alias ALIAS -trustcacerts -file FullChainOfCerts.p7b -keystore newkeystore.jks –storetype JKS` |
| Import cert and trust | `keytool -import -trustcacerts -keystore cacerts -alias ALIAS -file cert.pem` |
| Match keys | Assuming you have the public keys inside x.509 certificates, and assuming they are RSA keys, then for each public key, do, `openssl x509 -in certfile -modulus -noout`. For each private key, do `openssl rsa -in keyfile -modulus -noout`. Then match the keys by modulus. |


| Description |  Detail |
| --- | --- |
| IP Patterns | `0.0.0.0/0` - All IPv4 addresses, `::0/0`- All IPv6 addresses, `0.0.0.0:80` - On any network interface on port 80 |
| Find external IP address | `curl -kLvvv https://ifconfig.co/json` |
| Open up a TCP socket and listen for connections | `nc -l 192.168.2.1 3000` |
| Packet capture from within Network namespace  |  `nsenter -t 19941 -n tcpdump -i any -s0 -nn -A -w /tmp/appName.pcap and port 443`, `nsenter -t 11016 -p tcpdump -i any -s0 -A -nn host IP_ADDRESS`, `nsenter -t 39526 -n tcpdump -i any -s0 -nn -A host IP_ADDRESS -w /tmp/appName.pcap and port 443`, `nsenter -t 11019 -n tcpdump -i any -s0 -nn -A host IP_ADDRESS -w /tmp/appName.pcap and port 8080`, `nsenter -t 120644 -n tcpdump -i any -nn -R http -2`, `nsenter -t 120644 -n tcpdump -i any -nn -R dns -2`, `nsenter -t 120644 -n tcpdump -i any -nn -R ssl -2`, `nsenter -t 31179 -n tshark -i any -nn -R 'http.request.method == "GET" || http.request.method == "HEAD" || http.request.method == "POST" || http'`, `nsenter -t 31179 -n tshark -i any -nn -R 'tcp.analysis.retransmission or tcp.analysis.fast_retransmission'`,`nsenter -t 120644 -n tshark -i any -nn host -A -s0 127.0.0.1 and port 8081` |


| Description |  Detail |
| --- | --- |
| Scale a service within docker-compose | `docker-compose -f /etc/docker-compose.yml scale chrome=10` |
| Install docker-compose | `sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/` |
| Force Recreate: If you want to force Compose to stop and recreate all containers, use the --force-recreate flag | `docker-compose -f /etc/docker-compose.yml up -d --force-recreate` |
| Auto start compose services | `crontab -e @reboot /usr/local/bin/docker-compose -f /etc/docker-compose.yml up -d Restart` |
| Docker GC using Sotify's image | `docker run --privileged --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc` |
| Image layer details/history | `docker history --no-trunc IMAGE_ID` |

| Description |  Detail |
| --- | --- |
| Anisble gather facts | `ansible IntS -kv -u root -m setup --tree /tmp/facts` |
| Execute a playbook in verbose mode | ` ansible-playbook -i /etc/ansible/hosts playbook.yml -vvv | tee installation-log.txt` |
| Skip tags example  | `ansible-playbook -kv -i INVENTORY_FILE_PATH -e "target=parent:children" --skip-tags "SKIPME" playbook.yml` |
| Execute tasks by tag | `ansible-playbook example.yml --tags "configuration,packages"` |


| Description |  Detail |
| --- | --- |
| Check firmware type i.e is it BIOS or UEFI | `dmesg | more` and `dmidecode | more` |
| SCSI re-scan | `ls /sys/class/scsi_host` and `echo "- - -" > /sys/class/scsi_host/host#/scan` |
| Check architecture | `uname -m` |
| List available locales | `locale -a` |
| Check current encoding | `locale charmap` |
| List available encodings | `locale -m` |
| Get PID of a process that has a handle on the file | `fuser FILE_NAME` |
| Force reboot | `systemctl --force --force reboot` |
| Files open by a specific process | `lsof -p PID` |
| Disk level I/O wait | `iostat -x 5 10` (Print stats every 5 seconds for 10 times) |
| Process level I/O wait | `iotop` |
| System level I/O wait | `top` |
| Sample useradd | `sudo /usr/sbin/useradd --create-home --home-dir /usr/local/username --shell /bin/bash username` |
| Change shell for a user | `chsh -s /bin/bash nginx` |
| Sort files and directories size and limit find depth to 2 | `find -maxdepth 2 -type d -exec du -sm {} \; | sort -nr` |
| List available shells | `cat /etc/shells` |
| SSH Tunnels - Local Port forwarding | `ssh -L local_port:remote_address:remote_port user@server.com` |
| SSH Tunnels - Remote Port forwarding | `ssh -R remote_port:local_address:local_port user@server.com` |
| SSH Tunnels - Dynamic Port forwarding | `ssh -D local_port username@server.com` |
| Show volumes on a NAS with exports | `showmount -e NAS_SERVER_NAME` |
| Binary zipping - Reduces size my more than 10 times! | `bzip2 -7 dockerd-core.1998` |
| Yum show duplicates | `yum --showduplicates list telnet` |
| Yum with disable repos | `yum update-minimal --security --disablerepo=rhel-7-server-ose-3.4-rpms` |
| Number of file descriptors/fd the kernel will allocate before choking | `cat /proc/sys/fs/file-max` |
| Copy out a portion of log file | `awk 'NR >= 57890000 && NR <= 57890010' /path/to/file` |
| Bulk find and replace within a file | `sed -i -e '/central.database =/ s/= .*/= new_value/' /path/to/file` |
| nohup details | Nohupping backgrounded jobs is typically used to avoid terminating them when logging off from a remote SSH session. A different issue that often arises in this situation is that ssh is refusing to log off ("hangs"), since it refuses to lose any data from/to the background job(s). This problem can also be overcome by redirecting all three I/O streams Example: `nohup ./myprogram > foo.out 2> foo.err < /dev/null &` Also note that a closing SSH session does not always send a HUP signal to depending processes. Among others, this depends on whether a pseudo-terminal was allocated or not. You can use screen for that. Just create a screen session with: `screen -S rsync` then, you detach your screen with CTRL+A and you can disconnect from SSH |
| Selinux check for exceptions and provide explanation | `cat /var/log/audit/audit.log* | audit2allow --explain` |
| Selinux get details | `sestatus` |
| Selinux go to enforcing | `setenforce 1` |
| Selinux go to permissive | `setenforce 0` |
| Selinux set boolean example | `setsebool -P httpd_can_network_connect 1` |
| Selinux get booleans | `getsebool -a | grep httpd` |
| Selinux get container selinux package versions | `rpm -qa *container*selinux*` |
| RHEL Atomic Vulnerability Scan | `atomic scan` |


| Description |  Detail |
| --- | --- |
| Compare branches - Shows a brief overview of all the commits that are in some-feature that are not in master. | `git log --oneline master..some-feature` |
| Delete local branch | `git branch -d <BRANCH_NAME>` |
| Rebase local branch - rebase option to avoid a superfluous “merge commit” | `git pull --rebase` |
| Show remote origin | `git remote show origin` |
| Set remote URL | `git remote set-url origin https://USER@github.com/scm/project/project.git` and `cat ./config` |
| Set git user name | `git config --global user.name "USER.NAME"` |
| Set git user mail | `git config --global user.email "USER.MAIL"` |
| Delete local branch | `git branch -d branch_name` |
| Delete remote branch | `git push origin --delete BRANCH_NAME` |
| Create new local branch and push to remote | `git checkout -b BRANCH_NAME` and `git push -u origin BRANCH_NAME` |
| List all *new or modified* files | `git status` |
| Show file differences that **haven't been** staged | `git diff` |



| Description |  Detail |
| --- | --- |
| Filter AD groups by name | `Get-ADGroup -Filter {name -like "*SEARCH_PATTERN*"} -Properties Description | Select Name,Description` |
| xmllint validation | `xmllint --valid --encode utf-8 Autounattend.xml` |
| xslt transformation | `xml tr test.xsl test.xml` |
| xml inplace editing | `xml ed --inplace -u "//ovf:VirtualSystem/ovf:OperatingSystemSection/ovf:Description" -v "THIS IS A TEST1" test.xml` |