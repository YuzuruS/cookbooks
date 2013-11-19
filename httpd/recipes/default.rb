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

service "httpd" do # <- 2
  action [:start, :enable]
end
