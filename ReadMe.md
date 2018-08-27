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
| Add CA at Machine level into nss db | `curl -k URL_TO_DOWNLOAD_PEM > /etc/pki/ca-trust/source/anchors/FILE_NAME && update-ca-trust && certutil -A -d /etc/pki/nssdb -n 'NAME OF THE CA' -t CT,C,C -a -i /etc/pki/ca-trust/source/anchors/FILE_NAME.pem` | `certutil -machine -accept Certchain.p7b` |
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
| Generate random password | For base64 based `openssl rand -base64 10` and for hexa-decimal based `openssl rand -hex 10` |
| NPM ignore ssl warnings/errors | `npm config set strict-ssl false` |

| Description |  Detail |
| --- | --- |
| IP Patterns | `0.0.0.0/0` - All IPv4 addresses, `::0/0` - All IPv6 addresses, `::1` - for localhost in ipv6, `0.0.0.0:80` - On any network interface on port 80 |
| Find external IP address | `curl -kLvvv https://ifconfig.co/json` |
| Open up a TCP socket and listen for connections | `nc -l 192.168.2.1 3000` |
| Packet capture from within Network namespace  |  `nsenter -t PID -n tcpdump -i any -s0 -nn -A -w /tmp/appName.pcap and port 443`, `nsenter -t PID -p tcpdump -i any -s0 -A -nn host IP_ADDRESS`, `nsenter -t PID -n tcpdump -i any -s0 -nn -A host IP_ADDRESS -w /tmp/appName.pcap and port 443`, `nsenter -t PID -n tcpdump -i any -s0 -nn -A host IP_ADDRESS -w /tmp/appName.pcap and port 8080`, `nsenter -t PID -n tcpdump -i any -nn -R http -2`, `nsenter -t PID -n tcpdump -i any -nn -R dns -2`, `nsenter -t PID -n tcpdump -i any -nn -R ssl -2`, `nsenter -t PID -n tshark -i any -nn -R 'http.request.method == "GET" || http.request.method == "HEAD" || http.request.method == "POST" || http'`, `nsenter -t PID -n tshark -i any -nn -R 'tcp.analysis.retransmission or tcp.analysis.fast_retransmission'`,`nsenter -t PID -n tshark -i any -nn host -A -s0 127.0.0.1 and port 8081` |
| Find out which network interface to internet. Same can be used to find a route to a particular host. | `route get 8.8.8.8` |
| Display the authoritative (primary) name server | Use the -type=soa option  ex: `nslookup -type=soa google.com` |


Use the -type=soa option to tell nslookup to display the authoritative (primary) name server.



| Description |  Detail |
| --- | --- |
| Scale a service within docker-compose | `docker-compose -f /etc/docker-compose.yml scale chrome=10` |
| Install docker-compose | `sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/` |
| Force Recreate: If you want to force Compose to stop and recreate all containers, use the --force-recreate flag | `docker-compose -f /etc/docker-compose.yml up -d --force-recreate` |
| Auto start compose services | `crontab -e @reboot /usr/local/bin/docker-compose -f /etc/docker-compose.yml up -d Restart` |
| Docker GC using Sotify's image | `docker run --privileged --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc` |
| Image layer details/history | `docker history --no-trunc IMAGE_ID` |
| Send a specific Kill signal to a container | `docker kill -s SIGKILL containerName` |
| Deleting all containers | `docker rm $(docker ps -aq)` |
| Stop all containers | `docker stop $(docker ps -q)` |
| Delete all images including intermediate ones | `docker rmi -f $(docker images -q)` |
| To remove an image which has multiple tags - here all the tags and the image itself will be removed. | `docker rmi --force ` |
| Dockerfile declare instructions to be executed when building a child image. | Use `ONBUILD` instruction |
| List all Privileged containers. | `for name in `docker ps | awk '{print $NF}'`; do echo "$name --> $(docker inspect $name | grep -i Privileged)";  done` |





| Description |  Detail |
| --- | --- |
| Anisble gather facts | `ansible IntS -kv -u root -m setup --tree /tmp/facts` |
| Execute a playbook in verbose mode | `ansible-playbook -i /etc/ansible/hosts playbook.yml -vvv PIPE tee installation-log.txt` |
| Skip tags example  | `ansible-playbook -kv -i INVENTORY_FILE_PATH -e "target=parent:children" --skip-tags "SKIPME" playbook.yml` |
| Execute tasks by tag | `ansible-playbook example.yml --tags "configuration,packages"` |



