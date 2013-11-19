#
# Cookbook Name:: other
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{vim-enhanced git}.each do |p| # <- 1
  package p do
    action :install
  end
end
