require 'sinatra'
require 'sinatra/json'
require 'json'

post '/bootstrap_chef_node' do
  request.body.rewind  # in case someone already read it
  data = JSON.parse request.body.read
  puts "Calling: cd ~/chef-repo && knife bootstrap #{data['ip_address']} -x root -A -P password --sudo --use-sudo-password -N #{data['name']}"
  `cd ~/chef-repo && knife bootstrap #{data['ip_address']} -x root -A -P password --sudo --use-sudo-password -N #{data['name']}`
  # puts `cd ~/chef-repo && knife node list`
end
