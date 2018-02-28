require('rspec')
require('spec_helper')
require('pry')
require('pg')


# describe(Instruction) do
#   it("has many recipes") do
#     instruction = Instruction.create({:description => "description"})
#     recipe1 = Recipe.create({:name => "recipe1", :instruction_id => instruction.id})
#     recipe2 = Recipe.create({:name => "recipe2", :instruction_id => instruction.id})
#     expect(instruction.recipes()).to(eq([recipe1, recipe2]))
#   end
# end
describe(Tag) do
  it { should have_many(:recipes) }
end
