class ChangeTagsName < ActiveRecord::Migration[5.1]
  def change
    rename_table :tags_recipes, :recipes_tags
  end
end
