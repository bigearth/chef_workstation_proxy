default['bootstrap_node_generic']['user'] = 'big_earth'
default['bootstrap_node_generic']['source']['home'] = "/home/#{node['bootstrap_node_generic']['user']}"
default['bootstrap_node_generic']['source']['dependencies'] = [
  'build-essential', 'autoconf', 'libssl-dev', 'libboost-dev', 'pkg-config',
  'libboost-chrono-dev', 'libboost-filesystem-dev', 'libboost-program-options-dev',
  'libboost-system-dev', 'libboost-test-dev', 'libboost-thread-dev', 'libtool',
  'tmux', 'vim', 'tree', 'ack-grep', 'ntp', 'git', 'libdb-dev', 'libdb++-dev', 'libboost-all-dev',
  'libqrencode-dev', 'htop', 'bundler', 'zsh', 'git-core', 'tig', 'unzip', 'makepasswd',
  'transmission-common', 'transmission-daemon', 'transmission-remote-cli']
