require 'rails_helper'

describe 'user sees one plant pal' do
  describe 'user links from plants index page' do
    before(:each) do
      @user = User.create(username: 'tara', password: 'password')
      @plant1 = @user.plants.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
      @note1 = @plant1.notes.create(content: "Needs to be watered every week.")
      @note2 = @plant1.notes.create(content: "Does not like direct sunlight, do not put on windowsill.")
      @category1 = @plant1.categories.create(name: "Sun Loving")
      @category2 = @plant1.categories.create(name: "Guest Room")
      @stub = allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    end

    it 'should display information for one plant' do
      visit plants_path

      click_link "More Details"

      expect(page).to have_content(@plant1.species)
      expect(page).to have_content(@plant1.nickname)
      expect(page).to have_content(@plant1.amount_of_water)
      expect(page).to have_content(@plant1.amount_of_sun)
      expect(page).to have_content(@plant1.created_at)
      expect(page).to have_content(@note1.content)
      expect(page).to have_content(@note1.created_at)
      expect(page).to have_content(@note2.content)
      expect(page).to have_content(@note2.created_at)
      expect(page).to have_content(@category1.name)
      expect(page).to have_content(@category2.name)
    end

    it "should delete plant when 'delete' is clicked" do
      plant2 = @user.plants.create(species: 'Golden Cactus', nickname: 'Spike', amount_of_water: 1, amount_of_sun: 3)

      visit plant_path(plant2)
      click_link 'Delete'

      expect(current_path).to eq(plants_path)
      expect(page).to have_content(@plant1.species)
      expect(page).to_not have_content(plant2.species)
    end

    it "should edit a plant when 'edit' is clicked" do
      visit plant_path(@plant1)
      click_link 'Edit'

      expect(current_path).to eq(edit_plant_path(@plant1))

      fill_in "plant[nickname]",  with: "Smalls"

      click_on 'Update Plant'

      expect(page).to have_content("Nickname: Smalls")
    end

    describe 'it should fill in a note form' do
      it "should display the note on the plant show page" do
        visit plant_path(@plant1)

        fill_in "note[content]", with: "Rotate pot so leaves grow evenly."
        click_on "Submit"

        expect(current_path).to eq(plant_path(@plant1))
        expect(page).to have_content("New Note:")
        expect(page).to have_content("Rotate pot so leaves grow evenly.")
      end
    end
  end
end
