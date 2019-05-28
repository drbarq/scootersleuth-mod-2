class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :battery_level

      t.timestamps
    end
  end
end
