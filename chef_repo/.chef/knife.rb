current_dir              = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "#{ENV['CHEF_WORKSTATION_PROXY_NODE_NAME']}"
client_key               "#{current_dir}/#{ENV['CHEF_WORKSTATION_PROXY_CLIENT_KEY']}.pem"
validation_client_name   "#{ENV['CHEF_WORKSTATION_PROXY_VALIDATION_CLIENT_NAME']}"
validation_key           "#{current_dir}/#{ENV['CHEF_WORKSTATION_PROXY_VALIDATION_KEY']}.pem"
chef_server_url          "#{ENV['CHEF_WORKSTATION_PROXY_CHEF_SERVER_URL']}"
syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntaxcache"
cookbook_path            ["#{current_dir}/../cookbooks"]
cookbook_copyright       "Gabriel Cardona"
cookbook_email           "gabr13l@bigearth.io"
cookbook_license         "GPL v2"
knife[:editor]           = "/usr/bin/vim"
