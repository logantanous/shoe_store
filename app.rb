require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# home page
get('/') do
  @recipes = Recipe.all
  erb(:home)
end

post('/') do
  new_recipe = params.fetch("recipe")
  @recipe = Recipe.create({:name => new_recipe})
  @recipes = Recipe.all
  erb(:home)
end

delete('/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  @recipe.delete
  @recipes = Recipe.all
  erb(:home)
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  @recipes = Recipe.all
  erb(:add_recipe)
end

# # add new recipe button will go to /add and show add_recipe.erb page
# # post('/add') do
# #   erb(:add_recipe)
# # end
#
# # subbmiting everything on /add and go to recipe_list
# # POST TO /add_recipe url from the recipe_list
# post('/add_recipe/:id') do
#   @recipe = Recipe.find(params.fetch("id").to_i)
#
#   new_instructions = params.fetch("instructions")
#   @instruction = Instruction.create({:description => new_instructions})
#
#   new_ingredients = params.fetch("ingredients")
#   @ingredient = Ingredient.create({:names => new_ingredients})
#
#   new_tags = params.fetch("tag")
#   @tag = Tag.create({:name => new_tags})
#
#   # new_recipe = params.fetch("name")
#
#   @one_recipe = Recipe.create({:name => @recipe.name, :instruction_id => @instruction.id, :ingredient_id => @ingredient.id, :tag_id => @tag.id})
#
#   # @ingredients = Ingredient.all
#   # @instructions = Instruction.all
#   # @recipes = Recipe.all
#   # @tags = Tag.all
#   erb(:recipe_list)
# end
#
# # will show stuff in recipe_list.erb
# get('/add_recipe') do
#   # @ingredient = Ingredient.all
#   # @instruction = Instruction.all
#   @recipe = Recipe.all
#   # @tag = Tag.all
#   @one_recipe
#   erb(:recipe_list)
# end
#
# # display all recipes at that url using the list_recipes views
# post '/recipe_list' do
#   @recipe = Recipe.all
#   erb(:list_recipes)
# end
