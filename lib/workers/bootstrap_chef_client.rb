require 'utility'

module BigEarth
  module Blockchain 
    class BootstrapChefClient
      extend BigEarth::Blockchain::Utility
      
      # TODO set environment
      # Set queue
      @queue = '_bootstrap_chef_client_worker'
      
      def self.perform config 
        require 'bootstrap'
        begin
          # update the cookbooks
          update_cookbooks ['bootstrap_node_generic', 'bitcoin']
          
          # Instance of Bootstrap
          bootstrap = BigEarth::Blockchain::Knife::Bootstrap.new
          
          # format recipes
          formatted_recipes = format_recipes ['bootstrap_node_generic', "bitcoin::bitcoin_#{config['options']['flavor']}"]
          
          # bootstrap the chef server
          bootstrap.bootstrap config['options']['ipv4_address'], "-x root -A -P password --sudo --use-sudo-password -N #{config['title'].tr(' ', '_')} -r '#{formatted_recipes}'" 
          
          # finish bringing it up
          bootstrap.chef_client config['options']['ipv4_address'] 
        rescue => error
          puts "[ERROR] #{Time.now}: #{error.class}: #{error.message}"
        end
      end
    end
  end
end
