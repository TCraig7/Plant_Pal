require 'rails_helper'

describe "user creates a new plant" do
  describe "they link from the plants index" do
    describe "they fill in the new plant form" do
      it "creates a new plant" do
        user = User.create!(username: 'tara', password: 'password')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit plants_path
        click_link "Create a New Plant"

        expect(current_path).to eq(new_plant_path)

        fill_in "plant[species]", with: "Golden Cactus"
        fill_in "plant[nickname]",  with: "Spike"
        fill_in "plant[amount_of_water]",  with: 1
        fill_in "plant[amount_of_sun]",  with: 3
        fill_in "plant[category_list]", with: "Sun Loving, Guest Room"

        click_on "Create Plant"

        expect(page).to have_content("Golden Cactus")
        expect(page).to have_content("Spike")
        expect(page).to have_content("Amount of Water: 1")
        expect(page).to have_content("Amount of Sun: 3")
      end
    end
  end
end
