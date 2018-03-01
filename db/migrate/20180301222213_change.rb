class Change < ActiveRecord::Migration[5.1]
  def change
    rename_table :ingredientsrecipes, :ingredients_recipes
    rename_table :tagsrecipes, :tags_recipes
    rename_table :instructionsrecipes, :instructions_recipes
  end
end