| Description |  Detail |
| --- | --- |
| List AZ's for a given region ex: For us-east-2 | `aws ec2 describe-availability-zones --region us-east-2` |
| List regions | `aws ec2 describe-regions` |
| List buckets | `aws s3api list-buckets` | 
| List AMI id's from a region | Owners = 309956199498 is the account ID used to show Red Hat images `aws ec2 describe-images --owners 309956199498 --query 'Images[*].[CreationDate,Name,ImageId]' --filters "Name=name,Values=RHEL-7.?*GA*" --region us-east-2 --output table | sort -r` |

| Description |  Detail |
| --- | --- |
| Drain a node | `oc adm drain <node1> <node2>` |
| List Elasticsearch Indices | `oc exec POD_NAME -- es_util --query /_cat/indices` |
| List Elasticsearch Aliases | `oc exec POD_NAME -- es_util --query /_cat/aliases` |
| Scale a deployment config | `oc scale dc DC_NAME --replicas=N` |
| Update timeout at a route leve | `oc annotate route ROUTE_NAME --overwrite haproxy.router.openshift.io/timeout=180s` |
| Debug into a deployment config | `oc debug dc/DC_NAME` |
| Force edit a label | `oc label node NODE_NAME --overwrite key=value` |
| Mark nodes are schedulable or not | `oc adm manage-node NODE_NAME  --schedulable=true` or `oc adm manage-node NODE_NAME  --schedulable=false` |
| Force delete a pod | `oc delete pod --grace-period=0 --force --namespace NAMESPACE_NAME POD_NAME` |
| Sync Users via LDAP dry run | `oadm groups sync --sync-config=ldap_group_sync.yml` |
| Sync Users via LDAP | `oadm groups sync --sync-config=ldap_group_sync.yml --confirm` |
| etcd cluster health | `etcdctl -C https://etcd1:2379,https://etcd2:2379,https://etcd3:2379 --ca-file=/etc/origin/master/master.etcd-ca.crt --cert-file=/etc/origin/master/master.etcd-client.crt --key-file=/etc/origin/master/master.etcd-client.key cluster-health` |
| etcd member list | `etcdctl -C https://etcd1:2379,https://etcd2:2379,https://etcd3:2379 --ca-file=/etc/origin/master/master.etcd-ca.crt --cert-file=/etc/origin/master/master.etcd-client.crt --key-file=/etc/origin/master/master.etcd-client.key member list` |
| Filter nodes by selector | `oc get nodes --selector="logging-infra-fluentd=true"` |
| Open vSwitch dump flows | `ovs-ofctl -O OpenFlow13 dump-flows br0` |
| Get endpoints across the cluster | `oc get endpoints --all-namespaces -o wide` |
| Get all Router IP addresses | `oc get pods --all-namespaces --selector=router --template='{{range.items}}HostIP: {{.status.hostIP}} PodIP: {{.status.podIP}}{{"\n"}}{{end}}'` |
| Add cluster role to a user group | `oadm policy add-cluster-role-to-group cluster-admin USERGROUP_NAME` |
| Get Elasticsearch Indices | `oc exec -n logging ES_PODNAME -- curl -s   --cacert /etc/elasticsearch/secret/admin-ca   --cert /etc/elasticsearch/secret/admin-cert   --key /etc/elasticsearch/secret/admin-key   https://localhost:9200/_cat/indices` |
| Remove role from a user | `oadm policy remove-role-from-user cluster-admin USER_NAME` |
| Remove cluster role from a user | `oadm policy remove-cluster-role-from-user admin USER_NAME` |
| Open vSwitch list bridges | `ovs-vsctl list-br` |
| Open vSwitch Dump ports | `ovs-ofctl -O OpenFlow13 dump-ports-desc br0` |
| Get host and pod IP | `oc get pods --selector=docker-registry --template='{{range .items}}HostIP: {{.status.hostIP}}   PodIP: {{.status.podIP}}{{end}}{{"\n"}}'` |
| Pruning old deployments | `oadm prune deployments --confirm` or `oc adm prune deployments --confirm` |
| Get Quotas for a namespace | `oc get quota` |
| Get Limits for a namespace | `oc get limits` |
| Delete user | `oc delete USER_NAME` - remove cluster role bindings for the user, remove namespaced role bindings for the user, remove the user from any sccs, remove the user from any groups, remove the user but leave identities for the user |
| Delete Identity | `oc delete identity USER_NAME` |
| Delete group | `oc delete group GROUP_NAME` - remove cluster role bindings for the group, remove namespaced role bindings for the group, remove the group from any sccs, remove the group|
| Delete using selector | `oc delete templates --selector="metrics-infra"` or `oc delete all --selector="metrics-infra"` |
| Get using selector | `oc get all --selector="metrics-infra"` |
| Get cluster level events | `oc get events -w` |
| Follow logs of a Container within a POD | `oc logs -f POD_NAME -c CONTAINER_NAME` |
| Get all persistent volume claims - Reports Bind Status, Capacity, AccessModes and Volume info | `oc get pvc --all-namespaces` |
| Get Persistent Volumes across the cluster - Reports PV Name, Capacity, Access Modes, Reclaim Policy, Status, Claim Name| `oc get pv` |
| Edit objects| `oc edit = oc get -o + oc apply (if we save)` |
| oc rsh | It uses Openshift Master API to create a secure tunnel to the remote pod and does not require ssh or the rsh unix commands. |
| oc cp | requires the container image to provide tar as it copies entire directory by default and if tar isnt available the command fails. |
| oc patch dc/dcname | Patching a DC results in automatic re-deployment of Pods. |
| To use VSCode as the editor when you do edits with kubectl | `export KUBE_EDITOR="code"` |
| Join Projects | `oc adm pod-network join-projects --to=master-project sub-project` |
| Isolate Projects | `oc adm pod-network isolate-projects project1 project2` |
| Global projects - In the above example, all the pods and services in project1 and project2 can now access any pods and services in the cluster and vice versa. | `oc adm pod-network make-projects-global project1 project2` |
| Idling a service - all idling right now is manual. OCP will never automatically idle a service + Idle the service -- Request comes in -- Service gets activated -- Service remains activated until we Idle it again.| `oc idle svc/myservice` |
| Granting roles to users and service accounts | OCP allows you to grant roles to users and serviceaccounts that do not exist yet. |
| oc describe | `oc describe` can follow relationships ex: Describe on bc will display recent builds where are "oc get -o" wont be able to do this. |
| SCC - Security Context Constrains | SCC control what actions a Pod can perform on which resources. |
| Deployment config enable trigger | `oc set triggers dc/dcname --from-config` |
| Deployment config disable trigger | `oc set triggers dc/dcname --from-config remove` |
| Process a template and output objects in a text format | `oc process -f TEMPLATE.yml` |
| Process a template and create resources | `oc process -f FILENAME| oc create -f -` |
| Process a template and create resources with custom parameter values | `oc process -f my-rails-postgresql -p POSTGRESQL_USER=bob -p POSTGRESQL_DATABASE=mydatabase | oc create -f -` |
| Process a template based on param values from a file | `oc process -f my-rails-postgresql --param-file=postgres.env` |
| Manual build | `oc start-build bc/BCNAME` |
| Manual deploy | `oc rollout dc/DCNAME` |
| Exposing a service on a particular domain name | `oc expose svc/SERVIC_NAME --hostname test.example.com.au` |
| Default behavior wrt to domain name during service exposure | `{SERVICENAME}-{PROJECTNAME}.{ROUTINGSUBDOMAIN}` |
| Readiness and Liveness probes are applied to the DC. | This will help with various deployment options esp for Stateful workloads |
| Get all objects with a particular label | `oc get all -l app=nodejs-ex` |
| Build from a specific branch | `oc new-app GITURL#BRANCHNAME` |
| Specify a builder image that needs to be used for building this app | `oc new-app nodejs:8~GITURL` |
| Print the resource definitions that will be created | `oc new-app -o json GITURL --name SAMPLEAPP > sampleapp_defn.json` |
| Set triggers from CLI | `oc set triggers dc/frontend --from-image=myproject/origin-ruby-sample:latest -c helloworld` |
| To cancel the build which is running or pending in the queue. | `oc cancel-build NAME` - This terminates the build pod (if running) so no new image is pushed and no deployment is triggered. |
| Create a new ImageStream with all the labels attached to the image from a insecure registry | `oc import-image NEW_IS --confirm --insecure --from registry.example.com:5000/myimage --all` |
| Update an image stream and image stream tags based on values from an external registry | `oc import-image` - This results in image change events which could trigger the linked Builds and/or Deployments that refer to this image stream.|
| Roll back a deployment | `oc rollout undo dc/DCNAME` - The DC template will be reverted to match the deployment revision specified in the undo command, and a new replication controller will be started.|
| To re-enable the image change triggers | `oc set triggers dc/DCNAME --auto` - Image change triggers on the DC are disabled as part of the rollback to prevent accidentally starting a new deployment process immediately after the rollback is complete.|

