#
# Cookbook Name:: phpmyadmin
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'wget' do
    action :install
end

rpmforge_file = "rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm"

execute 'get rpmforge packege' do
    cwd '/tmp'
    command "wget http://pkgs.repoforge.org/rpmforge-release/#{ rpmforge_file }"
    not_if { ::File.exists?("/tmp/#{ rpmforge_file }") }
end

rpm_package "#{ rpmforge_file }" do
    action :install
    source "/tmp/#{ rpmforge_file }"
end

package 'phpmyadmin' do
    action :install
end

execute "phpmyadmin-install" do
    command "ln -s /usr/share/phpMyAdmin /var/www/html"
    not_if { ::File.exists?("/var/www/html/phpMyAdmin")}
end

template "phpMyAdmin.conf" do
    path "/etc/httpd/conf.d/phpMyAdmin.conf"
    source "phpMyAdmin.conf.erb"
    mode 0644
    variables ({
      :domain => node['phpmyadmin']['domain']
      })
end

template "config.inc.php" do
    path "/etc/phpMyAdmin/config.inc.php"
    source "config.inc.php.erb"
    mode 0644
end

service "httpd" do # <- 2
    supports :restart=>true, :reload=>false, :status=>true
    action [:restart, :enable]
end