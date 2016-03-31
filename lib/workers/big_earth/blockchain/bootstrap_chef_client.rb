module BigEarth 
  module Blockchain 
    class BootstrapChefClient
      
      # Set queue
      # TODO set environment
      @queue = '_bootstrap_chef_client_worker'

      def self.perform data
        begin
          bootstrap = BigEarth::Blockchain::Knife::Bootstrap.new data
          bootstrap.bootstrap
          bootstrap.chef_client 
        rescue => error
            puts "[ERROR] #{Time.now}: #{error.class}: #{error.message}"
        end
      end
    end
  end
end
