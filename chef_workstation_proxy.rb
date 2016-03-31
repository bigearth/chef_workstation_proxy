require 'sinatra/base'
require "sinatra/config_file"
require 'sinatra/json'
require 'json'
require 'resque'
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
  
  post '/bootstrap_chef_client' do
    begin
      data = JSON.parse request.body.read
      Resque.enqueue BootstrapChefClient, data
    rescue => error
      puts "[ERROR] #{Time.now}: #{error.class}: #{error.message}"
    end
  end

  get '/confirm_chef_client_bootstrapped' do
    begin
      data = JSON.parse request.body.read
      puts "Confirming that Chef Client '#{data['title']}' has been boostrapped"
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

class BootstrapChefClient
  
  # Set queue
  # TODO set environment
  @queue = '_bootstrap_chef_client_worker'
  
  def self.perform data
    begin
      knife = Knife.new data
      knife.bootstrap
      knife.chef_client 
    rescue => error
        puts "[ERROR] #{Time.now}: #{error.class}: #{error.message}"
    end
  end
end

class Knife
  def initialize data
    @data = data
  end
  
  def bootstrap
    flavor = @data['flavor']
    system "cd ~/chef_workstation_proxy/chef_repo && knife bootstrap #{@data['ipv4_address']} -x root -A -P password --sudo --use-sudo-password -N #{@data['title'].tr(' ', '_')} -r 'recipe[bootstrap_node_generic], recipe[bitcoin::bitcoin_#{flavor}]'"
  end
  
  def chef_client 
      system "cd ~/chef_workstation_proxy/chef_repo && ssh root@#{@data['ipv4_address']} 'sudo chef-client'"
  end
end
