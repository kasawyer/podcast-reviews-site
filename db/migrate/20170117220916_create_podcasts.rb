class CreatePodcasts < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts do |t|
      t.string :name, null: false
      t.belongs_to :provider, null: false
      t.text :description
      t.belongs_to :host
      t.belongs_to :category
      t.integer :release_year
      t.string :itunes_url
      t.string :soundcloud_url
      t.string :image_url
      t.timestamps
    end
  end
end
