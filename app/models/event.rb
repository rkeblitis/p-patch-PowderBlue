class Event < ActiveRecord::Base
  has_many :categories, :though => :event_category_table
  has_many :event_category_tables
end
