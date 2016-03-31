module BigEarth 
  module Blockchain 
    module Knife 
      class Bootstrap
        def initialize data
          @data = data
        end
        
        def bootstrap
          flavor = @data['flavor']
          system "cd ~/chef_workstation_proxy/chef_repo && knife bootstrap #{@data['ipv4_address']} -x root -A -P password --sudo --use-sudo-password -N #{@data['title'].tr(' ', '_')} -r 'recipe[bootstrap_node_generic], recipe[bitcoin::bitcoin_#{flavor}]'"
        end
        
        def chef_client 
          system "cd ~/chef_workstation_proxy/chef_repo && ssh root@#{@data['ipv4_address']} 'sudo chef-client'"
        end
      end
    end
  end
end
