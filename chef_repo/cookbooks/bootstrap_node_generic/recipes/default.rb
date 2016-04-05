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
  
  # Run apt-get upgrade
  # package dependency do
  #   action :upgrade
  # end
end

include_recipe "git"

git "/root/.oh-my-zsh" do
  repository node['bootstrap_node_generic'][:repository]
  user 'root'
  reference "master"
  action :sync
end

template "/root/.zshrc" do
  source "zshrc.erb"
  owner 'root'
  mode "644"
  action :create_if_missing
  variables({
    user: 'root',
    theme: 'robbyrussell',
    case_sensitive: false,
    plugins: %w(git)
  })
end

# Add .vimrc file for root 
template '/.vimrc' do
  source 'vimrc.erb'
end

# Add .vimrc file for users
template '/etc/skel/.vimrc' do
  source 'vimrc.erb'
end

# Add .z files for user

# Change `nano` to `vim` 
execute "sudo update-alternatives --set editor /usr/bin/vim.basic" do
end

# Update adduser.conf to change DSHELL
template '/etc/adduser.conf' do
  source 'adduser.conf.erb'
end

# Update sshd_config to change
# TODO Update docs here
template '/etc/ssh/sshd_config' do
  source 'sshd_config.erb'
end

template '/etc/issue.net' do
  source 'issue.net.erb'
end

users_manage "sysadmin" do
  action [ :remove, :create ]
end

node.default['authorization']['sudo']['passwordless'] = true
include_recipe "sudo"

service "ssh" do
  action [:restart]
end

# reboot 'reboot the machine' do
#   action :request_reboot
#   reason 'Need to reboot when the run completes successfully.'
#   delay_mins 2
# end
