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
          puts "RECIPE #{recipe}"
          berkshelf = BigEarth::Blockchain::Berkshelf.new
          puts "Berkshelf: #{berkshelf}"
          berkshelf.install if File.file? "#{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{recipe}" 
          berkshelf.upload('-b /.Berksfile') if File.file? '/.Berksfile' 
          cookbook.upload recipe 
        end
      end
    end
  end
end
