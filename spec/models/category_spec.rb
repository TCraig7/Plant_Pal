require 'rails_helper'

describe Category, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
  end

  describe 'relationships' do
    it {should have_many(:plant_categories)}
    it {should have_many(:plants).through(:plant_categories)}
  end

  describe 'instance methods' do
    describe '#to_s' do
      it "turns the names into a string" do
        plant = Plant.create(species: "Golden Cactus", nickname: "Spike", amount_of_water: 1, amount_of_sun: 3)
        category1 = plant.categories.create(name: "Sun Loving")
        category2 = plant.categories.create(name: "Guest Room")

        expect(plant.category_list).to eq("Sun Loving, Guest Room")
      end
    end
  end
end
