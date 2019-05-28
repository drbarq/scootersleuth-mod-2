class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :bird
      t.boolean :lime
      t.boolean :spin

      t.timestamps
    end
  end
end