| Description |  Detail |
| --- | --- |
| Check firmware type i.e is it BIOS or UEFI | `dmesg \| more` and `dmidecode \| more` |
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
| Sort files and directories size and limit find depth to 2 | `find -maxdepth 2 -type d -exec du -sm {} \; \| sort -nr` |
| List available shells | `cat /etc/shells` |
| SSH Tunnels - Local Port forwarding | `ssh -L local_port:remote_address:remote_port user@server.com` |
| SSH Tunnels - Remote Port forwarding | `ssh -R remote_port:local_address:local_port user@server.com` |
| SSH Tunnels - Dynamic Port forwarding | `ssh -D local_port username@server.com` |
| Show volumes on a NAS with exports | `showmount -e NAS_SERVER_NAME` |
| Binary zipping - compresses to a great extent! | `bzip2 -7 dockerd-core.1998` |
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
| Set remote URL | `git remote set-url origin https://USER@github.com/scm/project/project.git` and `cat ./config` and `git remote -v`|
| Set git user name | `git config --global user.name "USER.NAME"` |
| Set git user mail | `git config --global user.email "USER.MAIL"` |
| Delete local branch | `git branch -d branch_name` |
| Delete remote branch | `git push origin --delete BRANCH_NAME` |
| Create new local branch and push to remote | `git checkout -b BRANCH_NAME` and `git push -u origin BRANCH_NAME` |
| List all *new or modified* files | `git status` |
| Show file differences that **haven't been** staged | `git diff` |
| To unstage a file which was staged for commit | `git reset HEAD somewhere/somefile.someextension` - File goes back to being not staged for commit|
| Show files in a commit | `git show --pretty="" --name-only c1035fdddc1d7eb4486c2ac9733fc15943362cce` |

