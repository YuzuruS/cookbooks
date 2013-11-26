#
# Cookbook Name:: other
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{vim-enhanced git sl}.each do |p| # <- 1
  package p do
    action :install
  end
end

#execute "oh-my-zsh-install" do
#  command "git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh; cp /home/vagrant/.zshrc /home/vagrant/.zshrc.orig; cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc; chsh -s /bin/zsh"
#end
