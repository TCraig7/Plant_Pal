require 'rails_helper'

describe 'user sees all plants' do
  describe 'they visit plants_path' do
    before(:each) do
      @user = User.create(username: 'tara', password: 'password')
      @plant_1 = @user.plants.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
      @plant_2 = @user.plants.create(species: 'Chinese Money Plant', nickname: 'Pancake', amount_of_water: 2, amount_of_sun: 2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "shows all user plants" do
      visit plants_path

      expect(page).to have_content("Species: #{@plant_1.species}")
      expect(page).to have_content("Nickname: #{@plant_1.nickname}")
      expect(page).to have_content("Species: #{@plant_2.species}")
      expect(page).to have_content("Nickname: #{@plant_2.nickname}")
      expect(page).to have_link("More Details")
    end

    it "can create a new plant" do
      visit plants_path

      expect(page).to have_link("Create a New Plant")
    end

    it "can click link to see all categories" do
      visit plants_path

      expect(page).to have_link("See All Categories")
    end
  end
end
