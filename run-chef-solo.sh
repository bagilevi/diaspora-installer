USER=$1
SERVER=$2

echo "Packaging cookbooks..."
tar czf upload/cookbooks.tar.gz -C chef-repo cookbooks

cd upload

echo "Uploading cookbooks..."
scp cookbooks.tar.gz $USER@$SERVER:cookbooks.tar.gz

echo "Uploading configuration..."
scp node.json $USER@$SERVER:node.json

if [ "$(find . -name *.crt -depth 1 | wc -l)" -gt 0 ]; then
  echo "Uploading SSL certificate files..."
  ssh $USER@$SERVER 'mkdir -p /etc/apache2/ssl'
  for f in *.crt; do
    scp $f $USER@$SERVER:/etc/apache2/ssl/$f
  done
  for f in *.key; do
    scp $f $USER@$SERVER:/etc/apache2/ssl/$f
  done
fi

cd ..

echo "Unpacking cookbooks on the server..."
ssh $USER@$SERVER 'cd /var/chef-solo; sudo tar xzf ~/cookbooks.tar.gz'

echo "Running chef-solo on the server..."
ssh $USER@$SERVER 'sudo chef-solo -c ~/solo.rb -j ~/node.json'

