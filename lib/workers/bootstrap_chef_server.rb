module BigEarth
  module Blockchain 
    class BootstrapChefServer
      # Set queue
      # TODO set environment
      @queue = '_bootstrap_chef_server_worker'
      
      def self.perform config 
        require 'bootstrap'
        begin
          bootstrap = BigEarth::Blockchain::Knife::Bootstrap.new
          bootstrap.bootstrap config['options']['ipv4_address'], "-x root -A -P password --sudo --use-sudo-password -N #{config['title'].tr(' ', '_')} -r 'recipe[bootstrap_node_generic], recipe[chef_server]'" 
          bootstrap.chef_client config['options']['ipv4_address'] 
        rescue => error
          puts "[ERROR] #{Time.now}: #{error.class}: #{error.message}"
        end
      end
    end
  end
end
