# General Topics

## GPL, AGPL and SaaS:
The GPL licenses are the most common open source licenses and generally the most problematic for companies developing software. SaaS companies are more free to use GPL licensed-code because the obligations of the GPL are triggered upon software distribution and SaaS software by nature is not distributed. In essence, the obligation to make source code available is triggered not just by distribution but also by allowing use over a network. These licenses are much less common than the GPL, but are still out there and are designed to plug what has been considered a **loophole** in the GPL.

*Triggering factor*
The difference between the GPL and the AGPL in relation to SaaS is that the triggering factor in the AGPL is not just by distribution, modification but also by allowing use over a network, while in the GPL the triggering factor for license enforcement is distribution.

## No License:
The other “license type” that SaaS companies should watch out for is no license. In the vast majority of audits we perform we find code that has been appropriated from the Internet, but with no clear license. The default of *copyright* law is that if it’s not your software and you don’t have permission (i.e. a license) you don’t have the right to use it.

## GPL and Distribution:
If a start-up is looking for an M&A exit in the future should consider how dependent they want their applications to be on GPL. They might have a vibrant SaaS business, but potential buyers may be interested in also offering an on-premises version. (IBM, for example, seems to look for this routinely.) The more dependent your offering is on GPL-licensed code, the harder it will be to make it distributable. 

## Cloud Poaching Avoidance:

### MongoDB:
It introduced a new Server Side Public License (SSPL), to apply to it's MongoDB Community Server. However, unlike the other "solutions" to cloud poaching, MongoDB is attempting to retain the open source nature of the project by not outlawing the use of Community Server as an online service and instead stating conditions that must be met in order to deploy projects licensed under the SSPL as a service.

What SSPL means - "A company that offers a publicly available MongoDB as a service must open source the software it uses to offer such service, including the management software, user interfaces, application program interfaces, automation software, monitoring software, backup software, storage software, and hosting software, all such that a user could run an instance of the service using the source code made available.""

### Confluent:
Confluent came up with a new license - Confluence Community License to tackle Cloud Poaching. 

Ex:Say that you are building a SaaS Hotel Booking Engine and you want to include KSQL in the implementation of that offering. Of course you can do that, this service does not compete with any Confluent product that “provides the software”. Note that this would be true, even if in the future Confluent had its own hotel booking product (not likely!). The excluded purpose for KSQL is limited to competition with Confluent’s SaaS offering of KSQL.

Apache Kafka is licensed under Apache 2.0. The license change only applies to our Confluent software that was previously called “Confluent Open Source”: Confluent Schema Registry, Confluent REST Proxy, Confluent KSQL and some Confluent Connectors.

*Why not AGPL ?*
AGPL doesn’t solve the problem we are trying to fix. *AGPL allows cloud service providers to sell services using the exact software being licensed, and charge for it, without any limitation.* This means the software developer has become the unpaid developer and maintainer for the cloud service provider—which is not a scenario we want to enable.

Also, AGPL is too aggressive for our customers who need to redistribute commercial products.  If you put AGPL code in a distributed program, you have to open source the whole program. We want you to be able to embed our code in proprietary applications, change it and not worry about open sourcing any of your changes.

*Why not Commons Clause ?*
Commons Clause is an approach that adds an *anti-SaaS provision to existing open source licenses*, which can make interpreting the license confusing.

So the new license comes with a *Excluded Purpose* which specifically handles the public cloud dynamic
```
“Excluded Purpose” is making available any software-as a-service, platform-as-a-service, infrastructure-as-a-service or other similar online service that competes with Confluent products or services that provide the Software.
```

### Redis:
Redis Modules from the AGPL to a licensing scheme that combines Apache 2.0 with the Commons Clause. As per, Redis co-founder - Redis is doing this, "for two reasons -- to limit the monetization of these advanced capabilities by cloud service providers like AWS and to help enterprise developers whose companies do not work with AGPL licenses."

Redis' creator, added the change just "means that basically certain enterprise add-ons, instead of being completely closed source as they could be, will be available with a more permissive license," Commons Clauses with Apache.


### Neo4J:
Neo4j added the Commons Clause to the AGPL license that had previously covered the software.

## Commons Clause
The Commons Clause, according to its authors, is a license addendum that allows *all permissions of the original license to remain except the ability to 'sell' the software.* That exception, however, means that the clause effectively becomes the software license, reducing the underlying license to guideline status and changing the nature of the project from "open source" to "source available" (a term used by the clause's authors). 

## EULA
EULA only gives you the right to use and no other rights like rights to Download Source, Modification, Distribution etc.
