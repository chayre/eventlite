class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string, unique: true
    add_index :users, :username, unique: true
  end
end
