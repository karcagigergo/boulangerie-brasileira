class Order < ApplicationRecord
  # before_validation :create_basket, if: :basket_exists?
  belongs_to :basket
  belongs_to :product

  # private

  # def create_basket
  #   binding.pry
  #   Basket.create(user_id: current_user.id, status: true)
  # end

  # def basket_exists?
  #   !self.basket
  # end
end
