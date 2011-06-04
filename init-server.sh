#!/bin/sh

mkdir /var/chef-solo

sudo apt-get update
sudo apt-get install -y ruby ruby-dev libopenssl-ruby rdoc ri irb build-essential wget ssl-cert

cd /tmp
wget http://production.cf.rubygems.org/rubygems/rubygems-1.7.2.tgz
tar xzvf rubygems-1.7.2.tgz
cd rubygems-1.7.2
sudo ruby setup.rb --no-format-executable

sudo gem install chef ohai --no-ri --no-rdoc




