class AddDateColumnToEventsTable < ActiveRecord::Migration
  def change
    add_column(:events, :date, :date)
  end
end
