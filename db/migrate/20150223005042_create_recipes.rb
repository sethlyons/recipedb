class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :steps
      t.integer :difficulty
      t.time :prep_time
      t.time :cook_time

      t.timestamps null: false
    end
  end
end
