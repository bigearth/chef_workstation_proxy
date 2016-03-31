module BigEarth
  module Blockchain 
    class BootstrapChefClient
      # Set queue
      # TODO set environment
      @queue = '_bootstrap_chef_client_worker'
      
      def self.perform data
        puts "DATA #{data}"
        require 'bootstrap'
        begin
          require 'node'
          node = BigEarth::Blockchain::Knife::Node.new
          puts node.list
          bootstrap = BigEarth::Blockchain::Knife::Bootstrap.new
          bootstrap.bootstrap data['config']['ipv4_address'], data['config']
          bootstrap.chef_client 
        rescue => error
            puts "[ERROR] #{Time.now}: #{error.class}: #{error.message}"
        end
      end
    end
  end
end
