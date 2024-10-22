class UpdateSpots < ActiveRecord::Migration[7.1]
  def change
    remove_column :spots, :x_coordinate, :integer
    remove_column :spots, :y_coordinate, :integer

    add_column :spots, :wave_type, :string
    add_column :spots, :seabed_type, :string
    add_column :spots, :swell_window, :string
    add_column :spots, :consistency, :integer
    add_column :spots, :break_type, :string
    add_column :spots, :image_url, :string
  end
end
