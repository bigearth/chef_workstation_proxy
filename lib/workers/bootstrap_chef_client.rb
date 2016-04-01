module BigEarth
  module Blockchain 
    class BootstrapChefClient
      # Set queue
      # TODO set environment
      @queue = '_bootstrap_chef_client_worker'
      
      def self.perform config 
        require 'bootstrap'
        begin
          require 'node'
          node = BigEarth::Blockchain::Knife::Node.new
          bootstrap = BigEarth::Blockchain::Knife::Bootstrap.new
          bootstrap.bootstrap config['options']['ipv4_address'], config
          bootstrap.chef_client 
        rescue => error
          puts 'bootstrap chef client error'
          puts "[ERROR] #{Time.now}: #{error.class}: #{error.message}"
        end
      end
    end
  end
end