
echo "Downloading clean chef-repo..."
git clone git://github.com/opscode/chef-repo.git
cd chef-repo
mkdir -p tmp/cookbooks
cd tmp/cookbooks

echo "Downloading cookbook tarballs..."
curl -O http://s3.amazonaws.com/opscode-community/cookbook_versions/tarballs/322/original/apache2.tgz
curl -O http://s3.amazonaws.com/opscode-community/cookbook_versions/tarballs/763/original/apt.tgz
curl -O http://s3.amazonaws.com/opscode-community/cookbook_versions/tarballs/668/original/build-essential.tgz
curl -O http://s3.amazonaws.com/opscode-community/cookbook_versions/tarballs/366/original/git.tgz
curl -O http://s3.amazonaws.com/opscode-community/cookbook_versions/tarballs/631/original/java.tgz
curl -O -L https://github.com/downloads/bagilevi/mysql-cookbook/mysql.tgz
curl -O http://s3.amazonaws.com/opscode-community/cookbook_versions/tarballs/765/original/openssl.tgz
curl -O http://s3.amazonaws.com/opscode-community/cookbook_versions/tarballs/387/original/redis.tgz
curl -O http://s3.amazonaws.com/opscode-community/cookbook_versions/tarballs/523/original/runit.tgz

git clone https://github.com/bagilevi/diaspora-cookbook.git ../../cookbooks/diaspora

cd ../../cookbooks

echo "Unpacking cookbook tarballs..."
for i in ../tmp/cookbooks/*.tgz; do tar xzf $i; done

cd ../..

