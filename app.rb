require 'sinatra'
require 'sinatra/base'
require "sinatra/config_file"
require 'sinatra/json'
require 'json'

class App < Sinatra::Base
  register Sinatra::ConfigFile
  config_file './config.yml'
  
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    username == ENV['SINATRA_USERNAME'] and password == ENV['SINATRA_PASSWORD']
  end

  post '/bootstrap_chef_client' do
    begin
      data = JSON.parse request.body.read
      flavor = data['flavor']
      system "cd ~/chef-repo && knife bootstrap #{data['ipv4_address']} -x root -A -P password --sudo --use-sudo-password -N #{data['title']}  -r 'recipe[bitcoin::#{flavor}]'"
      system "cd ~/chef-repo && ssh root@#{data['ipv4_address']} 'sudo chef-client'"
    rescue Exception => error
      puts "Error: #{error}"
    end
  end

  get '/confirm_client_bootstrapped' do
    begin
      # data={name:'justin-hughes-1'}
      puts "Confirming that Chef Client #{data[:title]} has been boostrapped"
      if "cd ~/chef-repo && knife node show #{params[:title]}"
        { status: 200 }.to_json
      else
        { status: 204 }.to_json
      end
    rescue Exception => error
    end
  end
end
