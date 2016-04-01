module BigEarth 
  module Blockchain 
    module Knife 
      class Client
        # Usage: /usr/local/bin/knife (options)
        def bulk_delete regex = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife client bulk delete #{regex} #{options}"
        end
        
        def create clientname = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife client create #{clientname} #{options}"
        end
        end
        
        def delete client = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife client delete #{client} #{options}"
        end
        
        def edit client = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife client edit #{client} #{options}"
        end
        
        def key_delete client = '', keyname = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife client key_delete #{client} #{keyname} #{options}"
        end
        
        def key_edit client = '', keyname = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife client key_edit #{client} #{keyname} #{options}"
        end
        
        def key_list client = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife client key_list #{client} #{options}"
        end
        
        def key_show client = '', keyname = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife client key_show #{client} #{keyname} #{options}"
        end
        
        def list options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife client list #{options}"
        end
        
        def reregister client = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife client reregister #{client} #{options}"
        end
        
        def show client = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife client show #{client} #{options}"
        end
      end
    end
  end
end
