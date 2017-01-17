class CreatePodcastHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :podcast_hosts do |t|
      t.belongs_to :host, null: false
      t.belongs_to :podcast, null: false
      t.timestamps
    end

    add_index :podcast_hosts, [:host_id, :podcast_id], unique: true
  end
end
