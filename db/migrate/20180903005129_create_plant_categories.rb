class CreatePlantCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :plant_categories do |t|
      t.references :category, foreign_key: true
      t.references :plant, foreign_key: true
    end
  end
end
