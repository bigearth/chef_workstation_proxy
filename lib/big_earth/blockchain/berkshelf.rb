module BigEarth 
  module Blockchain 
    class Berkshelf
      def initialize cookbook
        @cookbook = cookbook
      end
      
      def apply environment = ''
        # Apply version locks from Berksfile.lock to a Chef environment
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks apply #{environment}"
      end
    
      def contingent cookbook = ''
        # List all cookbooks that depend on the given cookbook in your Berksfile
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks contingent #{cookbook}"
      end
    
      def cookbook name = '', path = ''
        # Create a skeleton for a new cookbook
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks cookbook #{name} #{path}"
      end
    
      def help command = ''
        # Describe available commands or one specific command
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks help #{command}"
      end
    
      def info cookbook = ''
        # Display name, author, copyright, and dependency information about a cookbook
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks info #{cookbook}"
      end
    
      def inin path = ''
        # Initialize Berkshelf in the given directory
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks init #{path}"
      end
    
      def install
        # Install the cookbooks specified in the Berksfile
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks install"
      end
    
      def list
        # List cookbooks and their dependencies specified by your Berksfile
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks list"
      end
    
      def outdated cookbooks = ''
        # List dependencies that have new versions available that satisfy their constraints
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks outdated #{cookbooks}"
      end
    
      def package path = ''
        # Vendor and archive the dependencies of a Berksfile
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks package #{path}"
      end
    
      def search name = ''
        # Search the remote source for cookbooks matching the partial name
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks search #{name}"
      end
    
      def shelf subcommand = ''
        # Interact with the cookbook store
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks shelf #{subcommand}"
      end
    
      def show cookbook = ''
        # Display the path to a cookbook on disk
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks show #{cookbook}"
      end
    
      def update cookbooks = ''
        # Update the cookbooks (and dependencies) specified in the Berksfile
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks update #{cookbooks}"
      end
    
      def upload cookbooks = ''
        # Upload the cookbook specified in the Berksfile to the Chef Server
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks upload #{cookbooks}"
      end
    
      def vendor path = ''
        # Vendor the cookbooks specified by the Berksfile into a directory
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks vendor #{path}"
      end
    
      def verify 
        # Perform a quick validation on the contents of your resolved cookbooks
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks verify"
      end
    
      def version 
        # Display version
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks version"
      end
    
      def viz 
        # Visualize the dependency graph
        system "cd #{ENV['CHEF_WORKSTATION_PROXY_CHEF_REPO_PATH']}/cookbooks/#{@cookbook} && berks viz"
      end
    end
  end
end
