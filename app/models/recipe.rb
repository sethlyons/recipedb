class Recipe < ActiveRecord::Base

  # capitalize the name of each recipe
  def name=(val)
    super(val.capitalize)
  end

  # ensure each recipe is only stored once
  validates_uniqueness_of :name

end
