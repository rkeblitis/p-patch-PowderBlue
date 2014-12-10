class Event < ActiveRecord::Base
  has_many :categories, :through => :category_events
  has_many :category_events
  belongs_to :user
end
