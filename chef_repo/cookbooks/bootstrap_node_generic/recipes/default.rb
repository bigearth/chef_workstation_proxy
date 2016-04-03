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

# add user
user node['bootstrap_node_generic']['user'] do
  home node['bootstrap_node_generic']['source']['home']
  password password_shadow_hash
  # shell "/usr/bin/zsh"
  shell "/bin/bash"
  supports manage_home: true
end

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
