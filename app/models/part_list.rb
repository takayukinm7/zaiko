class PartList < ApplicationRecord
  belongs_to :product
  has_many :product_parts, dependent: :destroy
  has_many :parts, through: :product_parts
end
