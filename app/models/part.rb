class Part < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name
    validates :number
    validates :material
    validates :price ,numericality: { only_integer: true } 
    with_options numericality: { other_than: 1 , message: "を選択してください"} do
      validates :category_id
      validates :supplier_id
    end
  end

  belongs_to :user
  has_many :product_parts, dependent: :destroy
  has_many :part_lists, through: :product_parts
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