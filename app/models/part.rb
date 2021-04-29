class Part < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :material
    validates :price, format: { with: /\A[0-9]+\z/ }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :supplier_id
    end
  end   

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :number, presence: true, format: { with: VALID_PASSWORD_REGEX } 

  belongs_to :user
  has_many :amount_of_necessary_part
  has_one :parts_stock
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