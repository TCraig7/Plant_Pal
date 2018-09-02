require 'rails_helper'

describe 'user sees one plant pal' do
  describe 'user links from plants index page' do
    before(:each) do
      @plant = Plant.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
    end

    it 'should display information for one plant' do
      visit plants_path

      click_link "More Details"

      # within("#more-details-#{@plant.id}", :visible => false) do
      #   click_on "More Details"
      # end

      expect(page).to have_content(@plant.species)
      expect(page).to have_content(@plant.nickname)
      expect(page).to have_content(@plant.amount_of_water)
      expect(page).to have_content(@plant.amount_of_sun)
      expect(page).to have_content(@plant.created_at)
    end
  end
end
