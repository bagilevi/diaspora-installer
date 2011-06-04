# Diaspora Installer

**Alpha software** expect trouble

This installation script will set up a Diaspora pod on a clean server. You have to
enter some basic information then the script will do the rest automatically.

The script uses
[diaspora-cookbook](https://github.com/bagilevi/diaspora-cookbook)
[Chef](http://wiki.opscode.com/display/chef/Home) cookbook and installs
it with [Chef Solo](http://wiki.opscode.com/display/chef/Chef+Solo).

## Installation

Get a new server or VPS with Ubuntu 10.04 (other versions might work, but were not tested)

Your local machine must have **SSH** and **Git** installed. (Tested on OS X)

You must have SSH access to the server through the default port (22) with
[public key authentication](http://www.google.co.uk/search?q=setting+up+public+key+authentication+over+ssh)
for root.

Get a domain name or subdomain for your pod or temporarily put it in your /etc/hosts
(or similar) file.

Optionally, get an SSL certificate for your domain and place the `example.com.crt`
and `example.com.key` files in the diaspora-setup directory. If these files are not
present, SSL will not be enabled. You can enable it later.

Run `install.sh` and enter the details.

**Server hostname**: the hostname or IP address you can access the server, don't
include any "http" or "/".

**Pod name**: what do you want to call your pod? E.g.: *London Diaspora*, *My-Seed*.

**Pod domain name**: domain name where users will be able to access the site

**Short name**: a short name that can be used in filenames, database names, etc.
It must start with a lowercase letter and must contain only lowercase letters,
numbers and underscores. E.g. *londondiaspora*, *myseed*.

If you're lucky you'll have a diaspora pod in about 20 minutes.

## Updating

`./run-chef-solo.sh`

This will package/upload all the cookbooks, upload `node.json`, upload
certificate files and enable SSL if the files are present (see above), and update
DIASPORA* to the latest version.

## Todo

* security
* data backup

## License

Author: Levente Bagi

Licensed under the
[GNU Affero General Public License Version 3](http://www.gnu.org/licenses/agpl-3.0.html).


