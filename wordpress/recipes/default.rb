#
# Cookbook Name:: wordpress
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "/tmp/#{node['wordpress']['file_name']}" do
	source "http://ja.wordpress.org/#{node['wordpress']['file_name']}"
end

node['wordpress']['setting'].each do |setting|
	execute "install-wordpress" do
		command "tar zxvf /tmp/#{node['wordpress']['file_name']} -C /tmp/ && mkdir -p /var/www/html/#{setting[:domain]} && mv /tmp/wordpress/* /var/www/html/#{setting[:domain]} && chown -R apache:apache /var/www/html/#{setting[:domain]}"
	not_if { File.exists?("/var/www/html/#{setting[:domain]}") }
	end
end

#
# Settings
#
node['wordpress']['setting'].each do |setting|
	template "/tmp/#{setting[:domain]}_wordpress-SQL.txt" do
		source "SQL.erb"
		owner "root"
		group "root"
		mode "0600"

		variables({
			:wp_db   => setting[:db_name],
			:wp_user => setting[:db_user],
			:wp_password => setting[:db_password],
		})
	end

	bash "sql-wordpress" do
		code <<-EOC
		mysql -u root < /tmp/#{setting[:domain]}_wordpress-SQL.txt
		EOC
	end

	template "/var/www/html/#{setting[:domain]}/wp-config.php" do
		source "wp-config.php.erb"
		owner "root"
		group "root"
		mode "0644"

		variables({
			:wp_db   => setting[:db_name],
			:wp_user => setting[:db_user],
			:wp_password => setting[:db_password],
		})
	end

	template "/etc/httpd/conf.d/#{setting[:domain]}.conf" do
		source "vhost.conf.erb"
		owner "root"
		group "root"
		mode "0644"

		variables({
			:domain   => setting[:domain],
		})
	end

	log "please install" do
		message "please install http://#{setting[:domain]}/wp-admin/install.php "
		level :info
	end
end


#
# service
#
service "httpd" do
	action [ :enable , :restart ]
end