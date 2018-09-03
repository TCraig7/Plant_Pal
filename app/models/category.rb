class Category < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :plant_categories, dependent: :destroy
  has_many :plants, through: :plant_categories

  def to_s
    name
  end
end
