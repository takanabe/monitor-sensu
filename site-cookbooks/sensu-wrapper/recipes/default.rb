#
# Cookbook Name:: sensu-wrapper
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

include_recipe "sensu::default"

# puts node.to_hash.roles[0]
if node.name == "sensu-server" then
  include_recipe "sensu::redis"
  include_recipe "sensu::rabbitmq"

  sensu_handler "default" do
    type "pipe"
    command "ls"
  end
end

sensu_client node.name do
  address node['monitored-point']['ipaddress']
  subscriptions node.roles + ["all"]
end

# For check-log.rb plugin
directory "/var/cache" do
  owner "sensu"
  group "sensu"
  mode  0755
end

%w[
  check-cpu.rb
  check-log.rb
  check-memory-pcnt.sh
].each do |default_plugin|
  cookbook_file "/etc/sensu/plugins/#{default_plugin}" do
    source "plugins/#{default_plugin}"
    mode 0755
  end
end

if node.name == "sensu-server" then
  include_recipe "sensu::api_service"
  include_recipe "sensu-wrapper::checks"
  include_recipe "sensu::server_service"
end

node.set.sensu.use_embedded_ruby = true
include_recipe "sensu::client_service"
