#
# Cookbook Name:: bootstrap_node_generic
# Recipe:: default
#
# Copyright 2016, Gabriel Cardona
#
# License: GPL v2
#

# Run apt-get update
include_recipe 'apt'

# Install dependencies
node['bootstrap_node_generic']['source']['dependencies'].each do |dependency|
  package dependency
  # package dependency do
  #   action :upgrade
  # end
end

# Put .vimrc file in case I end up `ssh`ing in 
template '/.vimrc' do
  source 'vimrc.erb'
end

# Change `nano` to `vim` 
execute "sudo update-alternatives --set editor /usr/bin/vim.basic" do
end

template '/etc/adduser.conf' do
  source 'adduser.conf.erb'
end

template '/etc/ssh/sshd_config' do
  source 'sshd_config.erb'
end

template '/etc/issue.net' do
  source 'issue.net.erb'
end

service "ssh" do
  action [:restart]
end

# require 'digest/sha2'
# password = "pass@123"
# salt = rand(36**8).to_s(36)
# shadow_hash = password.crypt("$6$" + salt)
# # add user
# user node['bootstrap_node_generic']['user'] do
#   home node['bootstrap_node_generic']['source']['home']
#   password shadow_hash
#   supports manage_home: true
# end
