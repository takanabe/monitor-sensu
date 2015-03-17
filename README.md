# Monitor Sensu
This repository is to build the monitoring system with Sensu.

# Required Environment
* Ubuntu14.04
* Chef-client 11.14 or later

# About Vagrantfile
Vagrantfile exists to develop and test this reposository in local environment

# Installation
```
$cd ./examples/ssl
$ ./ssl_certs.sh generate
$mkdir ../../data_bags/sensu
$cp ssl.json ../../data_bags/sensu
$vagrant up
$vagrant ssh-config --host=sensu-server >> ~/.ssh/config
$vagrant ssh-config --host=sensu-client >> ~/.ssh/config
$knife solo vagrant@sensu-server
$knife solo vagrant@sensu-client
```
# Access to Uchiwa
* Open a browser you like
* Access to 192.168.33.10:3000
* Sign in with username&password
 * user:admin
 * pass:supersecret

# Remaining Task
* ssh login without key and password(only ec2-user)
 * it seems to be a waste of time when I use this repository for local dev env
