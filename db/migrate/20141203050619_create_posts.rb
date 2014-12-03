class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :admin_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
