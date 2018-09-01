require 'rails_helper'

describe 'user sees all plants' do
  describe 'they visit plants_path' do
    it "shows all user plants" do
      plant_1 = Plant.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
      plant_2 = Plant.create(species: 'Chinese Money Plant', nickname: 'Pancake', amount_of_water: 2, amount_of_sun: 2)

      visit plants_path

      expect(page).to have_content("Species: #{plant_1.species}")
      expect(page).to have_content("Nickname: #{plant_1.nickname}")
      expect(page).to have_content("Species: #{plant_2.species}")
      expect(page).to have_content("Nickname: #{plant_2.nickname}")      
    end
  end
end
