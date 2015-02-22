class Ingredient < ActiveRecord::Base

  # capitalize the name of each ingredient
  def name=(val)
    super(val.capitalize)
  end

  # ensure each ingredient is only stored once
  validates_uniqueness_of :name
end
