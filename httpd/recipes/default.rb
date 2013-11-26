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
  action [:start, :enable]
end

execute "synb-ln" do
  command "ln -s /vagrant/schoolwith_v2 /var/www/html"
  not_if { ::File.exists?("/var/www/html/schoolwith_v2")}
end
