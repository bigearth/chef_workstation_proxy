module BigEarth 
  module Blockchain 
    module Knife 
      class Bootstrap
        def bootstrap fqdn = '', config = ''
          puts "FQDN #{fqdn}, CONFIG #{config}"
          flavor = config['options']['flavor']
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife bootstrap #{fqdn} -x root -A -P password --sudo --use-sudo-password -N #{config['title'].tr(' ', '_')} -r 'recipe[bootstrap_node_generic], recipe[bitcoin::bitcoin_#{flavor}]'"
        end
        
        def bootstrap_windows_ssh fqdn = '', options = ''
          system "cd  #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife bootstrap windows ssh #{fqdn} #{options}"
        end
        
        def bootstrap_windows_winrm fqdn = '', options = ''
          system "cd  #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife bootstrap windows winrm #{fqdn} #{options}"
        end
        
        # TODO move chef_client from this class
        def chef_client 
          system "cd ~/chef_workstation_proxy/chef_repo && ssh root@#{@data['ipv4_address']} 'sudo chef-client'"
        end
      end
    end
  end
end