require 'rails_helper'

describe 'user sees one category' do
  describe 'user links from plant show page' do
    it "should display information for one category" do
      plant = Plant.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
      category = plant.categories.create(name: "shade loving")

      visit plant_path(plant)
      save_and_open_page
      click_on "shade loving"

      expect(current_path).to eq(category_path(category))
    end
  end
end
