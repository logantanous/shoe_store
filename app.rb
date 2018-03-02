require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# home page
get('/') do
  @stores = Store.all
  @brands = Brand.all
  @shoes = Item.all
  erb(:home)
end

get '/stores' do
  @stores = Store.all
  erb(:store)
end

post('/stores')do
  name = params[:title]
  @store = Store.create({:name => name})
  @stores = Store.all
  erb(:store)
end

get '/brands' do
  @brands = Brand.all
  erb(:brand)
end

post('/brands')do
  name = params[:title]
  @brand = Brand.create({:name => name})
  @brands = Brand.all
  erb(:brand)
end

get '/shoes' do
  @shoes = Item.all
  erb(:shoe)
end

post('/shoes')do
  name = params[:title]
  @shoe = Item.create({:name => name})
  @shoes = Item.all
  erb(:shoe)
end

delete '/store/:id/delete' do
  @store = Store.find(params.fetch("id").to_i)
  @store.delete
  @stores = Store.all
  @brands = Brand.all
  @shoes = Item.all
  erb(:home)
end

patch '/store/:id/edit' do
  title = params.fetch("edit")
  @stores = Store.find(params.fetch("id").to_i())
  @stores.update({:name => title})
  @stores = Store.all
  @brands = Brand.all
  @shoes = Item.all
  erb(:home)
end

#
# post('/') do
#   new_recipe = params.fetch("recipe")
#   @recipe = Recipe.create({:name => new_recipe})
#   @recipes = Recipe.all
#   erb(:home)
# end
#
# delete('/:id') do
#   @recipe = Recipe.find(params.fetch("id").to_i)
#   @recipe.delete
#   @recipes = Recipe.all
#   erb(:home)
# end
#
# get('/recipe/:id') do
#   @recipe = Recipe.find(params.fetch("id").to_i)
#   @recipes = Recipe.all
#   @ingredients = Ingredient.all
#   @instructions = Instruction.all
#   # @tags = Tag.all
#   erb(:add_recipe)
# end
#
# post '/add_recipe/:id' do
#   @recipe = Recipe.find(params.fetch("id").to_i)
#   binding.pry
#   new_ingredient = Ingredient.new({:names => params['new_ingredient']})
#   @recipe.ingredient_id = new_ingredient.id
#   # binding.pry
#   # @ingredient_recipe = Ingredient_recipes.create({:recipe_id => @recipe.id, :ingredient_id => @ingredient.id})
#   # @ingredients = Ingredient.all
#   # @instructions = Instruction.all
#   # @tags = Tag.all
#   # @recipes = Recipe.all
#   erb(:add_recipe)
# end
#
# # add new recipe button will go to /add and show add_recipe.erb page
# post('/add') do
#   erb(:add_recipe)
# end
#
# # # subbmiting everything on /add and go to recipe_list
# # # POST TO /add_recipe url from the recipe_list
# # post('/add_recipe/:id') do
# #   @recipe = Recipe.find(params.fetch("id").to_i)
# #
# #   new_instructions = params.fetch("instructions")
# #   @instruction = Instruction.create({:description => new_instructions})
# #
# #   new_ingredients = params.fetch("ingredients")
# #   @ingredient = Ingredient.create({:names => new_ingredients})
# #
# #   new_tags = params.fetch("tag")
# #   @tag = Tag.create({:name => new_tags})
# #
# #   # new_recipe = params.fetch("name")
# #
# #   @one_recipe = Recipe.create({:name => @recipe.name, :instruction_id => @instruction.id, :ingredient_id => @ingredient.id, :tag_id => @tag.id})
# #
# #   # @ingredients = Ingredient.all
# #   # @instructions = Instruction.all
# #   # @recipes = Recipe.all
# #   # @tags = Tag.all
# #   erb(:recipe_list)
# # end
# #
# # # will show stuff in recipe_list.erb
# # get('/add_recipe') do
# #   # @ingredient = Ingredient.all
# #   # @instruction = Instruction.all
# #   @recipe = Recipe.all
# #   # @tag = Tag.all
# #   @one_recipe
# #   erb(:recipe_list)
# # end
# #
# # # display all recipes at that url using the list_recipes views
# # post '/recipe_list' do
# #   @recipe = Recipe.all
# #   erb(:list_recipes)
# # end
