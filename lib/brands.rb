class Brand < ActiveRecord::Base
  has_many :brands_stores # points to join table
  has_many :stores, through: :brands_stores # links
  before_save(:fix)
  validates(:name, {:uniqueness => true, :presence => true, :length => { :maximum => 100 }})
  
    scope(:not_done, -> do
      where({:done => false})
    end)

  private

    def fix
      # self.name=self.name.capitalize
    end

  end
