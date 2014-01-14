#
# Cookbook Name:: mysql55
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
remote_file "/tmp/#{node['mysql']['file_name']}" do
  source "#{node['mysql']['remote_uri']}"
end

bash "install_mysql" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar xf "#{node['mysql']['file_name']}"
    rm "#{node['mysql']['file_name']}"
  EOH
end

node['mysql']['rpm'].each do |rpm|
  package rpm[:package_name] do
    action :install
    provider Chef::Provider::Package::Rpm
    source "/tmp/#{rpm[:rpm_file]}"
  end
end

chef_gem "mysql" do
  action :nothing
  subscribes :install, "package[MySQL-devel]", :immediately
end

template "/usr/my.cnf" do
  user 'root'
  group 'root'
  mode 644
  source 'my.cnf.erb'

  variables ({
    :server_charset                  => node['mysql']['server_charset'],
    :max_connections                 => node['mysql']['max_connections'],
    :query_cache_size                => node['mysql']['query_cache_size'],
    :table_cache_size                => node['mysql']['table_cache_size'],
    :thread_cache_size               => node['mysql']['thread_cache_size'],
    :join_buffer_size                => node['mysql']['join_buffer_size'],
    :sort_buffer_size                => node['mysql']['sort_buffer_size'],
    :read_rnd_buffer_size            => node['mysql']['read_rnd_buffer_size'],
    :innodb_file_per_table           => node['mysql']['innodb_file_per_table'],
    :innodb_data_file_path           => node['mysql']['innodb_data_file_path'],
    :innodb_autoextend_increment     => node['mysql']['innodb_autoextend_increment'],
    :innodb_buffer_pool_size         => node['mysql']['innodb_buffer_pool_size'],
    :innodb_additional_mem_pool_size => node['mysql']['innodb_additional_mem_pool_size'],
    :innodb_write_io_threads         => node['mysql']['innodb_write_io_threads'],
    :innodb_read_io_threads          => node['mysql']['innodb_read_io_threads'],
    :innodb_log_buffer_size          => node['mysql']['innodb_log_buffer_size'],
    :innodb_log_file_size            => node['mysql']['innodb_log_file_size'],
    :innodb_flush_log_at_trx_commit  => node['mysql']['innodb_flush_log_at_trx_commit']
  })
end
