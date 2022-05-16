class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :location
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
