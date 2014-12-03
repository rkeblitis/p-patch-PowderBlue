class Category < ActiveRecord::Base
  has_many :events, :though => :event_category_table
  has_many :event_category_tables
end
