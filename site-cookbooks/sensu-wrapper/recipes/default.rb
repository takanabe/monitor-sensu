#
# Cookbook Name:: sensu-wrapper
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

include_recipe "sensu"
include_recipe "sensu::redis"
include_recipe "sensu::rabbitmq"

sensu_handler "default" do
  type "pipe"
  command "ls"
end

sensu_client node.name do
  address node.ipaddress
  subscriptions node.roles + ["all"]
end

include_recipe "sensu::api_service"
include_recipe "sensu::client_service"
include_recipe "sensu::server_service"

