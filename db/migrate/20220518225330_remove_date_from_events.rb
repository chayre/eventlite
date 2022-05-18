class RemoveDateFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :day, :integer
    remove_column :events, :month, :integer
    remove_column :events, :year, :integer
  end
end
