require 'rails_helper'

describe 'user sees one category' do
  describe 'user links from plant show page' do
    it "should display information for one category" do
      user = User.create(username: 'tara', password: 'password')
      plant = user.plants.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
      category = plant.categories.create(name: "shade loving")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit plant_path(plant)

      click_on "shade loving"

      expect(current_path).to eq(category_path(category))
    end

    it "can link back to all categories" do
      user = User.create(username: 'tara', password: 'password')
      plant = user.plants.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
      category = plant.categories.create(name: "shade loving")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit category_path(category)

      click_on "Back to All Categories"

      expect(current_path).to eq(categories_path)
    end
  end
end
