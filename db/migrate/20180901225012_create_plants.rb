class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :species
      t.string :nickname
      t.integer :amount_of_water
      t.integer :amount_of_sun

      t.timestamps
    end
  end
end
