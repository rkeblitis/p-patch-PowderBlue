class DropAdminIdAddUserIdToPostModel < ActiveRecord::Migration
  def change
    remove_column :posts, :admin_id
    add_column  :posts, :user_id, :integer
  end
end
