class AddIndexToPodcasts < ActiveRecord::Migration[5.0]
  def change
    add_index :podcasts, [:provider_id, :name], unique: true
  end
end
