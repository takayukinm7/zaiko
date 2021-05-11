class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @products = Product.includes(:user).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render action: :new
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
  end

  def edit

  end

  def update
    product = Product.find(params[:id])
    if @product.save
      redirect_to products_path
    else
      render action: :edit
    end
  end

  def show
  end

  def search
    @products = Product.search(params[:keyword])
  end

  private
  def product_params
    params.require(:product).permit(:name).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end

