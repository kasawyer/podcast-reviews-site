class CreateCategorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :categorizations do |t|
      t.belongs_to :category, null: false
      t.belongs_to :podcast, null: false
      t.timestamps
    end

    add_index :categorizations, [:category_id, :podcast_id], unique: true
  end
end
