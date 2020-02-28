## General Notes

### For Fastlane on Mac
Install Package Manager Toolset
brew install rbenv ruby-build

Look for Versions
rbenv install -l

Install a Specific Version
rbenv install 2.4.0

### Install and Use a Specific Version of Ruby on MAC using RVM
```
\curl -sSL https://get.rvm.io | bash -s stable --ruby
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
command curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
source ~/.zshrc

ζ /bin/bash --login                                                                                                                                                                                                                [0ea71f3]
kiran@machine$ rvm use ruby-2.6.3
Using /Users/kiran/.rvm/gems/ruby-2.6.3
kiran@machine$ which ruby
/Users/kiran/.rvm/rubies/ruby-2.6.3/bin/ruby
kiran@machine$ ruby -version
ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin18]
kiran@machine$  sudo gem install fastlane -NV
```
