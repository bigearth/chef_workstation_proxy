module BigEarth 
  module Blockchain 
    module Knife 
      class Bootstrap
        def bootstrap fqdn = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife bootstrap #{fqdn} #{options}"
        end
        
        def bootstrap_windows_ssh fqdn = '', options = ''
          system "cd  #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife bootstrap windows ssh #{fqdn} #{options}"
        end
        
        def bootstrap_windows_winrm fqdn = '', options = ''
          system "cd  #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife bootstrap windows winrm #{fqdn} #{options}"
        end
        
        # TODO move chef_client from this class
        def chef_client fqdn = ''
          system "cd ~/chef_workstation_proxy/chef_repo && ssh root@#{fqdn} 'sudo chef-client'"
        end
      end
    end
  end
end
