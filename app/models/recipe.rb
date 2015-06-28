class Recipe < ActiveRecord::Base

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :ingredients

  # capitalize the name of each recipe
  def name=(val)
    super(val.capitalize)
  end

  def self.name2id(name)
    r = Recipe.find_by_name(name)
    return r.id
  end

  def get_ingredients
    r = Recipe.find_by_id(self.id)
    ri = r.recipe_ingredient_ids

    ri_names = []
    ri.each do |ri_id|
      ing_name = RecipeIngredient.find_by_id(ri_id).ingredient.name
      ri_names << ing_name
    end

    return ri_names
  end

  # ensure each recipe is only stored once
  validates_uniqueness_of :name

end
