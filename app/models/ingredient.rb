class Ingredient < ActiveRecord::Base

  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes

  # capitalize the name of each ingredient
  def name=(val)
    super(val.capitalize)
  end

  # ensure each ingredient is only stored once
  validates_uniqueness_of :name
end
