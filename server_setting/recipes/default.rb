#
# Cookbook Name:: server_setting
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "resolv.conf" do
    path "/etc/resolv.conf"
    source "resolv.conf.erb"
    mode 0644
end

template "iptables" do
    path "/etc/sysconfig/iptables"
    source "iptables.erb"
    mode 0600
end

service "iptables" do # <- 2
    supports :status => true, :restart => true
    action [:restart, :enable]
end