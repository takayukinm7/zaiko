class PartStocksController < ApplicationController
  def index
    @part = Part.find(params[:id])
  end

  def new
    @part_stock = PartStock.new
  end

  def create
    @part_stock = PartStock.new(part_stock_params)
    if @part_stock.save
      redirect_to root_path
    else
      render :new
    end
  end

private

  def part_stock_params
    params.require(:part_stock).permit(:still_extant, :lot, :buy_point).merge(part_id: params[:part_id])
  end

end