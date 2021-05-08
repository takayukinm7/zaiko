class PartsController < ApplicationController
  before_action :set_part, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index 
    @parts = Part.includes(:user).order("created_at DESC")
  end

  def new
    @stock_form = StockForm.new
  end

  def create
    @stock_form = StockForm.new(stock_form_params)
    if @stock_form.valid?
      @stock_form.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
    part = Part.find(params[:id])
    part.destroy
  end

  def edit
  end

  def update
    part = Part.find(params[:id])
    part.update(part_params)
  end

  def show
  end

  def search
    @parts = Part.search(params[:keyword])
  end

  private
  def part_params
    params.require(:part).permit(:name, :number, :category_id, :material, :price, :supplier_id, :image).merge(user_id: current_user.id)
  end

  def stock_form_params
    params.require(:stock_form).permit(:still_extant, :lot, :buy_point).merge(user_id: current_user.id)
  end

  def set_part
    @part = Part.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
