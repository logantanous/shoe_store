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
  erb(:stores)
end

post('/stores')do
  name = params[:title]
  @store = Store.find_or_create_by({:name => name})
  @stores = Store.all
  erb(:stores)
end

get '/brands' do
  @brands = Brand.all
  erb(:brand)
end

post('/brands')do
  name = params[:title]
  @brand = Brand.find_or_create_by({:name => name})
  @brands = Brand.all
  erb(:brand)
end

get '/shoes' do
  @shoes = Item.all
  erb(:shoe)
end

post('/shoes')do
  name = params[:title]
  @shoe = Item.find_or_create_by({:name => name})
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

get '/store/:id/view' do
  @brands = Brand.all
  @stores = Store.all
  erb(:store)
end

post '/store/:id/view' do
  @store = Store.find(params.fetch("id").to_i)
  @stores = Store.all
  @brands = Brand.all - @store.brands
  @store_brands = @store.brands
  erb(:store)
end

get('/store/:id/view')do
  @store = Store.find(params.fetch("id").to_i())
  @brands = Brand.all - @store.brands
  @store_brands = @store.brands
  erb(:store)
end

patch '/store/:id/view' do
  @store = Store.find(params.fetch("id").to_i())
  brand_ids = params['brand_ids'] || [] # 'or' statement, returns empty array if no brands checked
  brand_ids.each do |brand_id|
    new_brand = Brand.find(brand_id)
    @store.brands.push(new_brand)
  end
  @brands = Brand.all - @store.brands
  @store_brands = @store.brands
  erb(:store)
end
