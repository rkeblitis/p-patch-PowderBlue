class Event < ActiveRecord::Base
  has_many :categories, :through => :category_events
  has_many :category_events
  belongs_to :user

  def self.sort_events_by_date
    @sorted_events = Event.all.sort_by { |event| event.date }.reverse
  end

end
