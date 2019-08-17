# General Notes

Example here is with [certbot-dns-route53](https://certbot-dns-route53.readthedocs.io/en/stable/) plugin. Here, LetsEncrypt provisions a txt record in the specified hosted zone to authenticate ownership of the domain before issuing certificate.

## Set-up
```
sudo wget -r --no-parent -A 'epel-release-*.rpm' http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/
sudo rpm -Uvh dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-*.rpm
sudo yum-config-manager --enable epel*
sudo yum install -y python-pip certbot
sudo pip install certbot-dns-route53
```

## IAM Permissions
IAM Instance Profile attached to the host for authorizing certbot to perform Route53 tasks.
```
{
    "Version": "2012-10-17",
    "Id": "certbot-dns-route53 sample policy",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "route53:ListHostedZones",
                "route53:GetChange"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect" : "Allow",
            "Action" : [
                "route53:ChangeResourceRecordSets"
            ],
            "Resource" : [
                "arn:aws:route53:::hostedzone/YOURHOSTEDZONEID"
            ]
        }
    ]
}
```

## CLI Man Page
Man page [certbot man page](https://certbot.eff.org/docs/using.html#certbot-command-line-options)

## Sample Execution
1. Agree to Terms and Conditions on CLI
2. Don't share your e-mail address with EFF (default:None)
```
[root@ip-10-192-20-51 ~]# certbot certonly --dns-route53 --dns-route53-propagation-seconds 30 -d test1.rhanzgps.net --no-eff-email --agree-tos
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator dns-route53, Installer None
Obtaining a new certificate
Performing the following challenges:
dns-01 challenge for test1.rhanzgps.net
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/test1.rhanzgps.net/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/test1.rhanzgps.net/privkey.pem
   Your cert will expire on 2019-11-15. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

[root@ip-10-192-20-51 ~]#
```
