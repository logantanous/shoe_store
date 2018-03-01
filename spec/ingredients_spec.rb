require('rspec')
require('spec_helper')
require('pry')
require('pg')
require('ingredients')
require('recipes')

describe(Ingredient) do
  it { should have_and_belong_to_many :recipes }
end
