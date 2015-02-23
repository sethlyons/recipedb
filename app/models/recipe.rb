class Recipe < ActiveRecord::Base

  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients

  # capitalize the name of each recipe
  def name=(val)
    super(val.capitalize)
  end

  # ensure each recipe is only stored once
  validates_uniqueness_of :name

end
