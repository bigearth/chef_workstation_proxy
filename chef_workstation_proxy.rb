$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib/workers"
$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib/big_earth/blockchain"
require 'sinatra/base'
require "sinatra/config_file"
require 'sinatra/json'
require 'json'
require 'resque'
module BigEarth
  module Blockchain
    class ChefWorkstationProxy < Sinatra::Base

      register Sinatra::ConfigFile
      config_file './config.yml'
      
      use Rack::Auth::Basic, "Restricted Area" do |username, password|
        username == ENV['CHEF_WORKSTATION_PROXY_USERNAME'] and password == ENV['CHEF_WORKSTATION_PROXY_PASSWORD']
      end
      
      get '/ping.json' do
        content_type :json
        { status: 'pong' }.to_json
      end
      
      post '/bootstrap_infrastructure' do
        require 'bootstrap_chef_client'
        begin
          data = JSON.parse request.body.read
          # Bootstrap new chef client based on :options hash
          Resque.enqueue BigEarth::Blockchain::BootstrapChefClient, data
        rescue => error
          puts "[ERROR] #{Time.now}: #{error.class}: #{error.message}"
        end
      end

      get '/confirm_infrastructure_bootstrapped' do
        begin
          data = JSON.parse request.body.read
          puts "Confirming that infrastructure '#{data['config']['title']}' has been boostrapped"
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
