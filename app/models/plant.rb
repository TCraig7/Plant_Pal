class Plant < ApplicationRecord
  validates_presence_of :species, :amount_of_water, :amount_of_sun
end
