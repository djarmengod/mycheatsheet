# Auth0 Deploy Automation
Auth0 deploy automation is Pull based so no need to bake/configure auth0 credentials in CI/CD tooling.. Requires Auth0 Source Control Extensions..this approach drives us down the path of having a dedicated git repo per auth0 tenant..

## Bitbucket Example
https://auth0.com/docs/extensions/bitbucket-deploy

Configure extension on Auth0 with Bitbucket webhook details. Once you have set up the webhook in Bitbucket using the provided information, you are ready to start committing to your repository.

With each commit you push to your configured Bitbucket repository, the webhook will call the extension to initiate a deployment if changes were made to one of these folders:

```
clients
grants
emails
resource-servers
connections
database-connections
rules-configs
rules
pages
```
