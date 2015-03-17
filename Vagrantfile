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
    server.vm.network "private_network", ip: "192.168.33.10"

    # server.vm.provision "chef_solo" do |chef|
    #   chef.cookbooks_path = ["./site-cookbooks","./cookbooks"]
    #   chef.data_bags_path = "./data_bags"
    #   chef.add_recipe "users"
    #   chef.add_recipe "openssh"
    #
    #   # Set attribute to overide sshd_config
    #   chef.json = {
    #     "openssh" => {
    #       "server" => {
    #         "permit_empty_passwords" => "yes"
    #       }
    #     }
    #   }
    #
    # end

  end

  config.vm.define "sensu-client" do |client|
    client.vm.provider "virtualbox" do |v|
      v.name = "sensu-client"
    end
    # Please change any boxes you want to use
    client.vm.box = "ubuntu14_04"
    client.vm.network "private_network", ip: "192.168.33.11"
  end

end
