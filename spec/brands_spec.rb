require('rspec')
require('spec_helper')
require('pry')
require('pg')

describe(Brand) do
  it { should have_many(:stores).through(:brands_stores) }
  it { should have_many(:items).through(:brands_items) }   
end
