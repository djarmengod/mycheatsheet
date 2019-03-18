# Elasticsearch Deployment options on AWS

## AWS - Amazon ElasticSerach Service

1. Amazon Elasticsearch Service domains are Elasticsearch clusters created using the Amazon Elasticsearch Service console, CLI, or API.
2. Each domain is an Elasticsearch cluster in the cloud with the compute and storage resources you specify. 
3. You can create and delete domains, define infrastructure attributes, and control access and security. 
4. You can run one or more Amazon Elasticsearch Service domains.
5. You can create multiple Elasticsearch indices within the same Amazon Elasticsearch Service domain. 
6. You can configure dedicated master nodes for your domains.
7. Slow logs are managed at a Index level - Use settings for a specific index to enable or disable slow logs for it. Enable slow logs only during troubleshooting.
8. Error logs are exposed for the entire domain it cannot be enabled or disabled at an index level. 
9. Amazon Elasticsearch Service currently supports in-place version upgrade for domains with Elasticsearch versions 5.x and above. 
10. Your domain remains available throughout the upgrade process i.e No downtime.
11. Once the in-place version upgrade has been triggered, you cannot make changes to your domain configuration until the upgrade completes or fails. You can continue reading and writing data while the upgrade is in progress. 
12. The version upgrade process automatically takes a snapshot of the system and only starts the actual upgrade if the snapshot succeeds.
13. If you need to downgrade to an older version, you must take a snapshot of your upgraded domain and restore it to a domain that uses the older Elasticsearch version.
14. If Encryption at rest is enabled, all of your data stored at rest in the underlying storage systems are encrypted, including primary and replica indices, log files, memory swap files, and automated S3 snapshots. 
15. Amazon Elasticsearch Service handles encryption and decryption seamlessly, so you don’t have to modify your application to access your data. 
16. Amazon Elasticsearch Service provides support for HTTPS for encrypting communications between the client and the domain endpoint. 
17. You can enable node-to-node encryption to get an additional layer of security by implementing TLS for all communications between instances in the Elasticsearch domain.
18. Node-to-node encryption ensures that any data you send to your Amazon Elasticsearch Service domain over HTTPS remains encrypted in-flight while it is being distributed and replicated between the nodes.
19. All certificates are deployed and rotated automatically throughout the life of the domain, without any additional operational overhead.
20. You can have Internet or VPC access. 
21. VPC access - IP addresses from your VPC are attached to your Amazon Elasticsearch Service domain and all network traffic stays within the AWS network and is not accessible to the Internet. Moreover, you can use security groups and IAM policies to restrict access to your Amazon Elasticsearch Service domains.
22. You can also use IAM-based policies to provide fine-grained access control to which IAM roles can perform administrative tasks, use the Elasticsearch APIS and have access to the resources in the domain down to the index-level.
23. Internet endpoints are publicly accessible. If you select public access, you should secure your domain with an access policy that only allows specific users or IP addresses to access the domain.
24. Amazon Elasticsearch Service automates common administrative tasks, such as performing backups, monitoring instances and patching software.
25. Scaling your Amazon Elasticsearch Service domain by adding or modifying instances, and storage volumes is an online operation that does not require any downtime.

## From Elastic

