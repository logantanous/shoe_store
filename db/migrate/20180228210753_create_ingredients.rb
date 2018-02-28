class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredients) do |i|
      i.column(:names, :string)

      i.timestamps()
 end
  end
end
