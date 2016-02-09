working_directory "/root/chef_workstation_sinatra"

pid "/root/chef_workstation_sinatra/pids/unicorn.pid"

stderr_path "/root/chef_workstation_sinatra/logs/unicorn.log"
stdout_path "/root/chef_workstation_sinatra/logs/unicorn.log"

listen "/tmp/unicorn.myapp.sock"

worker_processes 2

timeout 30
