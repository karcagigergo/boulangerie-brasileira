class ProductsController < ApplicationController
require "open-uri"
require "json"

  skip_before_action :authenticate_user!, only: :index
  before_action :set_products, only: [:show, :edit, :update, :destroy]

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
    @product.user = current_user
    seed
    @product.save!

    redirect_to product_path(@product)
  end

  def edit
    @product.photo = nil
    @product.user = current_user
    seed
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

  def seed
    if !@product.photo.attached?

      file_serialized = URI.open("https://api.unsplash.com/search/photos?query=#{@product.name}&client_id=d77PusuQGAIyMMG4_Fy__3Kguy6kZ9IRW98_HTCngNc").read
      file_full = JSON.parse(file_serialized)
      file = URI.open(file_full["results"][0]["urls"]["small"])
      @product.photo.attach(io: file, filename: '', content_type: 'image/png')
    end
  end

  def set_products
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :available_quantity, :user_id, :photo)
  end
end
