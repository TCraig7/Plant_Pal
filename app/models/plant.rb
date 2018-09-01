class Plant < ApplicationRecord
  validates_presence_of :plant_species, :amount_of_water, :amount_of_sun
end
