class CreatePodcastProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :podcast_providers do |t|
      t.belongs_to :provider, null: false
      t.belongs_to :podcast, null: false
      t.timestamps
    end

    add_index :podcast_providers, [:provider_id, :podcast_id], unique: true
  end
end
