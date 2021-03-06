# Diaspora Installer

**Alpha software!** Expect trouble.

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

Get the installer, if you haven't yet, and cd to the directory:

    git clone https://github.com/bagilevi/diaspora-installer.git
    cd diaspora-installer

Run:

    ./install.sh

and enter the details:

**Server hostname**: the hostname or IP address you can access the server, don't
include any "http" or "/".

**Login user**: username to use for SSH-ing into the server (E.g. `root`)

**Pod name**: what do you want to call your pod? E.g.: *London Diaspora*, *My-Seed*.

**Pod domain name**: domain name where users will be able to access the site

**Short name**: a short name that can be used in filenames, database names, etc.
It must start with a lowercase letter and must contain only lowercase letters,
numbers and underscores. E.g. *londondiaspora*, *myseed*.

If you're lucky you'll have a diaspora pod in about 20 minutes.

## Updating

To update to the latest DIASPORA* version, run:

    ./run-chef-solo.sh LOGIN_USER SERVER_HOST_NAME

## SSL

To enable SSL (Secure HTTP):

1. get an SSL certificate
2. place the `example.com.crt` and `example.com.key` files in the `diaspora-installer/upload` directory (create it if it doesn't exist)
3. edit `upload/node.json` and change `enable_ssl` to "true"
4. `./run-chef-solo.sh LOGIN_USER SERVER_HOST_NAME`

## Customizing Diaspora

To customize something in the code, fork the
[main repository](https://github.com/diaspora/diaspora/), and change
`repository` in `upload/node.json` to your own repository URL.

Refer to the [DIASPORA* Wiki](https://github.com/diaspora/diaspora/wiki)
for details.

## Bugs

To report bugs, please use the
[issue tracker](https://github.com/bagilevi/diaspora-installer/issues).

If you know the problem is in the cookbook, then use the
[diaspora-cookbook issue
tracker](https://github.com/bagilevi/diaspora-cookbook/issues).

## To do

* security
* data backup

## License

Author: Levente Bagi

Licensed under the
[GNU Affero General Public License Version 3](http://www.gnu.org/licenses/agpl-3.0.html).


