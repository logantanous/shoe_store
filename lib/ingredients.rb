class Ingredient < ActiveRecord::Base
  # validates(:ingredient, {:presence => true})
  has_many :ingredientsrecipes
  has_many :recipes, through: :ingredientsrecipes
end
