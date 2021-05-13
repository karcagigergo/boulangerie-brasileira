class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  has_one_attached :photo
end
