class CountForm
  include ActiveModel::Model
  attr_accessor :part_id, :product_id, :count

  with_options presence: true do
    with_options numericality: { only_integer: true } do
      validates :count
    end
  end

  def save
    product_part = ProductPart.create(product_id: product_id, part_id: part_id)
    PartCount.create(count: count, product_part_id: product_part.id)
  end
end