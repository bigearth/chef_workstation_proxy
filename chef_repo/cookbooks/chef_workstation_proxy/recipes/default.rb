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
  # command "apt-get update && apt-get -y upgrade && apt-get -y install tmux wget vim tree ack-grep ntp git build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev libqrencode-dev htop bundler zsh git-core tig unzip autoconf pkg-config makepasswd transmission-common transmission-daemon transmission-remote-cli && wget https://raw.githubusercontent.com/cgcardona/dotfiles/master/.vimrc"
end
execute "apt-get -y upgrade" do
  command "apt-get -y upgrade"
end
execute "apt-get -y install tmux" do
  command "apt-get -y install tmux"
end
execute "apt-get -y install vim" do
  command "apt-get -y install vim"
  #command "apt-get -y install tree"
  #command "apt-get -y install ack-grep"
  #command "apt-get -y install ntp"
  #command "apt-get -y install git"
  #command "apt-get -y install build-essential"
  #command "apt-get -y install libssl-dev"
  #command "apt-get -y install libdb-dev"
  #command "apt-get -y install libdb++-dev"
  #command "apt-get -y install libboost-all-dev"
  #command "apt-get -y install libqrencode-dev"
  #command "apt-get -y install htop"
  #command "apt-get -y install bundler"
  #command "apt-get -y install zsh"
  #command "apt-get -y install git-core"
  #command "apt-get -y install tig"
  #command "apt-get -y install unzip"
  #command "apt-get -y install autoconf"
  #command "apt-get -y install pkg-config"
  #command "apt-get -y install makepasswd"
  #command "apt-get -y install transmission-common"
  #command "apt-get -y install transmission-daemon"
  #command "apt-get -y install transmission-remote-cli"
end
