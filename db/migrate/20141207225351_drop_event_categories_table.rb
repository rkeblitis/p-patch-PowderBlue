class DropEventCategoriesTable < ActiveRecord::Migration
  def change
    drop_table :event_category_tables
  end
end
