class Plant < ApplicationRecord
  validates_presence_of :species, :amount_of_water, :amount_of_sun
  has_many :notes, dependent: :destroy
  has_many :plant_categories
  has_many :categories, through: :plant_categories
end
