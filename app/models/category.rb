class Category < ActiveRecord::Base
  has_many :events, :through => :category_events
  has_many :category_events
end
