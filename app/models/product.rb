class Product < ApplicationRecord
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  has_many :cart_items , dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  has_many :product_sizes, dependent: :destroy
  has_many :sizes, through: :product_sizes
  has_many :images, dependent: :destroy
end
