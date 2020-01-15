## Rebuild

### Backup
1. SSH Keys
2. Credentials (if any) - Ex: AWS, Docker credentials
3. ~/.zshrc

### Tools
#### vmap - Virtual Memory Map of process - Details of writeable and non-writeable regions of memeory for a given process 
```
vmmap --wide PID
```


### Install following from brew
```
brew install python3
brew install pipenv
brew install jq
brew install terraform
brew install tree
brew install watch
brew install node
brew install homebrew/apache/ab
brew install minikube
brew install aws-iam-authenticator
brew install gradle
```
### Install Java
```
Ex: AdoptOpenJDK will install into /Library/Java/JavaVirtualMachines/

Then set JAVA_HOME as follows: Example here is for Java8
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8-openj9.jdk/Contents/Home
```
### Install Kube Tools
```
Kubectl Debug:
brew install aylei/tap/kubectl-debug

Ksync:
curl https://ksync.github.io/gimme-that/gimme.sh | bash
```

### Install iterm
### Configure bash aliases
### Install Postman
### Install tmux - brew install tmux
### Install git - brew install git
### For gcloud its a dmg
### For awscli its a download and install
```
pip3 install awscli --upgrade --user
python -m pip install --user boto3
pip install cfn_flip
```
### For Azure - brew update && brew install azure-cli

### Install Visual Studio
```
unzip VSCode-darwin-stable.zip
mv Visual\ Studio\ Code.app /Applications
```


## Homebrew
Another active Homebrew update process is already in progress.
```
rm -rf /usr/local/var/homebrew/locks
```

## Magnify Portions of a Screen
```
CMD+OPT+8 to Toggle On and Off
CMD+OPT++ to magnify
CMD+OPT+- to minimise
```
