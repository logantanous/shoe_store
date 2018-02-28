class CreateInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table(:instructions) do |i|
      i.column(:description, :string)

      i.timestamps()
end
  end
end
