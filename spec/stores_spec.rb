require('rspec')
require('spec_helper')
require('pry')
require('pg')

describe(Store) do
  it { should have_many(:brands).through(:brands_stores) }
end
