require('rspec')
require('spec_helper')
require('pry')
require('pg')


describe(Recipe) do
  it { should have_and_belong_to_many(:ingredients) }
  it { should have_and_belong_to_many(:instructions) }
  it { should have_and_belong_to_many(:tags) }


  it("validates that Recipe has a name entered") do
    recipe = Recipe.new({:name => ""})
    expect(recipe.save).to(eq(false))
  end
end
