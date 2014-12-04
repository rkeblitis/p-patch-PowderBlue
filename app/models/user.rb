class User < ActiveRecord::Base
  has_many :tools
  has_many :comments
  has_secure_password
  
end
