require 'test_helper'

class IngredientTest < ActiveSupport::TestCase

  test "it should be capitalize all ingredients regardless of input" do
    d = Ingredient.new(name: "onion")
    assert_equal("Onion", d.name)
  end

  test "it should not allow duplicate ingredients" do
    d = Ingredient.new(name: "Onion")
    e = Ingredient.new(name: "Onion")
    d.save!
    assert_raises(ActiveRecord::RecordInvalid) { e.save! }
  end
end
