class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_products, only: [:show, :edit, :update, :destroy]

  def index
    @products = policy_scope(Product).order(created_at: :desc)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    @product.save
    redirect_to product_path(@product)
  end

  def edit
    @product.user = current_user
  end

  def update
    @product.update(product_params)

    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy

    redirect_to products_path
  end

  private

  def set_products
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :available_quantity, :user_id)
  end
end
