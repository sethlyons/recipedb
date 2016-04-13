class CreateIngredientRecipes < ActiveRecord::Migration
  def change
    create_table :ingredient_recipes do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true
      t.string :quantity, null: false
      t.timestamps null: false
    end
  end
end
