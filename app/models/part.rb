class Part < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to :user
  has_many :product_parts, dependent: :destroy
  has_many :products, through: :product_parts
  has_one :part_stock
  has_one_attached :image

  belongs_to :category
  belongs_to :supplier

  def self.search(search)
    if search != ""
      Part.where('text LIKE(?)', "%#{search}%")
    else
      Part.all 
    end
  end

end