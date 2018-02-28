class Recipe < ActiveRecord::Base
  belongs_to :ingredients
  belongs_to :tags
  belongs_to :instructions
end
