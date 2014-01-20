#
# Cookbook Name:: command
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{vim-enhanced git sl}.each do |p| # <- 1
  package p do
    action :install
  end
end