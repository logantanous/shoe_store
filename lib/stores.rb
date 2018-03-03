class Store < ActiveRecord::Base
  has_many :brands_stores # points to join table
  has_many :brands, through: :brands_stores # links
  validates(:name, {:uniqueness => true, :presence => true, :length => { :maximum => 100 }})

end
