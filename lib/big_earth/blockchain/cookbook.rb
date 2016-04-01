module BigEarth 
  module Blockchain 
    module Knife 
      class Coookbook
        def bulk_delete regex = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife cookbook bulk delete #{regex} #{options}"
        end
        
        def create cookbook = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife cookbook create #{cookbook} #{options}"
        end
        
        def delete cookbook = '', version = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife cookbook delete #{cookbook} #{version} #{options}"
        end
        
        def download cookbook = '', version = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife cookbook download #{cookbook} #{version} #{options}"
        end
        
        def list options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife cookbook list #{options}"
        end
        
        def metadata cookbook = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife cookbook metadata #{cookbook} #{options}"
        end
        
        def metadata_from file = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife cookbook metadata from #{file} #{options}"
        end
        
        def show cookbook = '', version = '', part = '', filename = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife cookbook show #{cookbook} #{version} #{part} #{filename} #{options}"
        end
        
        def test cookbooks = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife cookbook test #{cookbooks} #{options}"
        end
        
        def upload cookbooks = '', options = ''
          system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']} && knife cookbook test #{cookbooks} #{options}"
        end
      end
    end
  end
end
