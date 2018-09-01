require 'rails_helper'

describe Plant, type: :model do
  describe 'validatations' do
    it {should validate_presence_of(:plant_species)}
    it {should validate_presence_of(:amount_of_water)}
    it {should validate_presence_of(:amount_of_sun)}
  end
end
