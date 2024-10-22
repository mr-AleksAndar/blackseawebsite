class CreateSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.integer :x_coordinate
      t.integer :y_coordinate

      t.timestamps
    end
  end
end
