class Tag < ActiveRecord::Base
  # validates(:tag, {:presence => true})
  has_many :tagsrecipes
  has_many :recipes, through: :tagsrecipes
end
