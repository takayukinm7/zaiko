class Product < ApplicationRecord

  with_options presence: true do
    validates :name
  end

  belongs_to :user
  has_many :amount_of_necessary_part

  def self.search(search)
    if search != ""
      Product.where('text LIKE(?)', "%#{search}%")
    else
      Product.all 
    end
  end
end
