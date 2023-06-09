class ProductsController < ApplicationController
  before_action :current_product, only: [:show, :edit, :destroy, :update]
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end
  

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  def product_params
    params.require(:product).permit(:name)
  end
  def current_product
    @product = Product.find(params[:id])
  end
end
