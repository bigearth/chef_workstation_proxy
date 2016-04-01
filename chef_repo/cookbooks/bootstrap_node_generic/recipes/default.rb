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
  # TODO  get zsh and oh-my-zsh working
  #shell "/usr/bin/zsh"
  shell "/bin/bash"
  supports manage_home: true
end

# install dependencies
node['bootstrap_node_generic']['source']['dependencies'].each do |dependency|
  package dependency do
    action :upgrade
  end
end

template '/.vimrc' do
  source 'vimrc.erb'
end
