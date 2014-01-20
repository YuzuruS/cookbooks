#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{httpd}.each do |p| # <- 1
  package p do
    action :install
  end
end

template "httpd.conf" do
    path "/etc/httpd/conf/httpd.conf"
    source "httpd.conf.erb"
    mode 0644
end

service "httpd" do # <- 2
    supports :restart=>true, :reload=>false, :status=>true
    action [:restart, :enable]
end
