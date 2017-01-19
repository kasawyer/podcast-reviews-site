class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :profile_pic_url, :string
    add_column :users, :admin, :boolean
  end
end
