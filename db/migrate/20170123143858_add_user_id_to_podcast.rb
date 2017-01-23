class AddUserIdToPodcast < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasts, :user_id, :integer, null: false
  end
end
