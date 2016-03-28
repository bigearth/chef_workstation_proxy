module BigEarth
  module Blockchain
    require 'sinatra/base'
    require "sinatra/config_file"
    require 'sinatra/json'
    require 'json'
    class ChefWorkstationProxy < Sinatra::Base

      register Sinatra::ConfigFile
      config_file './config.yml'
      
      use Rack::Auth::Basic, "Restricted Area" do |username, password|
        username == ENV['CHEF_WORKSTATION_PROXY_USERNAME'] and password == ENV['CHEF_WORKSTATION_PROXY_PASSWORD']
      end

      post '/bootstrap_chef_client' do
        begin
          data = JSON.parse request.body.read
          flavor = data['flavor']
          system "cd ~/chef-workstation-proxy/chef_repo && knife bootstrap #{data['ipv4_address']} -x root -A -P password --sudo --use-sudo-password -N #{data['title']} -r 'recipe[bitcoin::#{flavor}]'"
          system "cd ~/chef-workstation-proxy/chef_repo && ssh root@#{data['ipv4_address']} 'sudo chef-client'"
        rescue => error
          puts "[ERROR] #{Time.now}: #{error.class}: #{error.message}"
        end
      end

      get '/confirm_client_bootstrapped' do
        begin
          data = JSON.parse request.body.read
          puts "Confirming that Chef Client #{data['title']} has been boostrapped"
          if "cd ~/chef-repo && knife node show #{params['title']}"
            # Do Success Things
          else
            # Do Error Things
          end
        rescue => error
          puts "[ERROR] #{Time.now}: #{error.class}: #{error.message}"
        end
      end
    end
  end
end
