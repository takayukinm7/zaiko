class Product < ApplicationRecord

  with_options presence: true do
    validates :name
  end

  belongs_to :user
  has_one :part_list
  

  def self.search(search)
    if search != ""
      Product.where('text LIKE(?)', "%#{search}%")
    else
      Product.all 
    end
  end
end