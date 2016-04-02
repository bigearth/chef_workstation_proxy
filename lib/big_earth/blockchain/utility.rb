module BigEarth 
  module Blockchain 
    module Utility
      def update_cookbooks recipes
        require 'cookbook'
        require 'berkshelf'
        # Instance of Cookbook
        cookbook = BigEarth::Blockchain::Knife::Cookbook.new
        
        # upload the latest and greatest of each cookbook to chef-server
        recipes.each do |recipe|
          berkshelf = BigEarth::Blockchain::Berkshelf.new
          puts "Berkshire Installing #{recipe}"
          berkshelf.install if File.file? "#{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{recipe}" 
          berkshelf.upload('-b /.Berksfile --ssl-verify=false') if File.file? '/.Berksfile' 
          cookbook.upload recipe 
        end
      end
      
      def format_recipes recipes
        formatted_recipes = recipes.map do |recipe|
          "recipe[#{recipe}]"
        end
        formatted_recipes.join ', '
      end
    end
  end
end
