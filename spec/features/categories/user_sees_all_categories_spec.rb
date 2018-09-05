require 'rails_helper'

describe 'user sees all categories' do
  describe 'they visit categories_path' do
    before(:each) do
      @user = User.create(username: 'tara', password: 'password')
      @plant = @user.plants.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
      @category1 = @plant.categories.create(name: "shade loving")
      @category2 = @plant.categories.create(name: "living room")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "shows all user categories" do
      visit categories_path

      expect(page).to have_link("shade loving")
      expect(page).to have_link("living room")
    end

    it "can delete a category" do
      visit categories_path

      within("#category-delete-#{@category2.id}") do
        click_link 'Delete'
      end

      expect(current_path).to eq(categories_path)
      expect(page).to have_content(@category1.name)
      expect(page).to_not have_content(@category2.name)
    end

    it "can link go back to all plants" do
      visit categories_path

      click_link "Back to All Plants"

      expect(current_path).to eq(plants_path)
    end
  end
end
