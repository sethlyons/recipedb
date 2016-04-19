class Recipe < ActiveRecord::Base

  has_many :ingredient_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredient_recipes

  validates_uniqueness_of :name
  validates_numericality_of :difficulty, only_integer: true,
                                         greater_than_or_equal_to: 1,
                                         less_than_or_equal_to: 5
  validates_numericality_of :prep_time, :cook_time, only_integer: true,
                                                    greater_than_or_equal_to: 1

  # capitalize the name of each recipe
  def name=(val)
    super(val.capitalize)
  end

  def add_ingredient(ingredient, quantity)
    ri = IngredientRecipe.new
    ri.ingredient = ingredient
    ri.quantity = quantity
    ri.recipe = self
    ri.save!
  end
end
