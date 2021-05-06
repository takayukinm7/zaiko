class Product < ApplicationRecord

  with_options presence: true do
    validates :name
  end

  belongs_to :user
  has_many :product_parts, dependent: :destroy
  has_many :parts, through: :product_parts
  

  def self.search(search)
    if search != ""
      Product.where('text LIKE(?)', "%#{search}%")
    else
      Product.all 
    end
  end
end