class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_many :order_product_vouchers, dependent: :destroy
  has_many :vouchers, through: :order_product_vouchers
end
