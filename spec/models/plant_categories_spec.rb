require 'rails_helper'

describe PlantCategory, type: :model do
  describe 'relationships' do
    it {should belong_to(:plant)}
    it {should belong_to(:category)}
  end
end
