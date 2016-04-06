#
# Cookbook Name:: chef_client
# Recipe:: default
#
# Copyright 2016, Gabriel Cardona
#
# License: GPL v2
#

# Run apt-get update
include_recipe 'apt'

# Install dependencies
node['chef_client']['source']['dependencies'].each do |dependency|
  package dependency
  
  # Run apt-get upgrade
  # package dependency do
  #   action :upgrade
  # end
end

# Add .vimrc file for root 
template '/.vimrc' do
  source 'vimrc.erb'
end

# Add .vimrc file for users
template '/etc/skel/.vimrc' do
  source 'vimrc.erb'
end

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

template '/etc/update-motd.d/00-header' do
  source '00-header.erb'
end

template '/etc/update-motd.d/10-help-text' do
  source '10-help-text.erb'
end

template '/etc/landscape/client.conf' do
  source 'landscape_client.conf.erb'
end

users_manage "sysadmin" do
  action [ :remove, :create ]
end

node.default['authorization']['sudo']['passwordless'] = true
include_recipe "sudo"

# Set up oh-my-zsh for my sandboxed user
include_recipe 'oh-my-zsh'

# Set up chef-server
include_recipe 'chef-server'

service "ssh" do
  action [:restart]
end

# reboot 'reboot the machine' do
#   action :request_reboot
#   reason 'Need to reboot when the run completes successfully.'
#   delay_mins 2
# end
