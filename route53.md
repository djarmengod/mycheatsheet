## General Notes

### Delegating responsibility for the subdomain
To do a delegation for a sub domain you need only create NS records for the sub in the parent's zone.

#### Scenario: Parent Domain and Subdomains in separate AWS accounts
1. test.com in AccountA
2. sub.test.com in Account B
3. Create Hosted Zones for sub.test.com in Account B
4. Update test.com hosted zone in Account A with the NS records for sub.test.com from Account B - "Delegating responsibility for the subdomain" 

