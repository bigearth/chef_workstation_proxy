default['chef_client']['source']['home'] = "/home/#{node['chef_client']['user']}"
default['chef_client']['source']['dependencies'] = [
  'build-essential', 'autoconf', 'libssl-dev', 'libboost-dev', 'pkg-config',
  'libboost-chrono-dev', 'libboost-filesystem-dev', 'libboost-program-options-dev',
  'libboost-system-dev', 'libboost-test-dev', 'libboost-thread-dev', 'libtool',
  'tmux', 'vim', 'tree', 'ack-grep', 'ntp', 'git', 'libdb-dev', 'libdb++-dev', 'libboost-all-dev',
  'libqrencode-dev', 'htop', 'bundler', 'zsh', 'git-core', 'tig', 'unzip', 'makepasswd',
  'transmission-common', 'transmission-daemon', 'transmission-remote-cli']
