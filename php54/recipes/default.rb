#
# Cookbook Name:: php54
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w(php54 php54-gd php54-mbstring php54-pecl-xdebug php54-curl php54-mcrypt php54-mysql php54-devel php54-cli php54-common php54-xml).each do |package|
  yum_package package do
    action :install
  end
end

execute "phpunit-install" do
  command "pear config-set auto_discover 1; pear install pear.phpunit.de/PHPUnit"
  not_if { ::File.exists?("/usr/bin/phpunit")}
end

execute "composer-install" do
  command "curl -sS https://getcomposer.org/installer | php ;mv composer.phar /usr/local/bin/composer"
  not_if { ::File.exists?("/usr/local/bin/composer")}
end

execute "phpdoc-install" do
  command "pear channel-discover pear.phpdoc.org; pear install phpdoc/phpDocumentor"
  not_if { ::File.exists?("/usr/bin/phpdoc")}
end
