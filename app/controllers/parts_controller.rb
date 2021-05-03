class PartsController < ApplicationController
  before_action :set_part, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index 
    @parts = Part.includes(:user).order("created_at DESC")
  end

  def new
    @part = Part.new
  end

  def create
    @part = Part.create(part_params)
    if @part.save
      redirect_to root_path
    else
      render 'new'
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

  def set_part
    @part = Part.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
