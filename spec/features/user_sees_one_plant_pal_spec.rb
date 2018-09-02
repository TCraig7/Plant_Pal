require 'rails_helper'

describe 'user sees one plant pal' do
  describe 'user links from plants index page' do
    before(:each) do
      @plant1 = Plant.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
    end

    it 'should display information for one plant' do
      visit plants_path

      click_link "More Details"

      # within("#more-details-#{@plant.id}", :visible => false) do
      #   click_on "More Details"
      # end

      expect(page).to have_content(@plant1.species)
      expect(page).to have_content(@plant1.nickname)
      expect(page).to have_content(@plant1.amount_of_water)
      expect(page).to have_content(@plant1.amount_of_sun)
      expect(page).to have_content(@plant1.created_at)
    end

    it "should delete plant when 'delete' is clicked" do
      plant2 = Plant.create(species: 'Golden Cactus', nickname: 'Spike', amount_of_water: 1, amount_of_sun: 3)

      visit plant_path(plant2)
      click_link 'Delete'

      expect(current_path).to eq(plants_path)
      expect(page).to have_content(@plant1.species)
      expect(page).to_not have_content(plant2.species)
    end
  end
end
