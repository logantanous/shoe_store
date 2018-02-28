class Ingredient < ActiveRecord::Base
  has_many :recipes
  has_many :instructions, :through => :recipes
end
