class RemoveDatetimeColumnFromEventsTable < ActiveRecord::Migration
  def change
    remove_column(:events, :datetime)
  end
end
