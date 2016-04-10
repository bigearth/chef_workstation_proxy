#
# Cookbook Name:: bitcoin
# Attributes:: default
#

# common settings

default['bitcoin']['user'] = "#{ENV['CHEF_WORKSTATION_PROXY_BITCOIN_USERNAME']}"
default['bitcoin']['checkblocks'] = 288 # NOTE: this is the default, you might want to decrease it with very low-end CPUs to get fast boot time

# 'bitcoin_core' recipe

default['bitcoin']['source']['version'] = '0.12.0'
default['bitcoin']['source']['checksum'] = '18a88785748588bb90764dc7f0aad5548da880d4d91f5803c7076cbcadb2959e'
default['bitcoin']['source']['service_wrapper'] = "bitcoind"
default['bitcoin']['source']['home'] = "/home/#{node['bitcoin']['user']}"
default['bitcoin']['source']['prefix'] = "/usr/local"
default['bitcoin']['source']['bitcoind'] = "#{node['bitcoin']['source']['prefix']}/bin/bitcoind"
default['bitcoin']['source']['bitcoin-cli'] = "#{node['bitcoin']['source']['prefix']}/bin/bitcoin-cli"
default['bitcoin']['source']['configure_options'] = "--disable-wallet --without-gui --prefix=#{node['bitcoin']['source']['prefix']}"
default['bitcoin']['source']['make_options'] = "-j#{node['cpu']['total']}"
default['bitcoin']['source']['dependencies'] = [
  'build-essential', 'autoconf', 'libssl-dev', 'libboost-dev', 'pkg-config',
  'libboost-chrono-dev', 'libboost-filesystem-dev', 'libboost-program-options-dev',
  'libboost-system-dev', 'libboost-test-dev', 'libboost-thread-dev', 'libtool',
  'libboost-all-dev', 'libprotobuf-dev', 'protobuf-compiler', 'libqt4-dev', 
  'libqrencode-dev', 'libevent-dev'] 
