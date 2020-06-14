## AWS APIGW Related Stuff

Get APIs which has a Specific Stage:
aws apigateway get-rest-apis | jq '[ .items[]? | select(.tags.STAGE = "prod") ]'

Same as above but Extract only the API Name and Id:
aws apigateway get-rest-apis | jq '[ .items[]? | select(.tags.STAGE = "prod") | {name: .name, id: .id} ]'

Get Resources which has Specific Methods exposed for a Given API
aws apigateway get-resources --rest-api-id XXXX | jq '[ .items[]? | select(.resourceMethods.POST or .resourceMethods.PATCH) ]'

Same as above but Extract only the Resource Path and Id:
aws apigateway get-resources --rest-api-id XXXX | jq '[ .items[]? | select(.resourceMethods.POST or .resourceMethods.PATCH) | {path: .path, id: .id} ]'

Get Names of API that have a Specific Stage
aws apigateway get-rest-apis | jq '[ .items[]? | select(.tags.STAGE = "prod") | .name ]'
