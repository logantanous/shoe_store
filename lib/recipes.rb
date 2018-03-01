class Recipe < ActiveRecord::Base
  has_many :ingredientsrecipes
  has_many :ingredients, through: :ingredientsrecipes

  has_many :instructionsrecipes
  has_many :instructions, through: :instructionsrecipes

  has_many :tagsrecipes
  has_many :tags, through: :tagsrecipes
end
