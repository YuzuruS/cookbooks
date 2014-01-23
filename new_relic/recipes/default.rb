#
# Cookbook Name:: new_relic
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash 'install_and_activate_newrelic' do
  not_if 'rpm -qa | grep newrelic-sysmond'
  code <<-EOC
    sudo rpm -Uvh http://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm
    sudo yum install -y newrelic-sysmond newrelic-php5
    sudo nrsysmond-config --set license_key=#{node[:newrelic_license_key]}
    sudo /etc/init.d/newrelic-sysmond start
    sudo /sbin/chkconfig newrelic-sysmond on
    sudo sed -ie "s/REPLACE_WITH_REAL_KEY/#{node[:newrelic_license_key]}/g" /etc/php.d/newrelic.ini
    sudo /etc/init.d/httpd graceful
  EOC
end
