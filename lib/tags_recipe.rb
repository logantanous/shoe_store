class TagsRecipe < ActiveRecord::Base
  belongs_to :tag # singular, single instance of ingredient
  belongs_to :recipe # singular, single instance of recipe
end
