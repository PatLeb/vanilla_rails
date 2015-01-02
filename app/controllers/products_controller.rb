class ProductsController < ApplicationController

  before_action :load_product, only: [:update, :edit, :destroy, :show]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    respond_with @product
  end

  def update
    @product.update(product_params)
    respond_with @product
  end

  def edit
  end

  def destroy
    @product.destroy
    respond_with @product
  end

  def index
    @products = Product.all
  end

  def show
  end

  private

  def load_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end

end
