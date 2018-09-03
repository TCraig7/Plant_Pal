class Plant < ApplicationRecord
  validates_presence_of :species, :amount_of_water, :amount_of_sun
  has_many :notes, dependent: :destroy
  has_many :plant_categories
  has_many :categories, through: :plant_categories

  def category_list
    self.categories.collect do |category|
      category.name
    end.join(", ")
  end

  def category_list=(categories_string)
    category_names = categories_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name) }
    self.categories = new_or_found_categories
  end
end
