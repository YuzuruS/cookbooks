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

execute "set-zsh" do
	command "mv /home/vagrant/.zshrc /home/vagrant/.zshrc.org"
	only_if { ::File.exists?("/home/vagrant/.zshrc")}
	command "/home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc"
end