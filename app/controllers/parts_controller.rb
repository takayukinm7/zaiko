class PartsController < ApplicationController
  def index 
    @parts = Part.all 
  end

  def new
    @part = Part.new
  end

  def create
    Part.create(part_params)
  end

  private
  def part_params
    params.require(:part).permit(:name, :number, :category_id, :material, :price, :supplier_id)
  end

end
