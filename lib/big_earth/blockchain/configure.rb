module BigEarth 
  module Blockchain 
    module Knife 
      class Configure
        def configure options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife configure #{options}"
        end
        
        def configure_client client = '', directory = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife configure client #{client} #{directory}"
        end
      end
    end
  end
end
