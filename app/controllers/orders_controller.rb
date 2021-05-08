class OrdersController < ApplicationController
  # before_action :check_basket, only: [:create]
  before_action :set_orders, only: [:destroy]

  def create
    #has the user a basket already?
    #if the user has no basket, create one
    #if user has basket, get the basket id

    if current_user.basket
      basket = current_user.basket
    else
      basket = Basket.create(user: current_user)
    end

    order = Order.new
    order.basket = basket
    order.product = Product.find(params[:product_id])

    if order.save
      redirect_to products_path
    else
      render 'products/show'
    end
  end

  def destroy
    order.destroy

    redirect_to products_path
  end



 private

  def set_orders
    order = Order.find(params[:id])
  end

end