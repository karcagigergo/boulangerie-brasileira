class OrdersController < ApplicationController
  # before_action :check_basket, only: [:create]
  before_action :set_orders, only: [:destroy]
  skip_before_action :verify_authenticity_token

  def create
    # if the user has no basket, create one, if user has basket, get the basket id
    current_user.basket ? basket = current_user.basket : basket = Basket.create(user: current_user)
    @order = Order.new
    @order.basket = basket
    @order.product = Product.find(params[:product_id])
    @order.quantity = params[:quantity].to_i
    authorize @order
    create_respond_action
  end

  def destroy
    @order.destroy
    authorize @order
    redirect_to basket_path(current_user.basket)
  end

  private

  def set_orders
    @order = Order.find(params[:id])
  end

  def create_respond_action
    respond_to do |format|
      if @order.save
        format.html { redirect_to basket_path(@order.basket) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
end
