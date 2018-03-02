require('rspec')
require('spec_helper')
require('pry')
require('pg')

describe(Item) do
  it { should have_many(:brands).through(:brands_items) }
end
