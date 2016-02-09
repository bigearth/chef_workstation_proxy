require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'json'

class App < Sinatra::Base
  post '/bootstrap_chef_node' do
    begin
      data = JSON.parse request.body.read
      system "cd ~/chef-repo && knife bootstrap #{data['ip_address']} -x root -A -P password --sudo --use-sudo-password -N #{data['name']}"
    rescue Errno::EHOSTUNREACH => error
      puts "Error: #{error}"
    rescue Exception => error
      puts "Error: #{error}"
    end
  end
end
