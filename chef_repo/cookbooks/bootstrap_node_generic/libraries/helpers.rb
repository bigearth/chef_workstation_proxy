module BootstrapNodeGenericCookbook
  module Helpers
    def password_shadow_hash
      require 'digest/sha2'
      password = "pass@123"
      salt = rand(36**8).to_s(36)
      password.crypt("$6$" + salt)
    end
  end
end
