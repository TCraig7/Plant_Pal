require 'rails_helper'

describe Plant, type: :model do
  describe 'validatations' do
    it {should validate_presence_of(:species)}
    it {should validate_presence_of(:amount_of_water)}
    it {should validate_presence_of(:amount_of_sun)}
    it {should have_many(:notes)}
  end

  describe 'relationships' do
    it {should have_many(:plant_categories)}
    it {should have_many(:categories).through(:plant_categories)}
  end
end
