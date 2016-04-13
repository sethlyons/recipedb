require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  test "it should be capitalize all recipes regardless of input" do
    d = Recipe.new(name: "baked ziti")
    assert_equal("Baked ziti", d.name)
  end

  test "it should not allow duplicate recipes" do
    d = Recipe.new(name: "Baked ziti")
    e = Recipe.new(name: "Baked ziti")
    d.save!
    assert_raises(ActiveRecord::RecordInvalid) { e.save! }
  end

  test "add_ingredient should create recipe_ingredients" do
    r = Recipe.create(name: "Banana split")
    i = Ingredient.create(name: "Banana")
    r.add_ingredient(i, "2 scoops")

    ri = IngredientRecipe.where(recipe_id: r.id, ingredient_id: i.id).first
    assert_not_equal(ri, nil)
    assert_equal(ri.quantity, "2 scoops")
  end

  test "an ingredient can only exist once per recipe" do
    r = Recipe.create(name: "Banana split")
    i = Ingredient.create(name: "Banana")
    r.add_ingredient(i, "2 scoops")
    assert_raises(ActiveRecord::RecordInvalid) { r.add_ingredient(i, "2 scoops") }
  end

  test "it should allow steps to be entered" do
    r = Recipe.new
    r.name = "Banana split"
    r.steps = "Step 1; step 2; step3"
    assert r.save
  end

#  test "it should allow difficulty to be entered" do
#    r = Recipe.new
#    r.name = "Banana split"
#    r.difficulty = 1
#    assert r.save

#    r.difficulty = "foo"
#    assert_raises(ActiveRecord::RecordInvalid) { r.save! }
#  end
end
