alias ocnp='oc login domainname:8443 --username=username'
alias ocp='oc login domainname:8443 --username=username'

# General Objects
alias nodes='oc get nodes'

alias projects='oc get projects'

alias pods='oc get pods -o wide --all-namespaces'
alias devpods='oc get pods -o wide --all-namespaces | grep integration-dev'
alias qatpods='oc get pods -o wide --all-namespaces | grep integration-qat'
alias prepods='oc get pods -o wide --all-namespaces | grep integration-preprod'

alias services='oc get svc -o wide --all-namespaces'
alias routes='oc get routes -o wide --all-namespaces'
alias dcs='oc get dc --all-namespaces -o wide'
alias rcs='oc get rc --all-namespaces -o wide'
alias bcs='oc get bc --all-namespaces -o wide'
alias builds='oc get builds --all-namespaces -o wide'
alias configmaps='oc get configmap --all-namespaces -o wide'
alias endpoints='oc get endpoints --all-namespaces -o wide'
alias groups='oc get groups'
alias secrets='oc get secrets --all-namespaces'


# Pods per node
alias podspernode='/Users/kiranya/Documents/MLC/Scripts/Bash/podsPerNode.sh'


# Cluster Health
alias ocpch='etcdctl -C https://master1:2379,https://master2:2379,https://master3:2379 --ca-file=/etc/origin/master/master.etcd-ca.crt --cert-file=/etc/origin/master/master.etcd-client.crt --key-file=/etc/origin/master/master.etcd-client.key cluster-health'
alias ocpml='etcdctl -C https://master1:2379,https://master2:2379,https://master3:2379 --ca-file=/etc/origin/master/master.etcd-ca.crt --cert-file=/etc/origin/master/master.etcd-client.crt --key-file=/etc/origin/master/master.etcd-client.key member list'

# Member List
ocnpch='etcdctl -C https://master1:2379,https://master2:2379,https://master3:2379 --ca-file=/etc/origin/master/master.etcd-ca.crt --cert-file=/etc/origin/master/master.etcd-client.crt --key-file=/etc/origin/master/master.etcd-client.key cluster-health'
ocnpml='etcdctl -C https://master1:2379,https://master2:2379,https://master3:2379 --ca-file=/etc/origin/master/master.etcd-ca.crt --cert-file=/etc/origin/master/master.etcd-client.crt --key-file=/etc/origin/master/master.etcd-client.key member list'

alias jira='open -a "Google Chrome" https://jira.domain.io/browse/'
alias conf='open -a "Google Chrome" https://confluence.domain.io/'
alias snow='open -a "Google Chrome" https://domain.service-now.com/'
alias bamb='open -a "Google Chrome" https://bamboo.domain.io'
alias bitb='open -a "Google Chrome" https://bitbucket.domain.io'
alias arti='open -a "Google Chrome" https://artifactory.domain.io'
alias ocnpu='open -a "Google Chrome" https://domainname:8443/'
alias ocpu='open -a "Google Chrome" https://domainname:8443/'

alias op='/usr/local/bin/op.sh'
alias snopen='/usr/local/bin/op.sh snow'
alias sopen='/usr/local/bin/op.sh snow'
alias jopen='/usr/local/bin/op.sh jira'


alias wsk='/Users/kiranya/Documents/Personal/wskcli/wsk'
alias ms=/usr/local/bin/minishift
alias tf='terraform'
