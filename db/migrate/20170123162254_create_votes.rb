class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :review, null: false
      t.integer :value, default: 0, null: false
    end

    add_index :votes, [:user_id, :review_id], unique: true
  end
end
