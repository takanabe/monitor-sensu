# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "sensu-server" do |server|
    server.vm.provider "virtualbox" do |v|
      v.name = "sensu-server"
    end
    # Please change any boxes you want to use
    server.vm.box = "ubuntu14_04"
    server.vm.hostname = "sensu-server"
    server.vm.network "private_network", ip: "192.168.33.10"

    # Auto provisioning setting
    # server.vm.provision :shell, path: "bootstrap.sh"

    server.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = ["./site-cookbooks","./cookbooks"]
      chef.data_bags_path = "./data_bags"
      chef.add_recipe "local-users"
      chef.add_recipe "openssh"
      chef.add_recipe "local-sudo"

      # Set attribute to overide sshd_config
      chef.json = {
        "openssh" => {
          "server" => {
            "permit_empty_passwords" => "yes",
            "use_p_a_m" => "no"
          }
        }
      }
    end

  end

  config.vm.define "sensu-client1" do |client1|
    client1.vm.provider "virtualbox" do |v|
      v.name = "sensu-client1"
    end
    # Please change any boxes you want to use
    client1.vm.box = "ubuntu14_04"
    client1.vm.network "private_network", ip: "192.168.33.11"
    client1.vm.hostname = "sensu-client1"

    # Auto provisioning setting
    # client1.vm.provision :shell, path: "bootstrap.sh"

    client1.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = ["./site-cookbooks","./cookbooks"]
      chef.data_bags_path = "./data_bags"
      chef.add_recipe "local-users"
      chef.add_recipe "openssh"
      chef.add_recipe "local-sudo"

      # Set attribute to overide sshd_config
      chef.json = {
        "openssh" => {
          "server" => {
            "permit_empty_passwords" => "yes",
            "use_p_a_m" => "no"
          }
        }
      }
    end

  end

  config.vm.define "sensu-client2" do |client2|
    client2.vm.provider "virtualbox" do |v|
      v.name = "sensu-client2"
    end
    # Please change any boxes you want to use
    client2.vm.box = "ubuntu14_04"
    client2.vm.network "private_network", ip: "192.168.33.12"
    client2.vm.hostname = "sensu-client2"

    # Auto provisioning setting
    # client2.vm.provision :shell, path: "bootstrap.sh"

    client2.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = ["./site-cookbooks","./cookbooks"]
      chef.data_bags_path = "./data_bags"
      chef.add_recipe "local-users"
      chef.add_recipe "openssh"
      chef.add_recipe "local-sudo"

      # Set attribute to overide sshd_config
      chef.json = {
        "openssh" => {
          "server" => {
            "permit_empty_passwords" => "yes",
            "use_p_a_m" => "no"
          }
        }
      }
    end
  end

end
