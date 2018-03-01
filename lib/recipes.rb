class Recipe < ActiveRecord::Base
  validates(:name, :presence => true)
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :instructions
  has_and_belongs_to_many :tags
end
