require 'rails_helper'

describe Note, type: :model do
  describe 'validations' do
    it {should belong_to(:plant)}
  end
end
