require 'rails_helper'

describe Plant, type: :model do
  describe 'validatations' do
    it {should validate_presence_of(:species)}
    it {should validate_presence_of(:amount_of_water)}
    it {should validate_presence_of(:amount_of_sun)}
    it {should have_many(:notes)}
    it {should belong_to(:user)}
  end

  describe 'relationships' do
    it {should have_many(:plant_categories)}
    it {should have_many(:categories).through(:plant_categories)}
  end

  describe 'instance methods' do
    describe '#category_list' do
      it "turns associated categories into a string" do
        user = User.create(username: 'tara', password: 'password')
        plant = user.plants.create(species: "Golden Cactus", nickname: "Spike", amount_of_water: 1, amount_of_sun: 3)
        category1 = plant.categories.create(name: "Sun Loving")
        category2 = plant.categories.create(name: "Guest Room")

        expect(plant.category_list).to eq("Sun Loving, Guest Room")
      end
    end
  end
end
