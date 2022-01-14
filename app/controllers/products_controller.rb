require "open-uri"
require "json"
class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_products, only: %I[show edit update destroy]

  def index
    @products = policy_scope(Product).order(created_at: :desc)
  end

  def show
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    seed
    @product.save
    redirect_to product_path(@product)
  end

  def edit
    authorize @product
    @product.photo = nil
    @product.user = current_user
    seed
  end

  def update
    authorize @product
    @product.update(product_params)
    authorize @product
    redirect_to product_path(@product)
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to products_path
  end

  private

  def seed
    return parsing_unsplash_picture unless @product.photo.attached?
  end

  def set_products
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :available_quantity, :user_id, :photo)
  end

  def parsing_unsplash_picture
    file_serialized = URI.open("https://api.unsplash.com/search/photos?query=#{@product.name}&client_id=d77PusuQGAIyMMG4_Fy__3Kguy6kZ9IRW98_HTCngNc").read
    file_full = JSON.parse(file_serialized)
    file = URI.parse(file_full["results"][0]["urls"]["small"]).open
    @product.photo.attach(io: file, filename: '', content_type: 'image/png')
  end
end
