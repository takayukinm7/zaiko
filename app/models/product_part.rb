class ProductPart < ApplicationRecord
  belongs_to :parts
  belongs_to :paer_lists
  has_one :part_count
end
