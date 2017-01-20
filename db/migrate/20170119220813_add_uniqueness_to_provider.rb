class AddUniquenessToProvider < ActiveRecord::Migration[5.0]
  def change
    add_index :providers, :name, unique: true
  end
end
