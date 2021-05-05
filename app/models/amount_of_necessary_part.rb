class AmountOfNecessaryPart < ApplicationRecord
  belongs_to :parts
  belongs_to :products
end
