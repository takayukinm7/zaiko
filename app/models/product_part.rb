class ProductPart < ApplicationRecord
  belongs_to :parts
  belongs_to :products
  has_one :part_count
end
