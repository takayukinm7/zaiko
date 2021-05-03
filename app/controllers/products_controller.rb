class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]


  def index
    @product = Product.includes(:user).order("create_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
  end

  def edit
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
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

end
