class CreateScooters < ActiveRecord::Migration[5.2]
  def change
    create_table :scooters do |t|
      t.string :company
      t.float :latitude
      t.float :longitude
      t.string :battery_level

      t.timestamps
    end
  end
end
