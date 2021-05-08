class BasketsController < ApplicationController
  before_action :set_baskets, only: [:show, :update, :destroy]

  def show
  end

  def update
    @basket.update(basket_params)

    redirect_to basket_path(@basket)
  end

  def destroy
    @basket.destroy

    redirect_to products_path
  end

  private

  def set_baskets
    @basket = Basket.find(params[:id])
  end

  def basket_params
    params.require(:basket).permit(:status, :user_id)
  end
end
