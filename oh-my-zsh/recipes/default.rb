#
# Cookbook Name:: private
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# oh-my-zshのインストール
git "/home/vagrant/.oh-my-zsh" do
	repository "git://github.com/robbyrussell/oh-my-zsh.git"
	reference "master"
	action :checkout
	user "vagrant"
	group "vagrant"
end

execute "backup-zsh" do
	user "vagrant"
	group "vagrant"
	command "mv /home/vagrant/.zshrc /home/vagrant/.zshrc.org"
	only_if { ::File.exists?("/home/vagrant/.zshrc")}
end

execute "set-zsh" do
	user "vagrant"
	group "vagrant"
	command "cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc"
end

bash "Set vagrant's shell to zsh" do
	code <<-EOT
	chsh -s /bin/zsh vagrant
	EOT
	not_if 'test "/bin/zsh" = "$(grep vagrant /etc/passwd | cut -d: -f7)"'
end