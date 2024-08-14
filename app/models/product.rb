class Product < ApplicationRecord
  include ::Ransackable

  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  has_many :cart_items , dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  has_many :product_sizes, dependent: :destroy
  has_many :sizes, through: :product_sizes
  has_many :images, dependent: :destroy

  validates :name , presence: true, uniqueness: true
  validates :description, presence: true
  validates :discount_percentage, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }
  validates :discontinued, inclusion: { in: [true, false] }

  def price
    # puts "this is the product_size: #{object.product_sizes.to_a}"
    product_sizes.where('quantity > ?',0).order(:price).first&.price
  end
end
