class CreateConnector < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredientsrecipes) do |i|
      i.column(:ingredient_id, :integer)
      i.column(:recipe_id, :integer)

      i.column(:amount, :string)

      i.timestamps()
    end
    create_table(:tagsrecipes) do |i|
      i.column(:tag_id, :integer)
      i.column(:recipe_id, :integer)

      i.timestamps()
    end
    create_table(:instructionsrecipes) do |i|
      i.column(:instruction_id, :integer)
      i.column(:recipe_id, :integer)

      i.timestamps()
    end
  end
end
