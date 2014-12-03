class User < ActiveRecord::Base
  has_many :tools
  has_many :comments
end
