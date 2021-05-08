class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, uniqueness: true, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
