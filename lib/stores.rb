class Store < ActiveRecord::Base
  has_many :brands_stores # points to join table
  has_many :brands, through: :brands_stores # links
  # validates(:title, :presence => true)
  # before_save(:downcase_title)

# private
#   def downcase_title
#     self.title=(title().downcase)
#   end

end
