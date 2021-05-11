class PartListsController < ApplicationController
  before_action :set_product, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @products = Product.includes(:user).order("created_at DESC")
  end

  def new
    @count_form = Product.new
  end
  
  def create
    @count_form = CountForm.new(count_form_params)
        if @count_form.valid?
          @count_form.save
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
      binding.pry
      @product.update(product_params)
      
    end
  
    def show
    end
  
    def search
      @products = Product.search(params[:keyword])
    end
  
    private
  
    def count_form_params
      params.require(:count_form).permit(:naem, :count).merge(product_id: product_id, part_id: part_ids: [])
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
end
