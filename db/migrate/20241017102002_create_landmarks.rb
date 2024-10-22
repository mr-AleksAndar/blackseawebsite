class CreateLandmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :landmark_type
      t.string :url
      t.string :image_url
      t.string :slug

      t.timestamps
    end
  end
end
