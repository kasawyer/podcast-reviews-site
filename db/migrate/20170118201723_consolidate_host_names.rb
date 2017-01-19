class ConsolidateHostNames < ActiveRecord::Migration[5.0]
  def up
    remove_column :hosts, :first_name
    remove_column :hosts, :last_name
    add_column :hosts, :name, :string, null: false
    add_index :hosts, :name
  end

  def down
    add_column :hosts, :first_name, :string, null: false
    add_column :hosts, :last_name, :string, null: false
    remove_column :hosts, :name
  end
end
