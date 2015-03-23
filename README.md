# Monitor Sensu
This repository is to build the monitoring system with Sensu.

# Requirement
* Vagrant box file(Ubuntu14.04)
* Chef-client 11.14 or later
* knife solo

# About Vagrantfile
Vagrantfile exists to develop and test this reposository in local environment. So you have to change a name of Ubuntu box to `ubuntu14_04` or Vagrantfile.

# Installation
```
git clone https://github.com/takanabe/monitor-sensu.git
berks vendor cookbooks
cd ./examples/ssl
 ./ssl_certs.sh generate
mkdir ../../data_bags/sensu
cp ssl.json ../../data_bags/sensu
vagrant up
vagrant ssh-config --host=sensu-server >> ~/.ssh/config
vagrant ssh-config --host=sensu-client1 >> ~/.ssh/config
knife solo bootstrap vagrant@sensu-server --bootstrap-version 11.16.4
knife solo bootstrap vagrant@sensu-client1 --bootstrap-version 11.16.4

```
if you add more clients, please do same as above.
```
vagrant ssh-config --host=sensu-client2 >> ~/.ssh/config
knife solo bootstrap vagrant@sensu-client2 --bootstrap-version 11.16.4
```
# Edit check script
To monitor your log file, edit command field included in `site-cookbooks/sensu-wrapper/templates/default/checks/check_log.json.erb`

For example, if you want chack the logfile named `test` whether it include the word "WARN", please edit the file like follows:

```
{
  "checks": {
    "check_log": {
      "handlers": [
        "default"
      ],
        "command": "/etc/sensu/plugins/check-log.rb -f /var/test -r -q WARN",
        "interval": 60,
        "subscribers": ["all"]
    }
  }
}
```

# Access to Uchiwa
* Open a browser you like
* Access to 192.168.33.10:3000
* Sign in with username&password
 * user:admin
 * pass:supersecret

# Remaining Tasks
* ssh login without key and password(only ec2-user)
 * it seems to be a waste of time when I use this repository for local dev env
* Read `check logging` and simplify its code, because the code is complicated for new users.
