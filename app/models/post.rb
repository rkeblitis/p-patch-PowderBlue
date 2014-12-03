class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin
  has_many :comments
end
