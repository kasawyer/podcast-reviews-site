class UserTableCleanup < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :admin
    remove_column :users, :username
    remove_column :users, :profile_pic_url
  end
  def down
    add_column :users, :admin, :boolean, null: false
    add_column :users, :username, :string, null: false
    add_column :users, :profile_pic_url, :string
  end
end
