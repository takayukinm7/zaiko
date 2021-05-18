class StockForm
  include ActiveModel::Model
  attr_accessor :name, :number, :category_id, :material, :price, :supplier_id, :user_id, :still_extant, :lot, :buy_point

  with_options presence: true do
    validates :name
    validates :number
    validates :material
    validates :price ,numericality: { only_integer: true } 
    with_options numericality: { other_than: 1 , message: "を選択してください"} do
      validates :category_id
      validates :supplier_id
    end
    with_options numericality: { only_integer: true } do
      validates :price
      validates :still_extant
      validates :lot
      validates :buy_point
    end
  end
  
  #def initialize(attributes = nil, part: Part.new)
    #@part = part
    #attributes ||= default_attributes
    #super(attributes)
  #end

  def to_model
    @part
  end

  def save
    part = Part.create(user_id: user_id, name: name, number: number, material: material, price: price, category_id: category_id, supplier_id: supplier_id)
    PartStock.create(part_id: part.id, still_extant: still_extant, lot: lot, buy_point: buy_point)
  end

  def update
    part = Part.update(user_id: user_id, name: name, number: number, material: material, price: price, category_id: category_id, supplier_id: supplier_id)
    PartStock.update(part_id: part.id, still_extant: still_extant, lot: lot, buy_point: buy_point)
  end

  private

  attr_reader :part

  def default_attributes
    {
      #name: @part.name,
      #number: @part.number,
      #material: @part.material,
      #price: @part.price,
      #category_id: @part.category_id,
      #supplier_id: @part.supplier_id,
      #still_extant: @part.part_stock.(:still_extant),
      #lot: @part_stock.lot,
      #buy_point: @part_stock.buy_point
    }
  end
end
