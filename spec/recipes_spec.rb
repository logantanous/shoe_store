require('rspec')
require('spec_helper')
require('pry')
require('pg')

describe(Recipe) do
  it { should belong_to(:ingredient) }
  it { should belong_to(:tag) }
  it { should belong_to(:instruction) }
end
