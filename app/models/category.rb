class Category < ApplicationRecord
  validates_presence_of :name
  has_many :plant_categories
  has_many :plants, through: :plant_categories
end
