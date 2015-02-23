class Recipe < ActiveRecord::Base

  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes

  # capitalize the name of each recipe
  def name=(val)
    super(val.capitalize)
  end

  # ensure each recipe is only stored once
  validates_uniqueness_of :name

end
