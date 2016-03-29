#
# Cookbook Name:: chef_workstation_proxy
# Recipe:: default
#
# Copyright 2016, Gabriel Cardona
#
# License: GPL v2
#

execute "apt-get update" do
  command "apt-get update"
end

execute "apt-get -y upgrade" do
  command "apt-get -y upgrade"
end

execute "apt-get -y install tmux" do
  command "apt-get -y install tmux"
end

execute "apt-get -y install vim" do
  command "apt-get -y install vim"
end

execute "apt-get -y install tree" do
  command "apt-get -y install tree"
end

execute "apt-get -y install ack-grep" do
  command "apt-get -y install ack-grep"
end

execute "apt-get -y install ntp" do
  command "apt-get -y install ntp"
end

execute "apt-get -y install git" do
  command "apt-get -y install git"
end

execute "apt-get -y install build-essential" do
  command "apt-get -y install build-essential"
end

execute "apt-get -y install libssl-dev" do
  command "apt-get -y install libssl-dev"
end

execute "apt-get -y install libdb-dev" do
  command "apt-get -y install libdb-dev"
end

execute "apt-get -y install libdb++-dev" do
  command "apt-get -y install libdb++-dev"
end

execute "apt-get -y install libboost-all-dev" do
  command "apt-get -y install libboost-all-dev"
end

execute "apt-get -y install libqrencode-dev" do
  command "apt-get -y install libqrencode-dev"
end

execute "apt-get -y install htop" do
  command "apt-get -y install htop"
end

execute "apt-get -y install bundler" do
  command "apt-get -y install bundler"
end

execute "apt-get -y install zsh" do
  command "apt-get -y install zsh"
end

execute "apt-get -y install git-core" do
  command "apt-get -y install git-core"
end

execute "apt-get -y install tig" do
  command "apt-get -y install tig"
end

execute "apt-get -y install unzip" do
  command "apt-get -y install unzip"
end

execute "apt-get -y install autoconf" do
  command "apt-get -y install autoconf"
end

execute "apt-get -y install pkg-config" do
  command "apt-get -y install pkg-config"
end

execute "apt-get -y install makepasswd" do
  command "apt-get -y install makepasswd"
end

execute "apt-get -y install transmission-common" do
  command "apt-get -y install transmission-common"
end

execute "apt-get -y install transmission-daemon" do
  command "apt-get -y install transmission-daemon"
end

execute "apt-get -y install transmission-remote-cli" do
  command "apt-get -y install transmission-remote-cli"
end

template '/.vimrc' do
  source 'vimrc.erb'
end
