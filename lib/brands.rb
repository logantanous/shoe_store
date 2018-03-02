class Brand < ActiveRecord::Base
  has_many :brands_stores # points to join table
  has_many :stores, through: :brands_stores # links
  has_many :brands_items # points to join table
  has_many :items, through: :brands_items # links
  # validates :name, format: { with: /[a-zA-Z]/,
  #   message: "letters only, please" }
end
