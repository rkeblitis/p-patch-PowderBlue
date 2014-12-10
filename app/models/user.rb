class User < ActiveRecord::Base
  has_many :tools
  has_many :comments
  has_many :oauths
  has_many :posts
  has_secure_password

end
