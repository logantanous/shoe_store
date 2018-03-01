require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**.*.rb')
require('./lib/recipes')
require('./lib/instructions')
require('./lib/ingredients')
require('./lib/tags')
require('pry')
require('pg')
# home page
get('/') do
  erb(:home)
end

# add new recipe button will go to /add and show add_recipe.erb page
post('/add') do
  erb(:add_recipe)
end

# subbmiting everything on /add and go to recipe_list
# POST TO /add_recipe url from the recipe_list
post('/add_recipe') do
  new_instructions = params.fetch("instructions")
  @instruction = Instruction.create({:description => new_instructions})

  new_ingredients = params.fetch("ingredients")
  @ingredient = Ingredient.create({:names => new_ingredients})

  new_tags = params.fetch("tag")
  @tag = Tag.create({:name => new_tags})

  new_recipe = params.fetch("name")

  @one_recipe = Recipe.create({:name => new_recipe, :instruction_id => @instruction.id, :ingredient_id => @ingredient.id, :tag_id => @tag.id})

  # @ingredients = Ingredient.all
  # @instructions = Instruction.all
  # @recipes = Recipe.all
  # @tags = Tag.all
  erb(:recipe_list)
end

# will show stuff in recipe_list.erb
get('/add_recipe') do
  # @ingredient = Ingredient.all
  # @instruction = Instruction.all
  @recipe = Recipe.all
  # @tag = Tag.all
  @one_recipe
  erb(:recipe_list)
end

# display all recipes at that url using the list_recipes views
post '/recipe_list' do
  @recipe = Recipe.all
  erb(:list_recipes)
end
