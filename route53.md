## General Notes

### Delegating responsibility for the subdomain
Subdomains in separate accounts ex:
1. test.com in AccountA
2. sub.test.com in Account B
3. Create Hosted Zones for sub.test.com in Account B
4. Update test.com hosted zone in Account A with the NS records for sub.test.com from Account B - "Delegating responsibility for the subdomain" 

