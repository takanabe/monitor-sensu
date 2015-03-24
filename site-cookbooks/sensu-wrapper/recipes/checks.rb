#
# Cookbook Name:: sensu-wrapper
# Recipe:: checks
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

template "check_cpu.json" do
    path "/etc/sensu/conf.d/check_cpu.json"
    owner "root"
    group "root"
    mode  "0644"
    source "checks/check_cpu.json.erb"
end

template "check-memory-pcnt.json" do
    path "/etc/sensu/conf.d/check-memory-pcnt.json"
    owner "root"
    group "root"
    mode  "0644"
    source "checks/check-memory-pcnt.json.erb"
end
#
template "check_log.json" do
    path "/etc/sensu/conf.d/check_log.json"
    owner "root"
    group "root"
    mode  "0644"
    source "checks/check_log.json.erb"
end
#
# template "checks_proc.json" do
#     path "/etc/sensu/conf.d/checks_proc.json"
#     owner "root"
#     group "root"
#     mode "0644"
#     source "checks_proc.json.erb"
# end
