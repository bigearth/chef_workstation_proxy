module BigEarth 
  module Blockchain 
    module Knife 
      class Node
        def bulk_delete regex = '', options = '' 
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife node bulk delete #{regex} #{options}"
        end
        
        def create node = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife node create #{node} #{options}"
        end
        
        def delete node = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife node delete #{node} #{options}"
        end
        
        def edit node = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife node edit #{node} #{options}"
        end
        
        def environment_set node = '', environment = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife node environment set #{node} #{environment}"
        end
        
        def from_file file = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife node from file #{file} #{options}"
        end
        
        def list options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife node list #{options}"
        end
        
        def run_list_add node = '', entry = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife node run_list add #{node} #{entry} #{options}"
        end
        
        def run_list_remove node = '', entry = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife node run_list remove #{node} #{entry} #{options}"
        end
        
        def run_list_set node = '', entries = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife node run_list remove #{node} #{entries} #{options}"
        end
        
        def show node = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife node run_list remove #{node} #{options}"
        end
      end
    end
  end
end
