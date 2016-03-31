module BigEarth 
  module Blockchain 
    module Knife 
      class Node
        def initialize 
          puts 'new knife node'
        end
        
        def bulk_delete regex, options 
          system "cd ~/chef_workstation_proxy/chef_repo && knife node bulk delete #{regex} #{options}"
        end
        
        def create node, options
          system "cd ~/chef_workstation_proxy/chef_repo && knife node create #{node} #{options}"
        end
        
        def delete node, options
          system "cd ~/chef_workstation_proxy/chef_repo && knife node delete #{node} #{options}"
        end
        
        def edit node, options
          system "cd ~/chef_workstation_proxy/chef_repo && knife node edit #{node} #{options}"
        end
        
        def environment_set node, environment
          system "cd ~/chef_workstation_proxy/chef_repo && knife node environment set #{node} #{environment}"
        end
        
        def from_file file, options
          system "cd ~/chef_workstation_proxy/chef_repo && knife node from file #{file} #{options}"
        end
        
        def list options
          system "cd ~/chef_workstation_proxy/chef_repo && knife node list #{options}"
        end
        
        def run_list_add node, entry, options
          system "cd ~/chef_workstation_proxy/chef_repo && knife node run_list add #{node} #{entry} #{options}"
        end
        
        def run_list_remove node, entry, options
          system "cd ~/chef_workstation_proxy/chef_repo && knife node run_list remove #{node} #{entry} #{options}"
        end
        
        def run_list_set node, entries, options
          system "cd ~/chef_workstation_proxy/chef_repo && knife node run_list remove #{node} #{entries} #{options}"
        end
        
        def show node, options
          system "cd ~/chef_workstation_proxy/chef_repo && knife node run_list remove #{node} #{options}"
        end
      end
    end
  end
end
