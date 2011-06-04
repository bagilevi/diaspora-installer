#!/bin/sh


echo
echo "== DIASPORA SETUP =="
echo
echo "Refer to the README.md for details."
echo "If you need to cancel, press CTRL+C."
echo
read -p "Server hostname: " SERVER
read -p "Login user: " USER
read -p "Pod name: " POD_NAME
read -p "Pod domain name: " POD_DOMAIN
read -p "Short name: " SITE_NAME
echo

MYSQL_ROOT_PASSWORD=`env LC_CTYPE=C tr -dc "a-zA-Z0-9" < /dev/urandom | head -c 32`
MYSQL_DIASPORA_PASSWORD=`env LC_CTYPE=C tr -dc "a-zA-Z0-9" < /dev/urandom | head -c 32`
RAILS_SECRET_TOKEN=`env LC_CTYPE=C tr -dc "0-9a-f" < /dev/urandom | head -c 80`

if [ -f $POD_DOMAIN.crt -a -f $POD_DOMAIN.key ]; then
  ENABLE_SSL=true
else
  ENABLE_SSL=false
fi

mkdir upload

echo "{
  \"mysql\": {
    \"server_root_password\": \"$MYSQL_ROOT_PASSWORD\"
  },
  \"diaspora\": {
    \"pod_name\": \"$POD_NAME\",
    \"domain\": \"$POD_DOMAIN\",
    \"site_name\": \"$SITE_NAME\",
    \"platform\": \"production\",
    \"enable_ssl\": $ENABLE_SSL,
    \"database\": {
      \"database\": \"${SITE_NAME}_production\",
      \"password\": \"$MYSQL_DIASPORA_PASSWORD\"
    },
    \"repository\": \"git://github.com/diaspora/diaspora.git\",
    \"rails_secret_token\": \"$RAILS_SECRET_TOKEN\"
  },
  \"run_list\": [ \"recipe[diaspora]\" ]
}
" > upload/node.json

ssh $USER@$SERVER 'echo "
file_cache_path \"/var/chef-solo\"
cookbook_path \"/var/chef-solo/cookbooks\"
" > ~/solo.rb'

./init-chef-repo.sh

scp init-server.sh $USER@$SERVER:init-server.sh
ssh $USER@$SERVER 'chmod +x init-server.sh; ./init-server.sh'

./run-chef-solo.sh $USER $SERVER

