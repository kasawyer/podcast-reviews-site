class AddNameAndAvatarToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :name, :string, null: false
    add_column :admins, :avatar, :string
  end
end
