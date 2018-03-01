class Instruction < ActiveRecord::Base
  # validates(:instruction, {:presence => true})  
  has_many :instructionsrecipes
  has_many :instructions, :through => :instructionsrecipes
end
