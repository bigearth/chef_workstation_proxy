require 'utility'

module BigEarth
  module Blockchain 
    class BootstrapChefServer
      extend BigEarth::Blockchain::Utility
      
      # TODO set environment
      # Set queue
      @queue = '_bootstrap_chef_server_worker'
      
      def self.perform config 
        require 'bootstrap'
        begin
          # Recipes for a chef-server
          recipes = ['bootstrap_node_generic', 'chef-server']
          
          # update the cookbooks
          update_cookbooks recipes
          
          # Instance of Bootstrap
          bootstrap = BigEarth::Blockchain::Knife::Bootstrap.new
          bootstrap.bootstrap config['options']['ipv4_address'], "-x root -A -P password --sudo --use-sudo-password -N #{config['title'].tr(' ', '_')} -r 'recipe[#{recipes.first}], recipe[#{recipes.last}]'" 
          bootstrap.chef_client config['options']['ipv4_address'] 
        rescue => error
          puts "[ERROR] #{Time.now}: #{error.class}: #{error.message}"
        end
      end
    end
  end
end
