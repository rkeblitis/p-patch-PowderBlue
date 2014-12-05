class CreateOauths < ActiveRecord::Migration
  def change
    create_table :oauths do |t|
      t.string :name
      t.string :uid
      t.string :provider
      t.integer :user_id
      t.string :token

      t.timestamps
    end
  end
end
