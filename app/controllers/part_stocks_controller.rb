class PartStocksController < ApplicationController
  def index
    @part = Part.find(params[:part_id])
    load_stock
    load_today
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

  def edit
    load_stock
  end

  def update
    load_stock
    if part_stock.update(part_stock_params)
      redirect_to part_part_stocks_path(@part)
    else
      render :edit
    end
  end

private

  def part_stock_params
    params.require(:part_stock).permit(:still_extant, :lot, :buy_point).merge(part_id: params[:part_id])
  end

  def load_stock
    @part_stock = PartStock.find(params[:part_id])
  end

  def load_today
    @today = Date.current.strftime('%Y/%m/%d')
  end
end