| Description |  Detail |
| --- | --- |
| Filter AD groups by name | `Get-ADGroup -Filter {name -like "*SEARCH_PATTERN*"} -Properties Description | Select Name,Description` |
| xmllint validation | `xmllint --valid --encode utf-8 Autounattend.xml` |
| xslt transformation | `xml tr test.xsl test.xml` |
| xml inplace editing | `xml ed --inplace -u "//ovf:VirtualSystem/ovf:OperatingSystemSection/ovf:Description" -v "THIS IS A TEST1" test.xml` |

| Description |  Detail |
| --- | --- |
| Enable protocol specific functions in HP Performance Center Load Generator | `<Load Generator install>\merc_asl\*.asl where * signifies the relevant protocol. To add a new function to the lists of allowed functions for a Load Generator, add a new line to the relevant protocol list file containing the function name with an appended = character as follows: <function_name>=` |
| Enable general C function or Specific Load Runner function in HP Performance Center Load Generator | `For general LoadRunner (lr) or C functions append the function with an equal sign on a new line to the end of the file "lrun_api.asl". Example: To add a function called "fopen", add the following to the end of the file "lrun_api.asl": fopen=` |


| Description |  Detail |
| --- | --- |
| List databases along with their tablespace names | `\l+` |
| List users | `\du` |
| List schemas | `\dn` |
| List tables | `\dt` |
| Find database size | `SELECT pg_size_pretty( pg_database_size('jira') );` |
| Create Role | `CREATE USER "INSERT_USERNAME" WITH LOGIN ENCRYPTED PASSWORD 'INSERT_PASSWORD' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION VALID UNTIL 'infinity';` |
| Create DB with custom encoding and collation | `CREATE DATABASE "INSERT_DBNAME" WITH OWNER = "INSERT_DBOWNER" ENCODING = 'UTF8' LC_COLLATE = 'en_AU.UTF-8' LC_CTYPE = 'en_AU.UTF-8' TABLESPACE = pg_default CONNECTION LIMIT = 40;` |
| Grant Connect | `GRANT SELECT ON ALL TABLES IN SCHEMA public TO INSERT_USERNAME;` |
| Identify the collation type for each database | `select datname, datcollate from pg_database;` |
| Pause DB replication | `select pg_xlog_replay_pause()` |
| Resume DB replication | `select pg_xlog_replay_resume()` |
| Dump/Export database | `pg_dump --host PgSQLDumpDB.dbHostIP --port PgSQLDumpDB.dbListenPort --username PgSQLDumpDB.dbUserName --no-password --format plain --blobs --verbose  --file=../output/+PgSQLDumpDB.dbName+_dbDump_original.sql PgSQLDumpDB.dbName` |
| List schemas | `\dn` |
| List schemas | `\dn` |





