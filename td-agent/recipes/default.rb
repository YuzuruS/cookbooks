#
# Cookbook Name:: td-agent
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "td.repo" do
    path "/etc/yum.repos.d/td.repo"
    source "td.repo.erb"
    mode 0644
end

%w{td-agent}.each do |p| # <- 1
    package p do
      action :install
    end
end

template "td-agent.conf" do
    path "/etc/td-agent/td-agent.conf"
    source "td-agent.conf.erb"
    mode 0644
end

execute "chmod-apache-log" do
    command "chmod -R 755 /var/log/httpd"
end

service "td-agent" do # <- 2
    action [:restart, :enable]
end