class PartStocksController < ApplicationController
  def index
    @part = Part.find(params[:id])
  end
end

private

def part_params
  params.require(:part).permit(:name, :number, :category_id, :material, :price, :supplier_id, :image).merge(user_id: current_user.id)
end

def stock_form_params
  params.require(:stock_form).permit(:name, :number, :category_id, :material, :price, :supplier_id,:still_extant, :lot, :buy_point).merge(user_id: current_user.id)
end
