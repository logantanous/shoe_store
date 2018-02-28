class Recipe < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :tag
  belongs_to :instruction
end
