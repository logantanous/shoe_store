class InstructionsRecipe < ActiveRecord::Base
  belongs_to :instruction # singular, single instance of ingredient
  belongs_to :recipe # singular, single instance of recipe
end
