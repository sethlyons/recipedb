class Ingredient < ActiveRecord::Base

  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes

  validates_uniqueness_of :name

  # capitalize the name of each ingredient
  def name=(val)
    super(val.capitalize)
  end
end
