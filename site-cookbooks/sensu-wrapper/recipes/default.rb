#
# Cookbook Name:: sensu-wrapper
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

include_recipe "sensu::default"

# puts node.to_hash.roles[0]
print "beforeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\n"
print  node.name
print  node['name'] == "sensu-server"

if node.name == "sensu-server" then
  print "insideeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
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

if node.name == "sensu-server" then
  include_recipe "sensu::api_service"
  include_recipe "sensu::server_service"
end

include_recipe "sensu::client_service"
