default['chef_client']['source']['home'] = "/home/#{node['chef_client']['user']}"
default['chef_client']['source']['dependencies'] = [ 
  'build-essential', 'autoconf', 'tmux', 'vim', 'tree', 
  'ack-grep', 'ntp', 'git', 'htop', 'bundler', 'zsh', 'tig',
  'libdb-dev', 'libdb++-dev', 'libboost-all-dev', 'libqrencode-dev', 
  'git-core', 'unzip', 'makepasswd', 'transmission-common', 
  'transmission-daemon', 'transmission-remote-cli'
]
