require 'rails_helper'

describe "User visits categories index page" do
  context "as admin" do
    it "allows admin to see all categories" do
	   admin = User.create(username: "tara", password: "boom", role: 1)

     user1 = User.create(username: 'greg', password: 'password', role: 0)
     plant1 = user1.plants.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
     category1 = plant1.categories.create(name: "shade loving")
     category2 = plant1.categories.create(name: "living room")

     user2 = User.create!(username: 'oscar', password: 'password', role: 0)
     plant2 = user2.plants.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
     category3 = plant2.categories.create(name: "low light")
     category4 = plant2.categories.create(name: "hardy")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content("Admin Categories")
      expect(page).to have_content(category1.name)
      expect(page).to have_content(category2.name)
      expect(page).to have_content(category3.name)
      expect(page).to have_content(category4.name)
    end
  end

  context "as default user" do
    it 'does not allow default user to see admin categories index' do
      user = User.create(username: "fern@gully.com", password: "password", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
