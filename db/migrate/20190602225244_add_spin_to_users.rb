class AddSpinToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :spin, :boolean
  end
end
