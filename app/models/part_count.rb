class PartCount < ApplicationRecord

  with_options presence: true do
    with_options numericality: { only_integer: true } do
      validates :still_extant
      validates :lot
      validates :buy_point
    end
  end

  belongs_to :product_part
end
