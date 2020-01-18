## General
To initialise a empty node project
npm init -y

npm start
This runs an arbitrary command specified in the package’s "start" property of its "scripts" object. 
If no "start" property is specified on the "scripts" object, it will run node server.js.

npm install
This command installs a package, and any packages that it depends on. If the package has a package-lock or shrinkwrap file, the installation of dependencies will be driven by that.

## NPM Repo Config
```
1. rm ~/.npmrc
2. npm config set strict-ssl false
3. npm config set email admin@company.com
4. npm config set registry https://nexus.company.com/repository/npm-virtual/
5. npm login --registry=https://nexus.company.com/repository/npm-private/
user: wwarnpmuser
you should get something like - Logged in as wwarnpmuser on https://nexus.company.com/repository/npm-private/.
6. npm login --registry=https://nexus.company.com/repository/npm-virtual/
user: wwarnpmuser
you should get something like - Logged in as wwarnpmuser on https://nexus.company.com/repository/npm-virtual/.
7. mkdir sampleApp && cd sampleApp
8. npm init -y
9. touch index.js
10. vi package.json (to update publish config as below)
"publishConfig": {
"registry": "https://nexus.company.com/repository/npm-private/"
},
11. npm install
12. npm publish
```

## Registry and Package Related

To view version history of a package from registry
npm view tulsi-node@1.1.6 or npm view tulsi-node

To view dependencies of a package
npm view tulsi-node@1.1.6 dependencies

To view a package version history
npm view tulsi-node versions

To install a package in Global Context
npm update -g serverless-webpack

To install a package into local node_modules
npm update serverless-webpack

Publish a NPM Package
npm publish --registry http://company.nexus.com/repository/npm-private/

NPM Config Examples
npm config set email admin@company.com
npm config set strict-ssl false - (Dont do this!! do npm config set cafile ~/Downloads/nexusCACert.pem instead)

