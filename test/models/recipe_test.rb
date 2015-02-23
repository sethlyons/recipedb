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
end
