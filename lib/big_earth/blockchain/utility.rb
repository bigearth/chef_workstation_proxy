module BigEarth 
  module Blockchain 
    module Utility
      def update_cookbooks recipes
        require 'cookbook'
        # Instance of Cookbook
        cookbook = BigEarth::Blockchain::Knife::Cookbook.new
        
        # TODO bundle berkshelf dependencies
        # berks install
        # TODO upload berkshelf dependencies to chef-server
        # berks install
        
        # upload the latest and greatest of each cookbook to chef-server
        recipes.each do |recipe|
          cookbook.upload recipe 
        end
      end
    end
  end
end
