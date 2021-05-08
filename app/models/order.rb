class Order < ApplicationRecord
  belongs_to :basket
  belongs_to :product
  validates :product_id, uniqueness: { scope: :basket_id, message: "is already in the basket" }
end
