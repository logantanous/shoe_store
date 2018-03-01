require('rspec')
require('spec_helper')
require('pry')
require('pg')

describe(Tag) do
  it { should have_and_belong_to_many :recipes }
end
