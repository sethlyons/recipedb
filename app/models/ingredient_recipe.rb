class IngredientRecipe < ActiveRecord::Base

  self.table_name = "ingredients_recipes"

  belongs_to :ingredient
  belongs_to :recipe

end
